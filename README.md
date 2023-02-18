# Static blog

* Source files are in created in `/markdown`.
* HTML files are automatically generated in `/docs`.
* Images should be placed in `/docs/images`.


## How-to create a new entry

1. Create a file em `/markdown/posts`
2. Name it with date and slug. E.g `/markdown/posts/2050-01-01-slug-name`
3. Start it with the header (as seen below)
4. Run `./convert_md_to_html.sh` to convert the `.md` to `.html`

Header example:
```
---
title: [category] Title of the page in the index
slug: slug-as-used-in-the-file-name
date_published: 2050-01-01T17:06:26.000Z
date_updated: 2050-01-01T17:09:01.000Z
tags: any_tag, that, you_wish
---

Markdown content from here on...
```


---

## Under the bridge

### What the script ./convert_md_to_html.sh does

* sh: for each file in `/markdown`
* create the `.html` file in the same location in `/docs`
* fill the `<head>` tag using `./head_template.html` file
* write the title
* insert the image (if present)
* `cmark` it and write inside the `<body>`
* generate `index.html` with correct links


### [legacy] Parsing the Kindle highlights - ./split_awk.sh my_clippings.txt

* copy `My Clippings.txt` from Kindle to `./my_clippings.txt`
* run `./split_awk.sh my_clippings.txt`
* `BK_*` files will be created
* move the ones desired to `a_publicar` or accordingly


### [legacy] Migrate from Ghost to Markdown

1 - npm install ghost-to-md
2 - `node_modules/.bin/ghost-to-md backup.ghost.json`
