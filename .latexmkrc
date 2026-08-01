# Keep the engine and all auxiliary processors in this single project-level
# configuration. Use `latexmk -norc -r .latexmkrc main.tex` in every frontend.
$pdf_mode       = 4; # LuaLaTeX
$dvi_mode       = 0;
$postscript_mode = 0;

$lualatex = 'lualatex --synctex=1 --interaction=nonstopmode --file-line-error --halt-on-error %O %S';
$max_repeat = 10;

# The bibliography source ships with the project, so always regenerate its
# derived .bbl file and remove that file during cleanup.
$bibtex_use = 2;

# glossaries-extra creates one input/output pair for each configured glossary.
add_cus_dep('glo', 'gls', 0, 'make_project_glossaries');
add_cus_dep('acn', 'acr', 0, 'make_project_glossaries');
add_cus_dep('slo', 'sls', 0, 'make_project_glossaries');
add_cus_dep('ntn', 'not', 0, 'make_project_glossaries');

sub make_project_glossaries {
	my ($base_name, $path) = fileparse($_[0]);
	$path = '.' if $path eq '';
	my @args = ('-d', $path, $base_name);
	unshift @args, '-q' if $silent;
	return system('makeglossaries', @args);
}

# Remove Biber output and every file produced by the configured glossary/list
# processors; sources such as references.bib are never matched here.
$clean_ext .= ' acn acr alg bbl bcf blg glg glo gls ist loa not ntg ntn run.xml slg slo sls';
