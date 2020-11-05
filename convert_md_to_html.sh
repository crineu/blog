#!/bin/bash

# for MD_FILE in "markdown/posts/2015-04-23-the-fountainhead.md"
for MD_FILE in markdown/posts/*
do
     MD_META=$(sed   '8q' <"${MD_FILE}")
  MD_CONTENT=$(sed '1,8d' <"${MD_FILE}")

    TITLE=$(echo "${MD_META}" | awk 'BEGIN{FS=": "} /title/{print $2}')
  EXCERPT=$(echo "${MD_META}" | awk 'BEGIN{FS=": "} /excerpt/{print $2}')
     DATE=$(echo "${MD_META}" | awk '/date_published/{print $2}' | cut -d'T' -f1)
     YEAR=$(echo "${DATE}"    | cut -d'-' -f1)

  HTML_FILE=$(echo $MD_FILE |\
            sed -e "s/^markdown\/posts/docs\/${YEAR}/" |\
            sed -e 's/md$/html/')


  echo "Gerando arquivo ${HTML_FILE}"

  echo "<!DOCTYPE html>"   >  "${HTML_FILE}"
  echo "<html>"            >> "${HTML_FILE}"
  (cat docs/head.html | sed -e "s/__TITLE__/${TITLE}/") >> "${HTML_FILE}"
  echo ""                  >> "${HTML_FILE}"
  echo "<body>"            >> "${HTML_FILE}"
  echo '<div class="pad2y limiter content">' >> "${HTML_FILE}"
  echo ""                  >> "${HTML_FILE}"
  echo "<h2>${TITLE}</h2>" >> "${HTML_FILE}"
  echo "<p>${EXCERPT}</p>" >> "${HTML_FILE}"
  echo ""                  >> "${HTML_FILE}"
  (cmark --validate-utf8 --smart --to html <(echo "${MD_CONTENT}"))  >> "${HTML_FILE}"
  echo "</div>"            >> "${HTML_FILE}"
  echo "</body>"           >> "${HTML_FILE}"
  echo "</html>"           >> "${HTML_FILE}"
done
