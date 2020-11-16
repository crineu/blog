#!/bin/sh
awk '
BEGIN {
  print "------ START -------";
  RS="==========\n";
  FS="\n";
}
{
  livro=$1;
  data_full=$2;
  texto=$4;

  if ( texto == "" ) {
    next
  }

  nome_arquivo="BK_" livro;
  gsub(/\\"/, "", nome_arquivo); # remove aspas
  gsub(/\s/, "_", nome_arquivo); # substitui espaços
  gsub(/\W/, "", nome_arquivo);  # mantém só ASCII
  nome_arquivo=nome_arquivo ".txt";

  if ( livros[livro] == 0 ) {
    print "***", nome_arquivo;
    system("rm -f " nome_arquivo);
    system("touch " nome_arquivo);
  }
  livros[livro]++;

  # - Your Highlight on Location 432-433 | Added on Thursday, April 30, 2015 12:09:08 AM
  split($2, array_data, "y,");
  data=array_data[2];

  # print "==>", livro;
  # print "@", data;
  # print texto;
  system("echo " data  " >> " nome_arquivo);
  system("echo " texto " >> " nome_arquivo);

}
END {
  print "---- END -------"
  for (l in livros) {
		print livros[l], l;
	}
}
' $1
