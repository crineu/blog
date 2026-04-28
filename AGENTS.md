# AGENTS.md

Static blog generator hosted on GitHub Pages (`gh-pages` branch). No frameworks, build tools, or package managers — pure bash + `cmark`.

## Essential Command

```bash
./convert_md_to_html.sh
```

Run from the repo root. This is the only build step. It regenerates all HTML files in `docs/` and rewrites `docs/index.html` from scratch.

**Dependency**: `cmark` must be installed (`apt install cmark` or equivalent).

## Repository Layout

```
markdown/posts/     ← source files (authored here)
docs/               ← generated output (served by GitHub Pages)
  YYYY/             ← one dir per year, must pre-exist before build
  index.html        ← auto-generated index, do not edit manually
  images/           ← images go here, referenced relatively from posts
  styles/main.css   ← single stylesheet
head_template.html  ← <head> block template, injected into each post
kindle_extractor/   ← unrelated utility for Kindle highlights
```

## Creating a Post

1. Create a file in `markdown/posts/` named `YYYY-MM-DD-slug` or `YYYY-MM-DD-slug.md`.
2. The header **must be exactly 8 lines** (hardcoded `sed '8q'` / `sed '1,8d'`):

```
---
title: [category] Title shown in index
slug: slug-matching-filename
date_published: 2025-01-01T12:00:00.000Z
date_updated: 2025-01-01T12:00:00.000Z
tags: tag1, tag2
---
```

   That's 7 lines including the two `---` delimiters, then line 8 is blank, and content starts on line 9. Adding or removing any metadata field breaks parsing for every post.

3. Ensure the target year directory exists: `mkdir -p docs/YYYY`.
4. Run `./convert_md_to_html.sh`.

## Gotchas

- **File extension is not required**: Posts without `.md` extension work fine — `find` picks them up. The sed transform handles both cases: `.md` files get the extension replaced, extension-less files get `.html` appended. Output is always `docs/YYYY/slug.html`.
- **Index order** is reverse-alphabetical on the full filename path (`sort -r`), so the date prefix in filenames directly controls listing order.
- **Year directory must pre-exist**: the script does not `mkdir -p`; if `docs/YYYY/` is missing, the `cat > "${HTML_FILE}"` silently fails.
- **CSS path in `head_template.html`** is `../styles/main.css` (one level up from `docs/YYYY/`). The index page uses a hardcoded `styles/main.css` path (no `../`). Do not change the template's relative path.
- **`cmark` flags used**: `--validate-utf8 --smart --to html`. The `--smart` flag converts straight quotes to curly quotes and `--` to en-dashes.
- The script must be run from the repo root (`/blog/`), not from a subdirectory.
- `docs/index.html` is fully overwritten on every run — never hand-edit it.

## Kindle Extractor (Legacy)

`kindle_extractor/split_awk.sh my_clippings.txt` parses a Kindle `My Clippings.txt` export into per-book `.txt` files. Unrelated to the blog build; used to prepare raw quote material before authoring posts.
