# Optimize images in place with ImageMagick.
# - JPEG : resize longest side to <= $maxLong, quality ~82, strip metadata.
# - PNG  : resize longest side to <= $maxLong, keep PNG (alpha preserved), strip metadata.
# Writes to temp then moves back; skipped small files stay untouched.

$ErrorActionPreference = "Stop"
$magickPath = "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI"
if (-not (Test-Path (Join-Path $magickPath "magick.exe"))) {
    $magickPath = "C:\Program Files\ImageMagick-7.1.2-Q16-HDRI"
}
$magick = Join-Path $magickPath "magick.exe"

$imgDir = Join-Path $PSScriptRoot "..\images"
$tmpDir = Join-Path $env:TEMP "rbtlab-imgopt2"
if (Test-Path $tmpDir) { Remove-Item -Recurse -Force $tmpDir }
New-Item -ItemType Directory -Path $tmpDir | Out-Null

$maxLong = 1600
$jpegQuality = 82
$minBytes = 200 * 1024   # only process files above this

$specs = @()
$files = @()
Get-ChildItem -Path $imgDir -File | ForEach-Object {
    $ext = $_.Extension.ToLowerInvariant()
    if ($ext -notin @(".jpg", ".jpeg", ".png")) { return }
    if ($_.Length -lt $minBytes) { return }

    $info = & $magick identify -format "%w %h %m %[channels]" $_.FullName 2>$null
    if (-not $info) { return }
    $parts = $info -split " "
    $w = [int]$parts[0]; $h = [int]$parts[1]
    $fmt = $parts[2]
    $channels = $parts[3]

    $long = [Math]::Max($w, $h)
    $geomArgs = @()
    $needResize = $false
    if ($long -gt $maxLong) {
        $scale = $maxLong / $long
        $nw = [int][Math]::Round($w * $scale)
        $nh = [int][Math]::Round($h * $scale)
        $geomArgs = @("-resize", "${nw}x${nh}")
        $needResize = $true
    }

    $out = Join-Path $tmpDir $_.Name
    if ($ext -match "jpe?g" -and ($needResize -or $true)) {
        $args2 = @($_.FullName) + $geomArgs + @("-quality", "$jpegQuality", "-strip", $out)
        & $magick @args2 2>$null
        $sig = "jpg"
    } else {
        $args2 = @($_.FullName) + $geomArgs + @("-strip", $out)
        & $magick @args2 2>$null
        $sig = "png"
    }
    if (-not (Test-Path $out)) {
        Write-Warning "conversion failed for $($_.Name)"
        return
    }
    $afterBytes = (Get-Item $out).Length
    if ($afterBytes -lt $_.Length) {
        $files += [pscustomobject]@{
            Name      = $_.Name
            Dims      = "$($w)x$($h)"
            BeforeKB  = [int]($_.Length / 1KB)
            AfterKB   = [int]($afterBytes / 1KB)
            SavedKB   = [int]($_.Length / 1KB) - [int]($afterBytes / 1KB)
        }
    } else {
        Remove-Item $out -Force
        Write-Output "skip (no savings): $($_.Name) ($([int]($_.Length/1KB))KB)"
    }
}

# move optimized copies back
foreach ($row in $files) {
    $src = Join-Path $tmpDir $row.Name
    if (Test-Path $src) {
        Copy-Item -LiteralPath $src -Destination (Join-Path $imgDir $row.Name) -Force
    }
}

$savedKB = ($files | ForEach-Object { $_.SavedKB } | Measure-Object -Sum).Sum
"--- optimized $($files.Count) files, total savings $([int]$savedKB) KB ---"
$files | Format-Table Name, Dims, BeforeKB, AfterKB, SavedKB -AutoSize