#!/usr/bin/env perl
$out_dir = "./out";
 
$latex = 'uplatex -synctex=1 -halt-on-error -interaction=nonstopmode -file-line-error %O %S';
$bibtex = 'upbibtex %O %S';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
 
$max_repeat = 5;
$pdf_mode = 3;
 
# preview
$pvc_view_file_via_temporary = 0;
$dvi_previewer = "xdg-open %S";
$pdf_previewer = "xdg-open %S";
