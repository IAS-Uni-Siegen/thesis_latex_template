$pdf_mode = 5;
$dvi_mode = 0;
$postscript_mode = 0;


add_cus_dep('glo', 'gls', 0, 'makeglo2gls');
add_cus_dep('acn', 'acr', 0, 'makeglo2gls');
add_cus_dep('slo', 'sls', 0, 'makeglo2gls');
add_cus_dep('not', 'ntn', 0, 'makeglo2gls');
sub makeglo2gls {
        system("makeglossaries $_[0]");
}
