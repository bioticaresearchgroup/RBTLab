# Optimize images in place.
# - JPEG: cap longest side to $maxJpg, re-encode q=82 (System.Drawing).
# - PNG : cap longest side to $maxPng, keep PNG (preserves transparency).
# - Skips small files (< $minBytes) unless they are dimension-limit offenders.
# Writes to a temp dir first, then moves back over originals.

$ErrorActionPreference = "Stop"
Add-Type -AssemblyName System.Drawing

$imgDir  = Join-Path $PSScriptRoot "..\images"
$tmpDir  = Join-Path $env:TEMP "rbtlab-imgopt"
if (Test-Path $tmpDir) { Remove-Item -Recurse -Force $tmpDir }
New-Item -ItemType Directory -Path $tmpDir | Out-Null

$maxJpg  = 1600   # longest side for JPEGs
$maxPng  = 1600   # longest side for PNGs
$minBytes = 150 * 1024  # only touch files above this size
$jpegQ    = 82

$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/jpeg" }
$pngCodec  = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() | Where-Object { $_.MimeType -eq "image/png" }
$jpegParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
$jpegParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter([System.Drawing.Imaging.Encoder]::Quality, [long]$jpegQ)

function Resize-Target {
    param($img, $maxLong)
    $w = $img.Width; $h = $img.Height
    $long = [Math]::Max($w, $h)
    if ($long -le $maxLong) { return $null }
    $scale = $maxLong / $long
    $nw = [int][Math]::Round($w * $scale)
    $nh = [int][Math]::Round($h * $scale)
    return @($nw, $nh)
}

$files = @()
Get-ChildItem -Path $imgDir -File | ForEach-Object {
    $ext = $_.Extension.ToLowerInvariant()
    if ($ext -notin @(".jpg", ".jpeg", ".png")) { return }
    $bytes = $_.Length
    $img = $null
    try {
        $img = [System.Drawing.Image]::FromFile($_.FullName)
        if ($bytes -lt $minBytes) {
            $long = [Math]::Max($img.Width, $img.Height)
            $off = if ($ext -match "jpe?g") { $long -gt $maxJpg } else { $long -gt $maxPng }
            if (-not $off) { return }
        }
        if ($ext -match "jpe?g") {
            $cap = $maxJpg
        } else {
            $cap = $maxPng
        }
        # special caps for images displayed small (logos/badges)
        if ($_.Name -in @("logo.png", "logo.svg")) { $cap = 512 }
        if ($_.Name -eq "footer.png") { $cap = 1600 }
        $target = Resize-Target -img $img -maxLong $cap
        $out = Join-Path $tmpDir $_.Name
        if ($target) {
            $nw = $target[0]; $nh = $target[1]
            $bmp = New-Object System.Drawing.Bitmap($nw, $nh)
            $g = [System.Drawing.Graphics]::FromImage($bmp)
            $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
            $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
            try {
                $g.DrawImage($img, 0, 0, $nw, $nh)
            } finally {
                $g.Dispose()
            }
            if ($ext -match "jpe?g") {
                $bmp.Save($out, $jpegCodec, $jpegParams)
            } else {
                $bmp.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
            }
            $bmp.Dispose()
            $files += [pscustomobject]@{ Name = $_.Name; From = $img.Width.ToString() + "x" + $img.Height; To = $nw.ToString() + "x" + $nh; BeforeKB = [int]($bytes/1KB); AfterKB = [int]((Get-Item $out).Length/1KB) }
        } else {
            # re-encode in place (same dims) to strip metadata
            if ($ext -match "jpe?g") {
                $img.Save($out, $jpegCodec, $jpegParams)
            } else {
                $img.Save($out, [System.Drawing.Imaging.ImageFormat]::Png)
            }
            $files += [pscustomobject]@{ Name = $_.Name; From = $img.Width.ToString() + "x" + $img.Height; To = $img.Width.ToString() + "x" + $img.Height; BeforeKB = [int]($bytes/1KB); AfterKB = [int]((Get-Item $out).Length/1KB) }
        }
    } catch {
        Write-Warning "skipped $($_.Name): $($_.Exception.Message)"
    } finally {
        if ($img) { $img.Dispose() }
    }
}

# move optimized copies back into images/
foreach ($f in $files) {
    $src = Join-Path $tmpDir $f.Name
    if (Test-Path $src) {
        Copy-Item -LiteralPath $src -Destination (Join-Path $imgDir $f.Name) -Force
    }
}

$saved = ($files | Measure-Object -Property { $_.BeforeKB - $_.AfterKB } -Sum).Sum
"--- $($files.Count) files optimized, saved $([int]($saved)) KB ---"
$files | Format-Table -AutoSize