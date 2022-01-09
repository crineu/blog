#!/bin/bash
HEADER_FILE="head_template.html"
INDEX_FILE="docs/index.html"


# ----------------------------------------------
# Primeira parte do index.html
# ----------------------------------------------
HEADER=$(sed -e "s/__TITLE__/Índice/" < "${HEADER_FILE}")

INDEX_BUFFER=$(cat <<_INICIO_INDEX_
<!DOCTYPE html>
<html>
${HEADER}
<body>
  <main class="index">
	  <section class="article-list">
	    <h1>Meine blog</h1>
_INICIO_INDEX_
)


# ----------------------------------------------
# INÍCIO Laço cada arquivo Markdown em markdown/posts
#        por ordem de criação
# ----------------------------------------------
# for MD_FILE in "markdown/posts/2015-04-15-ruby-blocks-lambdas.md"
# for MD_FILE in markdown/posts/*
for MD_FILE in $(find markdown/posts -type f | sort -r)
do
  # Split source file into Metadata and Content
  MD_META=$(sed      '8q' <"${MD_FILE}")
  MD_CONTENT=$(sed '1,8d' <"${MD_FILE}")

  # Extract values
  TITLE=$(echo   "${MD_META}" | awk 'BEGIN{FS=": "} /title/{print $2}')
  EXCERPT=$(echo "${MD_META}" | awk 'BEGIN{FS=": "} /excerpt/{print $2}')
  DATE=$(echo    "${MD_META}" | awk '/date_published/{print $2}' | cut -d'T' -f1)  # 2015-02-18T20:58:49.000Z
  YEAR=$(echo    "${DATE}"    | cut -d'-' -f1)                                     # 2015-02-18
  HEADER=$(sed -e "s/__TITLE__/${TITLE}/" < "${HEADER_FILE}")
  ARTICLE=$(cmark --validate-utf8 --smart --to html <(echo "${MD_CONTENT}"))

  HTML_FILE=$(echo "${MD_FILE}" | sed -e "s/^markdown\/posts/docs\/${YEAR}/" | sed -e "s/md$/html/")
  echo "Criando ${HTML_FILE}"

  cat << _POST_ > "${HTML_FILE}"
<!DOCTYPE html>
<html>
${HEADER}
<body>
  <h1>${TITLE}<small>${DATE} - ${EXCERPT}</small></h1>
  <main>
    <article>
      ${ARTICLE}
    </article>
  </main>
</body>
</html>
_POST_


  # Cria referência em index.html
  REL_LINK=$(echo "${HTML_FILE}" | sed -e "s/^docs\///")
  INDEX_BUFFER+=$(cat <<_POST_LINK_

  <div class="article">
    <span class="date">${DATE}</span>
    <a href="${REL_LINK}">${TITLE}</a>
  </div>
_POST_LINK_
)

done
# ----------------------------------------------
# FIM Laço cada arquivo Markdown em markdown/posts
# ----------------------------------------------


# ----------------------------------------------
# Parte final do index.html
# ----------------------------------------------
INDEX_BUFFER+=$(cat <<_FIM_INDEX_
    </section>
  </main>
</body>
</html>
_FIM_INDEX_
)

echo "Criando índice em ${INDEX_FILE}"
echo "${INDEX_BUFFER}" > "${INDEX_FILE}"
