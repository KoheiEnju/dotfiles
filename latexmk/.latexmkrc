#!/usr/bin/env perl
# $out_dir = "./out";
 
$latex = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
$bibtex = 'upbibtex %O %S';
$makeindex = 'upmendex %O -o %D %S';
 
$max_repeat = 5;
$pdf_mode = 3;
