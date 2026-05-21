% IAS-thesis DOCUMENT CLASS -- version 1.1 (2025/10/08)
%% Partitially based on svmono.cls and jku.cls
%% Based on LEAthesis.cls from Paderborn University, LEA Department
%%
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{IASthesis}[2025/10/08 v1.1 IAS global LaTeX document class for theses]

\LoadClass[12pt,twoside,a4paper]{book} % Base class and page layout

\newif\ifdeutsch  % German language flag
\newif\ifenglish  % English language flag
\newif\ifonline   % Online (single-sided, header style) variant
\newif\ifdiss     % Dissertation variant
\newif\iffinal    % Final (approved) version toggle

\DeclareOption{english}{\englishtrue} % Class option to set English strings
\DeclareOption{deutsch}{\deutschtrue} % Class option to set German strings
\DeclareOption{online}{\onlinetrue}   % Optimize layout for online reading
\DeclareOption{diss}{\disstrue}       % Dissertation title page and fields
\DeclareOption{final}{\finaltrue}     % Marks final, approved dissertation
\ProcessOptions\relax                  % Apply class options

\DeclareRobustCommand*{\title}[1]{\gdef\@title{#1}}
\DeclareRobustCommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\DeclareRobustCommand*{\author}[1]{\gdef\@author{#1}}
\DeclareRobustCommand*{\date}[1]{\gdef\@date{#1}}
\ifdiss\else\DeclareRobustCommand*{\thesistype}[1]{\gdef\@thesistype{#1}}\fi
\ifdiss\else\DeclareRobustCommand*{\matrnr}[1]{\gdef\@matrnr{#1}}\fi
\DeclareRobustCommand*{\supervisora}[1]{\gdef\@supervisora{#1}}
\DeclareRobustCommand*{\supervisorb}[1]{\gdef\@supervisorb{#1}}
\ifdiss\else\DeclareRobustCommand*{\thesisnr}[1]{\gdef\@thesisnr{#1}}\fi
\ifdiss\else\DeclareRobustCommand*{\filingdate}[1]{\gdef\@filingdate{#1}}\fi
\ifdiss\DeclareRobustCommand*{\birthdate}[1]{\gdef\@birthdate{#1}}\fi
\ifdiss\DeclareRobustCommand*{\birthplace}[1]{\gdef\@birthplace{#1}}\fi
\ifdiss\DeclareRobustCommand*{\examdate}[1]{\gdef\@examdate{#1}}\fi
\ifdiss\DeclareRobustCommand*{\publicationyear}[1]{\gdef\@publicationyear{#1}}\fi
\ifdiss\DeclareRobustCommand*{\thesisnr}[1]{\gdef\@thesisnr{#1}}\fi
%

%% Language phrases
\ifenglish%
	\def\abstractname{Abstract}%
	\def\ackname{Acknowledgements}%
	\def\andname{and}%
	\def\bibname{References}%
	\def\by{by}%
	\def\lastandname{, and}%
	\def\acrname{Acronyms}%
	\def\appendixname{Appendix}%
	\def\chaptername{Chapter}%
	\def\claimname{Claim}%
	\def\conjecturename{Conjecture}%
	\def\contentsname{Contents}%
	\def\corollaryname{Corollary}%
	\def\datename{Date}%
	\def\declaration{Declaration of Authorship}%
	\def\declarationtext{I declare that I have authored this thesis independently, that I have not used other than the declared sources, and that I have explicitly marked all material (including figures and tables) which has been quoted either literally or by content from the used sources. I am aware that the use of AI-supported software tools is a (permissible) aid, the use and scope of which must be indicated. This paper was not previously presented to another examination board and has not been published.}%
	\def\definitionname{Definition}%
	\def\emailname{e-mail}%
	\def\examplename{Example}%
	\def\exercisename{Exercise}%
	\def\figurename{Fig.}%
	\def\filingdatename{Filing Date}%
	\def\forewordname{Foreword}%
	\def\glossaryname{Glossary}%
	\def\notationname{Notation}%
	\def\symbolname{Symbols}%
	\def\keywordname{{\bf Key words:}}%
	\def\indexname{Index}%
	\def\lemmaname{Lemma}%
	\def\listsname{Lists}%
	\def\contriblistname{List of contributors}%
	\def\listfigurename{List of figures}%
	\def\listtablename{List of tables}%
	\def\mailname{{\it Correspondence to\/}:}%
	\def\nomname{Nomenclature}%
	\def\noteaddname{Note added in proof}%
	\def\notename{Note}%
	\def\partname{Part}%
	\def\prefacename{Preface}%
	\def\problemname{Problem}%
	\def\proofname{Proof}%
	\def\propertyname{Property}%
	\def\propositionname{Proposition}%
	\def\questionname{Question}%
	\def\refname{References}%
	\def\remarkname{Remark}%
	\def\seename{see}%
	\def\signature{Signature}%
	\def\solutionname{Solution}%
	\def\subclassname{{\it Subject Classifications\/}:}%
	\def\supervisor{Supervisor}%
	\def\tablename{Tab.}%
	\def\thesisnrname{Thesis Nr.}%
	\def\theoremname{Theorem}%
	\def\titledepartment{Chair of Interconnected Automation Systems}%
	\def\titleinstitute{Department of Electrical Engineering and Computer Science}%
	\def\titleuniversity{University of Siegen}
\fi
%
% German section
\ifdeutsch
	\def\abstractname{Zusammenfassung}%
	\def\ackname{Danksagung}%
	\def\andname{und}%
	\def\lastandname{ und}%
	\def\appendixname{Anhang}%
	\def\acrname{Abkürzungen}%
	\def\bibname{Literaturverzeichnis}%
	\def\by{von}%
	\def\chaptername{Kapitel}%
	\def\claimname{Behauptung}%
	\def\conjecturename{Hypothese}%
	\def\contentsname{Inhaltsverzeichnis}%
	\def\corollaryname{Korollar}%
	\def\datename{Datum}%
	\def\declaration{Eidesstattliche Erklärung}%
	\def\declarationtext{Ich versichere, dass ich die vorliegende wissenschaftliche Arbeit selbstständig verfasst und keine anderen als die angegebenen Hilfsmittel verwendet habe. Die Stellen der Arbeit, die anderen Werken dem Wortlaut oder dem Sinn nach entnommen sind, wurden unter Angabe der Quelle als Entlehnung deutlich gemacht. Das gleiche gilt auch für beigegebene Skizzen und Darstellungen. Mir ist bewusst, dass die Verwendung von KI-gestützen Softwarewerkzeugen ein (zulässiges) Hilfsmittel darstellt, dessen Nutzung und dessen Umfang angegeben werden muss. Diese Arbeit hat in gleicher oder ähnlicher Form meines Wissens nach noch keiner Prüfungsbehörde vorgelegen.}%
	\def\definitionname{Definition}%
	\def\emailname{E-mail}%
	\def\examplename{Beispiel}%
	\def\exercisename{\"Ubung}%
	\def\figurename{Abb.}%
	\def\filingdatename{Einreichdatum}%
	\def\forewordname{Geleitwort}%
	\def\glossaryname{Glossar}%
	\def\notationname{Notation}%
	\def\symbolname{Liste der Symbole}%
	\def\keywordname{{\bf Schl\"usselw\"orter:}}%
	\def\indexname{Sachverzeichnis}%
	\def\lemmaname{Lemma}%
	\def\listsname{Verzeichnisse}%
	\def\contriblistname{Mitarbeiter}%
	\def\listfigurename{Abbildungsverzeichnis}%
	\def\listtablename{Tabellenverzeichnis}%
	\def\mailname{{\it Kontakt\/}:}%
	\def\nomname{Formelzeichen}%
	\def\noteaddname{Nachtrag}%
	\def\notename{Anmerkung}%
	\def\partname{Teil}%
	\def\prefacename{Vorwort}%
	\def\problemname{Problem}%
	\def\proofname{Beweis}%
	\def\propertyname{Eigenschaft}%
	\def\propositionname{Proposition}%
	\def\questionname{Frage}%
	\def\refname{Literaturverzeichnis}%
	\def\remarkname{Anmerkung}%
	\def\seename{siehe}%
	\def\signature{Unterschrift}%
	\def\solutionname{L\"osung}%
	\def\subclassname{{\it Subject Classifications\/}:}%
	\def\supervisor{Betreuer}%
	\def\tablename{Tab.}%
	\def\thesisnrname{Nummer der Arbeit}%
	\def\theoremname{Theorem}%
	\def\titledepartment{Professur für Vernetzte Automatisierungssysteme}%
	\def\titleinstitute{Department Elektrotechnik und Informatik}%
	\def\titleuniversity{Universit\"at Siegen}
\fi

%% Hyphenation
\RequirePackage[hyphens]{url} % Allow URL line breaks at hyphens

%%Graphics
\RequirePackage{graphicx,grffile} % Graphics inclusion + robust file name handling
\graphicspath{{fig/}{include/}{figures/}{images/}{../include/}{../figures/}{../images/}} % Graphics search paths
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
% Scale images if necessary, so that they will not overflow the page
% margins by default, and it is still possible to overwrite the defaults
% using explicit options in \includegraphics[width, height, ...]{}
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
\RequirePackage{epsfig} % Legacy EPS inclusion support
%\pdfminorversion=7
\RequirePackage{rotating} % Sideways figures/tables
\RequirePackage[section]{placeins}% Keep floats (figures/tables) within their respective section
\RequirePackage{lmodern,etoolbox,letltxmacro} % Latin Modern fonts, macro utilities, LaTeX macro helpers
\RequirePackage{setspace} % Line spacing control

%% Math env
\RequirePackage[sumlimits,intlimits]{amsmath}	% Mathematical typesetting
\RequirePackage{amssymb}						% AMS symbol collection
\RequirePackage{amstext}						% Text inside a formula
\RequirePackage{amsfonts}						% Additional fonts and symbols
\RequirePackage{amsxtra}						% Additional AMS features
\RequirePackage{amsopn}							% Define custom operators
\RequirePackage{amscd}							% Simple commutative diagrams
\RequirePackage{amsbsy}							% Bold mathematical symbols
\RequirePackage{bm}                     % Bold symbols in math environments
\RequirePackage[scaled]{helvet}         % Helvetica font, scaled to match the size of the main font
\RequirePackage{lipsum}                 % for dummy text
\RequirePackage{nicefrac}               % Better fractions in math mode

%% SI units
\ifdeutsch
	\RequirePackage[
		free-standing-units,
		space-before-unit,
		number-unit-product = \,,
		output-decimal-marker = {,},
		per-mode=fraction,
		separate-uncertainty = true,
		multi-part-units = repeat
	]{siunitx}
\else
	\RequirePackage[
		free-standing-units,
		space-before-unit,
		number-unit-product = \,,
		output-decimal-marker = {.},
		per-mode=fraction,
		separate-uncertainty = true,
		multi-part-units = repeat
	]{siunitx}
\fi
\DeclareSIUnit{\point}{pt} % define point unit for font sizes

%% Text settings
\RequirePackage{ifxetex,ifluatex} % Engine detection (XeTeX/LuaLaTeX)
\RequirePackage{fix-cm} % Fixes for Computer Modern fonts scaling
\RequirePackage{setspace}
\RequirePackage{enumitem} % Fine-grained list spacing and labels
\RequirePackage{datetime2} % Modern date/time formatting
\RequirePackage[T1]{fontenc} % T1 font encoding (better hyphenation)
\RequirePackage[utf8]{inputenc} % UTF-8 input (pdfLaTeX)
\RequirePackage{upquote} % Straight quotes in verbatim/tt fonts

%\RequirePackage{microtype} % Character protrusion and font expansion for nicer justification
\RequirePackage{xspace} % Smart spacing after macros
\RequirePackage{blindtext} % Dummy text for examples
\RequirePackage[parfill]{parskip} % Space between paragraphs, no indent

\RequirePackage{csquotes} % Language-aware quotation marks
\ifdeutsch
	\RequirePackage[ngerman]{babel}
\fi
\ifenglish
	\RequirePackage[english]{babel}
\fi

\RequirePackage{algorithm} % Floating algorithm environment
\RequirePackage{algpseudocode} % Pseudocode layout (algorithmicx)

\RequirePackage{xcolor} % Color definitions and usage
%--- Colorblind-friendly color palette (derived from Okabe–Ito scheme) ---

\definecolor{oiGreen}{HTML}{009E73}  % #009E73 (bluish green)
\definecolor{oiVermilion}{HTML}{CC2936}  % #CC2936 (more aggressive red)
\definecolor{oiGrey}{HTML}{5D5D5D}       % #5D5D5D (grey)

% Softer fills derived from the brand hues:
\colorlet{oiGreenFill}{oiGreen!6!white}
\colorlet{oiVermilionFill}{oiVermilion!8!white}
\colorlet{oiGreyFill}{oiGrey!8!white}

\RequirePackage[Tol, pgf]{colorblind} % Tol colorblind-friendly palette

\RequirePackage[unicode=true]{hyperref} % Hyperlinks and PDF metadata
\hypersetup{
	pdfborder={0 0 0},
	breaklinks=true
} % No frames around links by default

\RequirePackage[most]{tcolorbox} % Styled/colored boxes with breakable support
\newtcolorbox{tbox}[2][1.0]{colback=lightgray, colframe=darkgray, fonttitle=\bfseries, adjusted title=#2, boxsep=1mm, left=1mm, right=1mm, width=#1\textwidth}

\RequirePackage{xparse}          % LaTeX3 argument parsing (optional args)

% Icons (Font Awesome 5)
%   Requires TeX Live 2019+ (or equivalent). If you only have FA4, swap to \usepackage{fontawesome} and replace \faIcon{...}.
\RequirePackage{fontawesome5} % Icon fonts used in callout boxes

%--- Shared base style for example boxes (layout & typography) ---
\tcbset{
	calloutbase/.style={
			enhanced, breakable,                       % page breaks OK
			boxrule=0.6pt, arc=2pt,
			left=12mm, right=6mm, top=6pt, bottom=6pt, % room for the left icon
			colback=white, colframe=black!25,
			fonttitle=\bfseries, coltitle=black,       % black title text
			attach boxed title to top left={yshift=-2mm, xshift=2mm},
			boxed title style={colback=white, colframe=black!25},
			% Ensure comfortable list spacing inside all callout boxes
			before upper={%
					\setlist[itemize]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
					\setlist[enumerate]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
					\setlist[description]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
				}
		}
}

%--- Helper: icon overlays so the symbol appears on every segment (unbroken/first/middle/last) ---
\newcommand{\CalloutOverlay}[1]{%
	\node[anchor=west, xshift=3mm] at (frame.west) {#1};%
}
\newcommand{\FAiconsize}{\large} % tweak icon size here

%=== SUCCESS (positive) box ===
\NewTColorBox{successbox}{ O{} O{} }{%
	calloutbase,
	title={\IfNoValueTF{#2}{Success}{#2}},      % \begin{successbox}[Optional title]
	colframe=oiGreen, colback=oiGreenFill,
	borderline west={3pt}{0pt}{oiGreen},        % thick colored rule for non-color cue
	overlay unbroken={\CalloutOverlay{\textcolor{oiGreen}{\FAiconsize\faIcon{check-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiGreen}{\FAiconsize\faIcon{check-circle}}}},
	#1
}

%=== ERROR (negative) box ===
\NewTColorBox{errorbox}{ O{} O{} }{%
	calloutbase,
	title={\IfNoValueTF{#2}{Error}{#2}},        % \begin{errorbox}[Optional title]
	colframe=oiVermilion, colback=oiVermilionFill,
	borderline west={3pt}{0pt}{oiVermilion},
	overlay unbroken={\CalloutOverlay{\textcolor{oiVermilion}{\FAiconsize\faIcon{times-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiVermilion}{\FAiconsize\faIcon{times-circle}}}},
	#1
}

%=== INFO (explanatory) box ===
\NewTColorBox{infobox}{ O{} O{} }{%
	calloutbase,
	title={\IfNoValueTF{#2}{Info}{#2}},         % \begin{infobox}[Optional title]
	colframe=oiGrey, colback=oiGreyFill,
	borderline west={3pt}{0pt}{oiGrey},         % thick colored rule for non-color cue
	overlay unbroken={\CalloutOverlay{\textcolor{oiGrey}{\FAiconsize\faIcon{info-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiGrey}{\FAiconsize\faIcon{info-circle}}}},
	#1
}

\urlstyle{same}  % Keep URL font consistent with body text

\RequirePackage[backend=biber,style=ieee,giveninits=true,maxnames=15,minnames=3,natbib,autopunct,backref=false,doi=true,isbn=false,url=true,backrefstyle=three+,defernumbers=true, citestyle=numeric-comp]{biblatex} % Bibliography management (biber backend, IEEE style)

\RequirePackage[belowskip=12pt,aboveskip=4pt,figurename=\figurename,tablename=\tablename,labelfont=bf]{caption} % Caption spacing and label styles

\RequirePackage{subcaption} % Sub-figures environment and captions
\RequirePackage[countmax]{subfloat} % Alternative subfigure support

%% Tikz
\RequirePackage{pgfplots} % High-quality plots with TikZ/pgf
\usetikzlibrary{shapes, arrows, positioning, fit, calc, patterns, decorations.pathmorphing,decorations.pathreplacing,decorations.shapes,decorations.text, math} % Common TikZ libraries used across figures
\usepgfplotslibrary{groupplots}% Grouped plots; also handy with Inkscape pdf_tex imports
\pgfplotsset{compat=newest} % Use the latest pgfplots API
\RequirePackage{import} % Import subfiles while preserving paths
\newlength\fheight % Keep MATLAB plots consistently sized
\newlength\fwidth % Keep MATLAB plots consistently sized
\RequirePackage[european,straightvoltages,straightlabels,american inductors]{circuitikz} % Electrical circuit schematics

% % % % Table related features

% Define new column types to allow centering and width of each cell
\RequirePackage{array} % Extended array and tabular features
%\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}
%\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

% Tables 
\RequirePackage{tabularx, etoolbox, booktabs} % Flexible tables and professional rules
\RequirePackage{multirow} % Row spanning in tables
%\newcommand{\rarray}[1]{\renewcommand{\arraystretch}{#1}} % Slightly enlarged cells

\setlength{\emergencystretch}{3em}  % prevent overfull lines
%

%% Head and foot
\RequirePackage[includeheadfoot,top=0cm,headheight=16pt,margin=2.5cm]{geometry} % Page geometry and margins
\RequirePackage{titlesec} % Sectioning title formatting
\RequirePackage{fancyhdr} % Custom headers and footers
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\fancyhf{}
\ifonline
	\fancyhead[L]{\@author}
	\fancyhead[R]{\@shorttitle}
	\fancyhead[C]{}
	\fancyfoot[R]{}%outer
	\fancyfoot[L]{}%inner
	\fancyfoot[C]{\thepage}
	\fancypagestyle{plain}{
		\fancyhf{}
		\fancyfoot[C]{\thepage}%outer
		\renewcommand{\headrulewidth}{0pt}
	}
\else
	\fancyhead[LE]{ \thechapter~\leftmark}
	\fancyhead[RO]{ \leftmark~\thechapter}
	\fancyhead[RE,LO]{\rightmark}
	\fancyhead[C]{}
	\fancyfoot[RO,LE]{\thepage}%outer
	\fancyfoot[RE,LO]{}%inner
	\fancyfoot[C]{}
	\fancypagestyle{plain}{
		\fancyhf{}
		\fancyfoot[RO,LE]{\thepage}%outer
		\renewcommand{\headrulewidth}{0pt}
	}
\fi

\tolerance=500

\predisplaypenalty=0
\clubpenalty=10000
\widowpenalty=10000

\setlength\footnotesep{7.7\p@} % Space between footnotes

\newdimen\betweenumberspace          % dimension for space between
\betweenumberspace=5\p@               % number and text of titles
\newdimen\headlineindent             % dimension for space of
\headlineindent=2.5cc                % number and gap of running heads

\ifonline
	\def\cleardoublepage{\clearpage}

	\newcommand{\clearemptydoublepage}{%
		\clearpage}
	\newcommand{\startnewpage}{\clearpage}
\else
	\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
				\hbox{}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

	\newcommand{\clearemptydoublepage}{%
		\clearpage{\pagestyle{empty}\cleardoublepage}
	}
	\newcommand{\startnewpage}{\if@openright\clearemptydoublepage\else\clearpage\fi}
\fi

% (re)define sectioning
\setcounter{secnumdepth}{3}

\def\seccounterend{}
\def\seccountergap{\hskip\betweenumberspace}
\def\@seccntformat#1{\csname the#1\endcsname\seccounterend\seccountergap\ignorespaces}
%
\let\firstmark=\botmark
%
\@ifundefined{thechapterend}{\def\thechapterend{}}{}
%
\let\cleardoublepagebackup\cleardoublepage
%

%% Matter definitions
\newif\if@mainmatter \@mainmattertrue
\renewcommand\frontmatter{\startnewpage
	\pagestyle{fancy}
	\@mainmatterfalse\pagenumbering{roman}
	\setcounter{page}{1}
	\titleformat{\chapter}
	[display] % The paragraph shape
	{\bfseries\huge} % Format of the main text
	{} % Label is ommitted here, since it is below
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright~}
	[\vspace{1ex}\titlerule]

	\let\cleardoublepage\clearpage
}
%
\renewcommand\mainmatter{
	\let\cleardoublepage\cleardoublepagebackup
	\clearemptydoublepage
	\pagestyle{fancy}
	\@mainmattertrue
	\pagenumbering{arabic}
	\titleformat{\chapter}
	[display] % The paragraph shape
	{\bfseries\huge} % Format of the main text
	{} % Label is ommitted here, since it is below
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright \thechapter~}
	[\vspace{1ex}\titlerule]
	\let\cleardoublepage\cleardoublepagebackup
}
%
\renewcommand\backmatter{
	\pagestyle{fancy}
	\clearemptydoublepage
	\@mainmatterfalse
	\titleformat{\chapter}
	[display] % The paragraph shape
	{\bfseries\huge} % Format of the main text
	{} % Label is ommitted here, since it is below
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright~}
	[\vspace{1ex}\titlerule]

}
%

%% Indices
\makeindex
\RequirePackage[acronym, symbols, shortcuts,nopostdot,nogroupskip,section,nonumberlist]{glossaries-extra}
\renewcommand*{\glsgroupskip}{}
% Define an indexed glossary for notation (requires makeglossaries)
% File extensions: .not (input), .ntn (output), .ntg (log)
\newglossary[ntg]{notation}{not}{ntn}{Notation}
\makeglossaries

%%%%%%%%%%%%%%%%
\renewcommand\listoffigures{%
	\section*{\listfigurename}%
	\@mkboth{\MakeUppercase\listfigurename}%
	{\MakeUppercase\listfigurename}%
	\@starttoc{lof}%
}
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand\listoftables{%
	\section*{\listtablename}%
	\@mkboth{%
		\MakeUppercase\listtablename}%
	{\MakeUppercase\listtablename}%
	\@starttoc{lot}%
}
\let\l@table\l@figure

% lists environment
\newenvironment{lists}
{\clearpage
	\chapter{\listsname}
	\phantomsection\addcontentsline{toc}{section}{\listtablename}\listoftables
	\phantomsection\addcontentsline{toc}{section}{\listfigurename}\listoffigures
	\printglossary[type=\acronymtype,title=\acrname]
	\printglossary[title=\glossaryname]
	\printglossary[type=notation, title=\notationname]
	\printglossary[type=symbols]
	\printbibliography[heading=subbibintoc,title=\refname]
}{\clearpage}
%

% abstract environment
\newenvironment{abstract}
{\clearpage
	\chapter*{\abstractname}
	\thispagestyle{empty}
	\setcounter{page}{0}
}{\clearpage}

% % Appendix
\renewcommand\appendix{\par
	\stepcounter{chapter}%
	\setcounter{chapter}{1}%
	\stepcounter{section}%
	\setcounter{section}{0}%
	\setcounter{equation}{0}%
	\setcounter{figure}{0}%
	\setcounter{table}{0}%
	\setcounter{footnote}{0}%
	\pagestyle{fancy}%
	\def\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}%
	\chapter{\appendixname}%
}

%% Internal reference shortcuts
\ifenglish\newcommand{\figref}[1]{Fig.~\ref{#1}}\fi
\ifdeutsch\newcommand{\figref}[1]{Abb.~\ref{#1}}\fi

\newcommand{\tabref}[1]{Tab.~\ref{#1}}

\ifenglish\newcommand{\capref}[1]{Ch.~\ref{#1}}\fi
\ifdeutsch\newcommand{\capref}[1]{Kap.~\ref{#1}}\fi

%  special signs and characters
\RequirePackage{upgreek} % Upright Greek letters in math
\newcommand{\D}{\mathrm{d}}
\newcommand{\E}{\mathrm{e}}
\let\eul=\E
\newcommand{\I}{{\rm j}}
\let\imag=\I
\DeclareMathOperator{\exponential}{exp}
\DeclareMathOperator{\trace}{tr}
\DeclareMathOperator{\argmax}{argmax}
\DeclareMathOperator{\argmin}{argmin}
\DeclareMathOperator{\variance}{var}
\DeclareMathOperator{\T}{^{\mkern-1.5mu\mathsf{T}}} %Transpose
\newcommand{\const}{\mathrm{const}\@ifnextchar.{}{.}}

\def\vec#1{\ensuremath{\mathchoice
		{\mbox{\boldmath$\displaystyle\mathbf{#1}$}}
		{\mbox{\boldmath$\textstyle\mathbf{#1}$}}
		{\mbox{\boldmath$\scriptstyle\mathbf{#1}$}}
		{\mbox{\boldmath$\scriptscriptstyle\mathbf{#1}$}}}}%

\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{1.5\p@}

%% Table of contents
\setcounter{tocdepth}{2}

\newdimen\tocchpnum
\newdimen\tocsecnum
\newdimen\tocsectotal
\newdimen\tocsubsecnum
\newdimen\tocsubsectotal
\newdimen\tocsubsubsecnum
\newdimen\tocsubsubsectotal
\newdimen\tocparanum
\newdimen\tocparatotal
\newdimen\tocsubparanum
\tocchpnum=20\p@            % chapter {\bf 88.} \@plus 5.3\p@
\tocsecnum=22.5\p@          % section 88.8. plus 4.722\p@
\tocsubsecnum=30.5\p@       % subsection 88.8.8 plus 4.944\p@
\tocsubsubsecnum=38\p@      % subsubsection 88.8.8.8 plus 4.666\p@
\tocparanum=45\p@           % paragraph 88.8.8.8.8 plus 3.888\p@
\tocsubparanum=53\p@        % subparagraph 88.8.8.8.8.8 plus 4.11\p@
\def\calctocindent{%
	\tocsectotal=\tocchpnum
	\advance\tocsectotal by\tocsecnum
	\tocsubsectotal=\tocsectotal
	\advance\tocsubsectotal by\tocsubsecnum
	\tocsubsubsectotal=\tocsubsectotal
	\advance\tocsubsubsectotal by\tocsubsubsecnum
	\tocparatotal=\tocsubsubsectotal
	\advance\tocparatotal by\tocparanum}
\calctocindent

\def\@dottedtocline#1#2#3#4#5{%
	\ifnum #1>\c@tocdepth \else
		\vskip \z@ \@plus.2\p@
		{\leftskip #2\rightskip \@tocrmarg \advance\rightskip by \z@ \@plus 2cm
			\parfillskip -\rightskip \pretolerance=10000
			\parindent #2\relax\@afterindenttrue
			\interlinepenalty\@M
			\leavevmode
			\ifnum #1>\c@secnumdepth \@tempdima\z@ \else \@tempdima #3\fi
			%    \@tempdima #3\relax
			\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
			{#4}\nobreak
			\leaders\hbox{$\m@th
					\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
					mu$}\hfill
			\nobreak
			\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
			\par}%
	\fi}
%
\def\l@section{\@dottedtocline{1}{\tocchpnum}{\tocsecnum}}
\def\l@subsection{\@dottedtocline{2}{\tocsectotal}{\tocsubsecnum}}
\def\l@subsubsection{\@dottedtocline{3}{\tocsubsectotal}{\tocsubsubsecnum}}
\def\l@paragraph{\@dottedtocline{4}{\tocsubsubsectotal}{\tocparanum}}
\def\l@subparagraph{\@dottedtocline{5}{\tocparatotal}{\tocsubparanum}}

\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width 36mm
	\kern2.6\p@}

\newdimen\foot@parindent
\foot@parindent 10.83\p@

\footnotesep 9\p@

%%% Title Page
\def\maketitle{
	\ifdiss{
		%Title Page Master
		\newpage
		\pagestyle{empty}
		\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm}
		\null
		\begingroup
		\def\and{\unskip, }
		\parindent=\z@
		\pretolerance=10000
		\rightskip=\z@ \@plus 3cm
		%%%%%%%%%%
		\begin{center}
			\includegraphics[height=3.0cm]{Logos/Logo_Kombi_IAS_Blau}
			%\linespread{1.0}
			\sffamily
			\vfill
			{\Huge \begin{spacing}{1.1}\textbf{\\[13mm] \@title \\[15mm]}\end{spacing}}
			\vfill
			\Large{Der Naturwissenschaftlich-Technischen Fakultät}\\
			\Large{der Universität Siegen}\\[5mm]
			\large{zur Erlangung des akademischen Grades\\[5mm]
				\Large{Doktor der Ingenieurwissenschaften (Dr.-Ing.)}}\\[5mm]
			\iffinal genehmigte\ \else vorgelegte\ \fi Dissertation \\
			von \\[5mm]
			\Large{\@author} \\[5mm]
			\iffinal{
				\begin{tabular}[ht]{ll}
					\Large{Erster Gutachter:}               & \Large{\@supervisora} \\
					\Large{Zweiter Gutachter:}              & \Large{\@supervisorb} \\[5mm]
					\Large{Tag der mündlichen Prüfung:\ \ } & \Large{\@examdate}
				\end{tabular}\\[12mm]

				\Large{Siegen \@publicationyear} \\[6mm]
				\Large{Diss. \@thesisnr}
			}\else{
				\Large{geboren am \@birthdate\ in \@birthplace}
			}\fi
			\vfill
		\end{center}
		\endgroup
		\restoregeometry
		\newpage
	}\else{
		%Title Page Master
		\newpage
		\pagestyle{empty}
		\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm}
		\null
		\begingroup
		\def\and{\unskip, }
		\parindent=\z@
		\pretolerance=10000
		\rightskip=\z@ \@plus 3cm
		\begin{center}
			\includegraphics[height=3cm]{Logos/Logo_Kombi_IAS_Blau.pdf}
			\\[5ex]
			\textbf{\titleinstitute\\[.2ex]
				\titleuniversity\\[.2ex]
				\titledepartment\\[.2ex]
				\@supervisora}
			\vfill
			{\LARGE \textbf{\@thesistype} }\vskip3ex
			{\Huge \begin{spacing}{1.1} \textbf{\@title}\end{spacing}}
			\vfill
			{\Large \by}
			\vfill
			{\Large  \@author }\vskip1ex
			\ifenglish{\Large Student ID: \@matrnr }\fi
			\ifdeutsch{\Large Matr.-Nr.: \@matrnr }\fi
			\\[3cm]
			\vfill
		\end{center}
		{\large \supervisor: \@supervisorb }\vskip.1ex
			{\large \thesisnrname: \@thesisnr }\vskip.1ex
			{\large \filingdatename: \@filingdate }
		\endgroup
		\restoregeometry
		\newpage
	}\fi
}

\endinput
%end of file IASthesis.cls
