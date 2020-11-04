#!/bin/bash

# for md_file in "markdown/posts/2020-01-13-a-manifesto-for-small-teams-doing-important-work.md"
for md_file in markdown/posts/*
do
  HTML_FILE=$(echo $md_file |\
            sed -e 's/^markdown/docs/' |\
            sed -e 's/md$/html/')

  echo "Gerando arquivo ${HTML_FILE}"

  echo "<!DOCTYPE html>" >  "${HTML_FILE}"
  echo "<html>"          >> "${HTML_FILE}"
  (cat docs/head.html | sed -e 's/__TITLE__/Título_aqui?/')     >> "${HTML_FILE}"
  echo "<body>"          >> "${HTML_FILE}"
  (cmark --validate-utf8 --smart --to html <(sed '1,8d' <"${md_file}")) >> "${HTML_FILE}"
  echo "</body>"         >> "${HTML_FILE}"
  echo "</html>"         >> "${HTML_FILE}"
done