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

  echo '<!DOCTYPE html>'   >  "${HTML_FILE}"
  echo '<html>'            >> "${HTML_FILE}"
  (cat docs/head.html | sed -e "s/__TITLE__/${TITLE}/") >> "${HTML_FILE}"
  echo ''                  >> "${HTML_FILE}"
  echo '<body>'            >> "${HTML_FILE}"
  echo '<div class="pad2y limiter content">' >> "${HTML_FILE}"
  echo ''                  >> "${HTML_FILE}"
  echo "<h2>${TITLE}</h2>" >> "${HTML_FILE}"
  echo "<p>${EXCERPT}</p>" >> "${HTML_FILE}"
  echo ''                  >> "${HTML_FILE}"
  (cmark --validate-utf8 --smart --to html <(echo "${MD_CONTENT}"))  >> "${HTML_FILE}"
  echo "</div>"            >> "${HTML_FILE}"
  echo "</body>"           >> "${HTML_FILE}"
  echo "</html>"           >> "${HTML_FILE}"
done



# ----------------------------------------------
# creating the index.html file
# ----------------------------------------------
INDEX_FILE="docs/index.html"
echo "Criando índice de artigos em ${INDEX_FILE}"

echo -e "<!DOCTYPE html>" \
        "\n<html>"        > "${INDEX_FILE}"
(cat docs/head.html | sed -e "s/__TITLE__/Índice/") >> "${INDEX_FILE}"
echo -e "\n<body>"  \
        "\n\t<div class=\"pad2y limiter content writing nu\">" \
        "\n"              >> "${INDEX_FILE}"


for MD_FILE in `find markdown/posts -type f | sort -r`
do
  MD_META=$(sed '8q' <"${MD_FILE}")
  TITLE=$(echo "${MD_META}" | awk 'BEGIN{FS=": "} /title/{print $2}')
   DATE=$(echo "${MD_META}" | awk '/date_published/{print $2}' | cut -d'T' -f1)
   YEAR=$(echo "${DATE}"    | cut -d'-' -f1)

  REL_LINK=$(echo $MD_FILE |\
             sed -e "s/^markdown\/posts/${YEAR}/" |\
             sed -e 's/md$/html/')

  echo -e "\t\t"         \
          "<div><a href=\"${REL_LINK}\">${TITLE}</a></div>"   \
          '<time>'       \
          ${DATE}        \
          '</time>'      >> "${INDEX_FILE}"
done


echo -e "\n"       \
        "\t</div>" \
        "\n</body>"  \
        "\n</html>"  >> "${INDEX_FILE}"
