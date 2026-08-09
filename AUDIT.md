# RBTLab Website Audit

**Repo:** `bioticaresearchgroup/RBTLab` · **Site:** https://www.gssailaja.org
**Stack:** Jekyll 4.3.2 fork of the Greene Lab `lab-website-template`, deployed by GitHub Actions to `gh-pages`.
**Scope:** Static-source audit of the current branch (all `_includes`, `_layouts`, `_data`, `_members`, `_posts`, `_cite`, plugins, styles, workflows, config). No build was run (no Jekyll toolchain in this workspace).

---

## 1. Critical — Broken JavaScript on the homepage

`_includes/scripts.html:13-37` wraps SweetAlert2 announcement logic in `{% if page.url == "/" ... %}`. The opening `window.addEventListener('DOMContentLoaded', () => {` is **commented out** (line 15) but the closing `});` on **line 36 is live**. The resulting plain `<script>` block ends with an unmatched `});` before any statement, a syntax error.

**Impact:** Every page that loads this include runs a `<script>` with a SyntaxError. In practice the page still renders (scripts are non-blocking here), but SweetAlert2's `Swal` and the rest of the deferred inline logic are dead, and downstream scripts are at risk if order/sharing changes. It may also trip html-proofer if `proofer` is re-enabled.

**Fix:** delete the whole commented block (it was disabled in the first place):

```html
{% if page.url == "/" or page.url == "/index.html" %}
{% endif %}
```

or restore the live listener if the announcement popup is wanted again.

---

## 2. High — Repository bloat: ~43 MB of images

`images/` holds ~43 MB of JPEG/PNG, with **43 files over 200 KB**. Worst offenders:

| File | Size |
|---|---|
| navya.jpeg | 2.92 MB |
| Gemini_Generated_Image_*.png | 2.10 MB |
| project1–8.png | 1.53–1.92 MB each (8 files, ~13 MB) |
| logo.png | 1.31 MB |
| footer.png | 1.26 MB |
| G*.jpg gallery set | ~1 MB each (~5 MB) |

GitHub Pages has a **100 MB hard limit and 1 GB soft limit** for site size; the deployed site is already at the edge for a small lab site. Every page load also pays for this. Action: recompress/scale to the CSS display size (typically ≤ ~1600 px wide, quality 75–80 JPEG / WebP where possible), target < 200 KB/image.

---

## 3. High — Duplicate project cards

`_data/projects.yaml`: the first two projects (`project1`, `project2`) are listed under **both** `group: featured` and `group: ongoing`. On `projects/` they render once (featured), then **again** in the ongoing loop with the SAME thumbnails. Remove them from the `ongoing` group.

---

## 4. High — Projects page: wrong funding links

`projects/index.md` links the funding agencies, but the URLs point at the wrong agencies:

- KSCSTE → currently `https://www.dbt.gov.in` (DBT, not KSCSTE). KSCSTE is at `https://www.kscste.kerala.gov.in/`.
- DBT → currently `https://www.education.gov.in` (Ministry of Education) should be `https://dbtindia.gov.in/`.

Both rows are the top funding note on the page, so the misdirection is visible to every visitor and to review committees.

---

## 5. Medium — CITATION.cff is still the template's

`CITATION.cff` authors are the Greene Lab template maintainers with their own GitHub handles. Update `authors` / repository list to RBTLab members.

---

## 6. Medium — LICENSE.md is not a license

`LICENSE.md` contains only the line `BSD 3-Clause License` with **no license text** and no copyright holder. Replace with the full BSD-3-Clause text, or pick a proper license. As written, the repo is effectively under no explicit license.

---

## 7. Medium — README badges are broken relative links

`README.md` badges use `https://github.com/.../actions` plus a relative `../../` path form that won't render as images on the repo page. Use the absolute workflow badge URLs, e.g.:

```
![Build](https://github.com/bioticaresearchgroup/RBTLab/actions/workflows/build.yaml/badge.svg)
```

---

## 8. Medium — Example posts and members leak onto the site

- `_posts/` contains 3 template example posts (hello-world, lorem ipsum, etc.) that will publish as a blog.
- The blog pages are built but there is **no nav link** to them in `_config.yaml` navigation — so they're orphan pages, not an intentional feature.
- Delete `_posts/` if the blog is unused, or wire it into the nav.

- `_members/jane-smith.md`, `john-doe.md` and `sarah-johnson.md` are clearly-placard entries (padding?); the site has real member pages for the actual team. Remove template placeholders.

---

## 9. Low — `types.yaml`, config cosmetics, and unused data

- `_data/types.yaml` misspells `alumini1` / `alumini2` (survives, but unused; the site uses `group: alumni` in `_config`).
- `_config.yaml` still has the template placeholder line:
  `description: An engaging 1-3 sentence description of your lab.`
- `_config.yaml` `twitter: RBTLab`, `youtube: RBTLab` — verify these are the real handles, otherwise remove keys (they render as links in header/footer).
- `proofer: false` — HTML proofing is off; if the tester runs the site through html-proofer once, it flags 404 previews / dead links.

---

## 10. Info — CI / publishing

- **GitHub Action `update-citations`** runs `_cite/cite.py` on a schedule and needs `GOOGLE_SCHOLAR_API_KEY`, `ORCID_ACCESS_TOKEN` and a token with the `pages` scope. There is currently an **open unmerged PR #1 "Periodic citation update"** — the citation refresh is either not yet enabled or the workflow fails at the secret. Either add the secrets and merge, or drop that workflow if citations are maintained by hand.
- Previews build to the `gh-pages` branch per workflow `publish`.
- No lockfile drift: `Gemfile.lock` is consistent with `Gemfile`.

---

## Non-issues checked

- `_data/citations.yaml` header says "DO NOT EDIT... GENERATED" — it's the auto-updater's model; refs, release etc. are registry-intended. Not a bug.
- `_include/verification.html` is an intentional placeholder (search-engine verification hook).
- `activate`, dark-mode, search, anchors, table-wrap, tooltip, site-search, fetch-tags scripts are intact with no obvious runtime errors.
- `modal-*` styles + inline `main.scss` for the AICTE popup are consistent (CSS exists, CSS is fine).
- `redirect` to `/` works, `404.md` custom above.

---

## Suggested priority order

1. **Fix `_includes/scripts.html`** syntax error (one-line trivially).
2. **Fix the funding URLs** in `projects/index.md`.
3. **Remove duplicate projects** in `projects.yml`.
4. **Recompress images** (~43 MB → maybe ~10 MB).
5. **Relicense properly** (LICENSE file), fix CITATION_config, fix README badges, remove placeholder `_posts`/members.

Items 1–3 are small, verifiable, owner-changeable edits. Item 4 needs an image pipeline or some photo work to do well. 5 is a set of one-liner file replacements owners are often happy to see.