# Static blog

* Source files are in `/markdown`.
* HTML files are in `/docs`.
* Images are in `/docs/images`.



#### From Ghost to Markdown

1 - npm install ghost-to-md
2 - node_modules/.bin/ghost-to-md backup.ghost.json


#### convert_md_to_html.sh: **cmark**

* sh: for each file in `/markdown`
* create the `.html` file in the same location in `/docs`
* fill the `<head>` tag using `docs/header.html` file
* write the title and excerpt
* insert the image (if present)
* `cmark` it and write inside the `<body>`
* generate `index.html` with correct links


#### Images

Manually copied from ghost machine to `/docs/images`
