#!/bin/sh
awk '
BEGIN {
  # print "------ START -------";
  RS="==========\n";
  FS="\n";
}
{
  livro=$1;
  texto=$4;

  if ( texto == "" ) {
    next
  }

  nome_arquivo="BK_" livro;
  gsub(/\\"/, "", nome_arquivo);   # remove aspas
  gsub(/\s/, "_", nome_arquivo);   # substitui espaços
  gsub(/\W/,  "", nome_arquivo);   # mantém só ASCII
  nome_arquivo=nome_arquivo ".txt";

  if ( livros[livro] == 0 ) {      # visto pela 1a vez
    # print "***", nome_arquivo;
    system("rm -f " nome_arquivo);
    system("touch " nome_arquivo);
  }
  livros[livro]++;


  # - Your Highlight on Location 432-433 | Added on Thursday, April 30, 2015 12:09:08 AM
  # data_full=$2;
  # split(data_full, array_data, "day,");
  # data=array_data[2];
  # system("echo \"" data  "\" >> " nome_arquivo);
  system("echo -e \"" texto "\n\" >> " nome_arquivo);


  # print "==>", livro;
  # print "@", data;
  # print texto;
}
END {
  # print "---- END -------"
  for (l in livros) {
		print livros[l], l;
	}
}
' "$1" | sort -n
