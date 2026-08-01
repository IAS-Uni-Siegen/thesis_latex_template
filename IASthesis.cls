% IASthesis document class -- version 1.6 (2026/08/01)
% Derived in part from svmono.cls, jku.cls, and LEAthesis.cls.
\NeedsTeXFormat{LaTeX2e}[2022/06/01]
\ProvidesClass{IASthesis}[2026/08/01 v1.6 IAS global LaTeX document class for theses]

% --- Class options and base class ---
\newif\ifdeutsch
\newif\ifenglish
\newif\ifias@englishoption
\newif\ifias@deutschoption
\newif\ifonline
\newif\ifdiss
\newif\iffinal
\newif\ifiasthanks
\onlinetrue
\def\ias@medium{screen}

\DeclareOption{english}{\ias@englishoptiontrue}
\DeclareOption{deutsch}{\ias@deutschoptiontrue}
\DeclareOption{medium=screen}{\onlinetrue\def\ias@medium{screen}}
\DeclareOption{medium=print}{\onlinefalse\def\ias@medium{print}}
\DeclareOption{online}{%
	\ClassWarningNoLine{IASthesis}{Option `online' is deprecated; use `medium=screen'}%
	\onlinetrue\def\ias@medium{screen}}
\DeclareOption{diss}{\disstrue}
\DeclareOption{final}{\finaltrue}
\DeclareOption{thanks}{\iasthankstrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

% Default to English; conflicting language options raise an error and use English.
\ifias@englishoption
	\ifias@deutschoption
		\ClassError{IASthesis}{Options `english' and `deutsch' are mutually exclusive}{Choose exactly one language option. English is used when neither option is given.}%
	\fi
	\englishtrue
	\deutschfalse
\else
	\ifias@deutschoption
		\deutschtrue
		\englishfalse
	\else
		\englishtrue
		\deutschfalse
	\fi
\fi

\iffinal\ifdiss\else
		\ClassWarningNoLine{IASthesis}{Option `final' has no effect without option `diss'}%
	\fi\fi

% Screen is one-sided; print opens chapters on right-hand pages.
\ifonline
	\LoadClass[12pt,oneside,openany,a4paper]{book}
\else
	\LoadClass[12pt,twoside,openright,a4paper]{book}
\fi

% --- Thesis metadata ---
% Defaults and public setters used by title pages and PDF metadata.
\def\@shorttitle{}
\def\@thesistype{Thesis}
\def\@matrnr{}
\def\@supervisora{}
\def\@supervisorb{}
\def\@thesisnr{}
\def\@filingdate{}
\def\@birthdate{}
\def\@birthplace{}
\def\@examdate{}
\def\@publicationyear{}
\def\@thesiskeywords{}
\def\@thesissubject{}

\DeclareRobustCommand*{\title}[1]{\gdef\@title{#1}}
\DeclareRobustCommand*{\shorttitle}[1]{\gdef\@shorttitle{#1}}
\DeclareRobustCommand*{\author}[1]{\gdef\@author{#1}}
\DeclareRobustCommand*{\date}[1]{\gdef\@date{#1}}
\DeclareRobustCommand*{\keywords}[1]{\gdef\@thesiskeywords{#1}}
\DeclareRobustCommand*{\thesissubject}[1]{\gdef\@thesissubject{#1}}
\DeclareRobustCommand*{\thesistype}[1]{\gdef\@thesistype{#1}}
\DeclareRobustCommand*{\matrnr}[1]{\gdef\@matrnr{#1}}
\DeclareRobustCommand*{\supervisora}[1]{\gdef\@supervisora{#1}}
\DeclareRobustCommand*{\supervisorb}[1]{\gdef\@supervisorb{#1}}
\DeclareRobustCommand*{\thesisnr}[1]{\gdef\@thesisnr{#1}}
\DeclareRobustCommand*{\filingdate}[1]{\gdef\@filingdate{#1}}
\DeclareRobustCommand*{\birthdate}[1]{\gdef\@birthdate{#1}}
\DeclareRobustCommand*{\birthplace}[1]{\gdef\@birthplace{#1}}
\DeclareRobustCommand*{\examdate}[1]{\gdef\@examdate{#1}}
\DeclareRobustCommand*{\publicationyear}[1]{\gdef\@publicationyear{#1}}

% --- Localized strings ---
\ifenglish%
	\def\abstractname{Abstract}%
	\def\ackname{Acknowledgements}%
	\def\iassuccessname{Success}%
	\def\iaserrorname{Error}%
	\def\iasinfoname{Info}%
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
	\def\iastocheadername{Table of contents}%
	\def\corollaryname{Corollary}%
	\def\datename{Date}%
	\def\declaration{Declaration of Authorship}%
	\def\declarationtext{I declare that I have authored this thesis independently, used no sources other than those declared, and explicitly marked all material (including figures and tables) quoted either verbatim or in substance from those sources. I am aware that AI-supported software tools are permissible aids whose use and scope must be indicated. This thesis was not previously presented to another examination board and has not been published.}%
	\def\definitionname{Definition}%
	\def\emailname{e-mail}%
	\def\examplename{Example}%
	\def\exercisename{Exercise}%
	\def\figurename{Fig.}%
	\def\filingdatename{Filing Date}%
	\def\forewordname{Foreword}%
	\def\glossaryname{Glossary}%
	\def\notationname{Notation}%
	\def\iassymbolsname{Symbols}%
	\def\keywordname{{\bf Keywords:}}%
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
	\def\thesisnrname{Thesis No.}%
	\def\theoremname{Theorem}%
	\def\titledepartment{Chair of Interconnected Automation Systems}%
	\def\titleinstitute{Department of Electrical Engineering and Computer Science}%
	\def\titleuniversity{University of Siegen}
\fi
\ifdeutsch
	\def\abstractname{Zusammenfassung}%
	\def\ackname{Danksagung}%
	\def\iassuccessname{Erfolg}%
	\def\iaserrorname{Fehler}%
	\def\iasinfoname{Hinweis}%
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
	\def\iastocheadername{Inhaltsverzeichnis}%
	\def\corollaryname{Korollar}%
	\def\datename{Datum}%
	\def\declaration{Eidesstattliche Erklärung}%
	\def\declarationtext{Ich versichere, dass ich die vorliegende wissenschaftliche Arbeit selbstständig verfasst und keine anderen als die angegebenen Hilfsmittel verwendet habe. Die Stellen der Arbeit, die anderen Werken dem Wortlaut oder dem Sinn nach entnommen sind, wurden unter Angabe der Quelle als Entlehnung deutlich gemacht. Das Gleiche gilt auch für beigegebene Skizzen und Darstellungen. Mir ist bewusst, dass die Verwendung von KI-gestützten Softwarewerkzeugen ein (zulässiges) Hilfsmittel darstellt, dessen Nutzung und Umfang angegeben werden müssen. Diese Arbeit hat in gleicher oder ähnlicher Form meines Wissens nach noch keiner Prüfungsbehörde vorgelegen.}%
	\def\definitionname{Definition}%
	\def\emailname{E-Mail}%
	\def\examplename{Beispiel}%
	\def\exercisename{\"Ubung}%
	\def\figurename{Abb.}%
	\def\filingdatename{Einreichdatum}%
	\def\forewordname{Geleitwort}%
	\def\glossaryname{Glossar}%
	\def\notationname{Notation}%
	\def\iassymbolsname{Liste der Symbole}%
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
	\def\titledepartment{Professur für Interconnected Automation Systems}%
	\def\titleinstitute{Department Elektrotechnik und Informatik}%
	\def\titleuniversity{Universit\"at Siegen}
\fi

% --- Engine and URL handling ---
\RequirePackage[hyphens]{url}
\RequirePackage{iftex}
\ifLuaTeX\else
	\ClassError{IASthesis}{LuaLaTeX is required}{Compile with `latexmk`, which is configured to use LuaLaTeX.}%
\fi

% --- Graphics and floats ---
\RequirePackage{graphicx}
\graphicspath{{fig/}{include/}{figures/}{images/}{../include/}{../figures/}{../images/}}
\def\maxwidth{\ifdim\Gin@nat@width>\linewidth\linewidth\else\Gin@nat@width\fi}
\def\maxheight{\ifdim\Gin@nat@height>\textheight\textheight\else\Gin@nat@height\fi}
% Scale images without explicit dimensions to the available page area.
\setkeys{Gin}{width=\maxwidth,height=\maxheight,keepaspectratio}
\RequirePackage{setspace}

% --- Fonts and mathematics ---
\RequirePackage[sumlimits,intlimits]{amsmath}
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\setmainfont{Latin Modern Roman}
\setsansfont{TeX Gyre Heros}[Scale=MatchLowercase]
\setmonofont{Latin Modern Mono}
\setmathfont{Latin Modern Math}
\providecommand{\bm}[1]{\symbfit{#1}} % Compatibility with earlier manuscripts.

% --- Units ---
% The decimal marker follows the selected document language.
\ifdeutsch
	\RequirePackage[
		free-standing-units,
		space-before-unit,
		quantity-product = \,,
		output-decimal-marker = {,},
		per-mode=fraction,
		uncertainty-mode = separate,
		separate-uncertainty-units = repeat
	]{siunitx}
\else
	\RequirePackage[
		free-standing-units,
		space-before-unit,
		quantity-product = \,,
		output-decimal-marker = {.},
		per-mode=fraction,
		uncertainty-mode = separate,
		separate-uncertainty-units = repeat
	]{siunitx}
\fi
\DeclareSIUnit{\point}{pt}

% --- Text and language ---
\RequirePackage{enumitem}
\RequirePackage{upquote}

\RequirePackage{microtype}
\RequirePackage[parfill]{parskip}

% Load both languages for reusable auxiliary files, then configure quotations.
\ifdeutsch
	\RequirePackage[english,main=ngerman]{babel}
\else
	\RequirePackage[ngerman,main=english]{babel}
\fi
\RequirePackage{csquotes}

% --- Algorithms ---
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}
\providecommand*{\toclevel@algorithm}{1}
% Keep English list titles in sentence case, including after language switches.
\def\ias@englishlistnames{%
	\renewcommand{\listtablename}{List of tables}%
	\renewcommand{\listfigurename}{List of figures}%
	\renewcommand{\listalgorithmname}{List of algorithms}%
}
\addto\captionsenglish{\ias@englishlistnames}
\ifenglish\ias@englishlistnames\fi
\ifdeutsch\renewcommand{\listalgorithmname}{Algorithmenverzeichnis}\fi

% --- Colors ---
% High-contrast accents and light fills for diagrams and callouts.
\RequirePackage{xcolor}
\definecolor{oiGreen}{HTML}{009E73}
\definecolor{oiVermilion}{HTML}{CC2936}
\definecolor{oiGrey}{HTML}{5D5D5D}
\colorlet{oiGreenFill}{oiGreen!6!white}
\colorlet{oiVermilionFill}{oiVermilion!8!white}
\colorlet{oiGreyFill}{oiGrey!8!white}

% --- Bibliography and captions ---
\RequirePackage[backend=biber,style=ieee,giveninits=true,maxnames=15,minnames=3,backref=false,doi=true,isbn=false,url=true]{biblatex}
\RequirePackage[belowskip=12pt,aboveskip=4pt,figurename=\figurename,tablename=\tablename,labelfont=bf]{caption}

% --- PDF links and metadata ---
\RequirePackage[unicode=true]{hyperref}
\RequirePackage{bookmark}
\hypersetup{
	pdfborder={0 0 0},
	breaklinks=true,
	pdfdisplaydoctitle=true,
	bookmarksnumbered=true
}
\ifenglish
	\hypersetup{pdflang={en-US}}
\else
	\hypersetup{pdflang={de-DE}}
\fi
\ifonline
	\hypersetup{pdfpagemode=UseOutlines,pdfstartview=FitH,bookmarksopen=true}
\else
	\hypersetup{pdfpagemode=UseNone,pdfstartview=Fit}
\fi
\pdfstringdefDisableCommands{\def\\{ }\def\newline{ }}
% Avoid duplicate page anchors when front matter inserts a blank verso.
\AddToHook{cmd/frontmatter/before}{\hypersetup{pageanchor=false}}
\AddToHook{cmd/frontmatter/after}{\hypersetup{pageanchor=true}}
\AtBeginDocument{%
	\ifx\@thesissubject\@empty
		\ifdiss\def\ias@pdfsubject{Dissertation}\else\let\ias@pdfsubject\@thesistype\fi
	\else
		\let\ias@pdfsubject\@thesissubject
	\fi
	\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={\ias@pdfsubject},
		pdfkeywords={\@thesiskeywords},
		pdfcreator={LuaLaTeX with IASthesis}
	}%
}

% --- Callout boxes ---
% Shared layout with semantic colors and icons.
\RequirePackage{tcolorbox}
\tcbuselibrary{breakable,skins}

\RequirePackage{fontawesome5}

\tcbset{
	calloutbase/.style={
			enhanced, breakable,
			boxrule=0.6pt, arc=2pt,
			left=12mm, right=6mm, top=6pt, bottom=6pt,
			colback=white, colframe=black!25,
			fonttitle=\bfseries, coltitle=black,
			attach boxed title to top left={yshift=-2mm, xshift=2mm},
			boxed title style={colback=white, colframe=black!25},
			before upper={%
					\setlist[itemize]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
					\setlist[enumerate]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
					\setlist[description]{itemsep=4pt,parsep=2pt,topsep=4pt,partopsep=3pt}%
				}
	}
}

\newcommand{\CalloutOverlay}[1]{%
	\node[anchor=west, xshift=3mm] at (frame.west) {#1};%
}
\newcommand{\FAiconsize}{\large}

% The first optional argument accepts tcolorbox keys; the second retains the
% legacy custom-title form while providing a localized default.
\NewTColorBox{successbox}{ O{} O{\iassuccessname} }{%
	calloutbase,
	title={#2},
	colframe=oiGreen, colback=oiGreenFill,
	borderline west={3pt}{0pt}{oiGreen},
	overlay unbroken={\CalloutOverlay{\textcolor{oiGreen}{\FAiconsize\faIcon{check-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiGreen}{\FAiconsize\faIcon{check-circle}}}},
	#1
}

\NewTColorBox{errorbox}{ O{} O{\iaserrorname} }{%
	calloutbase,
	title={#2},
	colframe=oiVermilion, colback=oiVermilionFill,
	borderline west={3pt}{0pt}{oiVermilion},
	overlay unbroken={\CalloutOverlay{\textcolor{oiVermilion}{\FAiconsize\faIcon{times-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiVermilion}{\FAiconsize\faIcon{times-circle}}}},
	#1
}

\NewTColorBox{infobox}{ O{} O{\iasinfoname} }{%
	calloutbase,
	title={#2},
	colframe=oiGrey, colback=oiGreyFill,
	borderline west={3pt}{0pt}{oiGrey},
	overlay unbroken={\CalloutOverlay{\textcolor{oiGrey}{\FAiconsize\faIcon{info-circle}}}},
	overlay first   ={\CalloutOverlay{\textcolor{oiGrey}{\FAiconsize\faIcon{info-circle}}}},
	#1
}

\urlstyle{same}

% --- Cross-references ---
\RequirePackage[nameinlink]{cleveref}

% Allow modest emergency stretching before reporting overfull lines.
\setlength{\emergencystretch}{3em}

% --- Geometry and page styles ---
% Print adds a 10 mm binding offset; override it with \geometry in header.tex.
\ifonline
	\RequirePackage[includeheadfoot,top=0cm,headheight=16pt,margin=2.5cm]{geometry}
\else
	\RequirePackage[includeheadfoot,top=0cm,headheight=16pt,margin=2.5cm,bindingoffset=10mm]{geometry}
\fi
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
% Front matter hides folios; the ToC flag controls continuation headers.
\newif\ifias@frontmatter
\newif\ifias@contents
\ias@frontmatterfalse
\ias@contentsfalse
\newcommand{\ias@folio}{\ifias@frontmatter\else\thepage\fi}
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{%
	\if@mainmatter
		\markboth{\thechapter.\ #1}{}%
	\else
		\markboth{#1}{}%
	\fi
}
% Set a running title without changing the ToC entry or PDF bookmark.
\newcommand{\chaptershorttitle}[1]{\markboth{\thechapter.\ #1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}{}}
\fancyhf{}
\ifonline
	\fancyhead[L]{\@author}
	\fancyhead[R]{\@shorttitle}
	\fancyhead[C]{}
	\fancyfoot[R]{}
	\fancyfoot[L]{}
	\fancyfoot[C]{\ias@folio}
	\fancypagestyle{plain}{
		\fancyhf{}
		\fancyfoot[C]{\ias@folio}
		\renewcommand{\headrulewidth}{0pt}
	}
\else
	\fancyhead[LE]{\ifias@contents\iastocheadername\else\nouppercase{\leftmark}\fi}
	\fancyhead[RO]{\ifias@contents\iastocheadername\else\@author\fi}
	\fancyhead[RE,LO]{}
	\fancyhead[C]{}
	\fancyfoot[RO,LE]{\ias@folio}
	\fancyfoot[RE,LO]{}
	\fancyfoot[C]{}
	\fancypagestyle{plain}{
		\fancyhf{}
		\fancyfoot[RO,LE]{\ias@folio}
		\renewcommand{\headrulewidth}{0pt}
	}
\fi

% Paragraph, display, and footnote spacing.
\tolerance=500

\predisplaypenalty=0
\clubpenalty=10000
\widowpenalty=10000

\setlength\footnotesep{7.7\p@}

\newdimen\betweenumberspace
\betweenumberspace=5\p@
\newdimen\headlineindent
\headlineindent=2.5cc

% Screen clears directly; print inserts empty verso pages as needed.
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

% --- Sectioning and matter divisions ---
\setcounter{secnumdepth}{3}

\def\seccounterend{}
\def\seccountergap{\hskip\betweenumberspace}
\def\@seccntformat#1{\csname the#1\endcsname\seccounterend\seccountergap\ignorespaces}
\let\firstmark=\botmark
\@ifundefined{thechapterend}{\def\thechapterend{}}{}
\let\cleardoublepagebackup\cleardoublepage

% Front/back matter omit chapter numbers; main matter restores them.
\newif\if@mainmatter \@mainmattertrue
\renewcommand\frontmatter{\startnewpage
	\ias@frontmattertrue
	\pagestyle{fancy}
	\@mainmatterfalse\pagenumbering{roman}
	\setcounter{page}{1}
	\titleformat{\chapter}
	[display]
	{\bfseries\huge}
	{}
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright~}
	[\vspace{1ex}\titlerule]

	\let\cleardoublepage\clearpage
}
\renewcommand\mainmatter{
	\let\cleardoublepage\cleardoublepagebackup
	\clearemptydoublepage
	\ias@frontmatterfalse
	\pagestyle{fancy}
	\@mainmattertrue
	\pagenumbering{arabic}
	\titleformat{\chapter}
	[display]
	{\bfseries\huge}
	{}
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright \thechapter~}
	[\vspace{1ex}\titlerule]
	\let\cleardoublepage\cleardoublepagebackup
}
\renewcommand\backmatter{
	\pagestyle{fancy}
	\clearemptydoublepage
	\ias@frontmatterfalse
	\@mainmatterfalse
	\titleformat{\chapter}
	[display]
	{\bfseries\huge}
	{}
	{0ex}
	{\vspace{-5ex}\titlerule\vspace{1.5ex}\filright~}
	[\vspace{1ex}\titlerule]

}

% Keep the ToC flag active through the final shipped continuation page.
\let\ias@tableofcontents\tableofcontents
\renewcommand\tableofcontents{%
	\clearpage
	\ias@contentstrue
	\ias@tableofcontents
	\clearpage
	\ias@contentsfalse
}

% --- Glossaries and generated lists ---
% MakeIndex handles glossary sorting; datatool locale modules are not required.
\RequirePackage[nolocale]{datatool-base}
\RequirePackage[acronym,symbols,shortcuts,nopostdot,nogroupskip,section,nonumberlist,toc]{glossaries-extra}
\renewcommand*{\glsgroupskip}{}
% Notation files: .ntn input, .not output, .ntg log.
\newglossary[ntg]{notation}{not}{ntn}{Notation}
\makeglossaries

% List-of-* formatting and ToC entries.
\renewcommand\listoffigures{%
	\phantomsection
	\section*{\listfigurename}%
	\addcontentsline{toc}{section}{\listfigurename}%
	\@mkboth{\listfigurename}{\listfigurename}%
	\@starttoc{lof}%
}
\renewcommand*\l@figure{\@dottedtocline{1}{1.5em}{2.3em}}
\renewcommand\listoftables{%
	\phantomsection
	\section*{\listtablename}%
	\addcontentsline{toc}{section}{\listtablename}%
	\@mkboth{\listtablename}{\listtablename}%
	\@starttoc{lot}%
}
\let\l@table\l@figure

\newcommand{\iaslistofalgorithms}{%
	\phantomsection
	\section*{\listalgorithmname}%
	\addcontentsline{toc}{section}{\listalgorithmname}%
	\@mkboth{\listalgorithmname}{\listalgorithmname}%
	\@namedef{l@algorithm}{\@dottedtocline{1}{1.5em}{2.3em}}%
	\@starttoc{loa}%
}

\defbibheading{iaslistsbib}[\refname]{%
	\phantomsection
	\section*{#1}%
	\addcontentsline{toc}{section}{#1}%
}

% No argument prints all defaults; a comma-separated list selects entries, e.g. \lists[LoT,LoF].
\ExplSyntaxOn
\clist_const:Nn \c__ias_default_lists_clist
{ lot,lof,loa,acronyms,glossary,notation,symbols,bibliography }
\seq_new:N \l__ias_seen_lists_seq

\cs_new_protected:Npn \__ias_print_list:n #1
{
	\str_case:nnF {#1}
	{
		{lot}{\listoftables}
		{lof}{\listoffigures}
		{loa}{\iaslistofalgorithms}
		{acronyms}{\printglossary[type=\acronymtype,title=\acrname,toctitle=\acrname]}
		{glossary}{\printglossary[title=\glossaryname,toctitle=\glossaryname]}
		{notation}{\printglossary[type=notation,title=\notationname,toctitle=\notationname]}
		{symbols}{\printglossary[type=symbols,title=\iassymbolsname,toctitle=\iassymbolsname]}
		{bibliography}{\printbibliography[heading=iaslistsbib,title=\refname]}
	}
	{\ClassWarning{IASthesis}{Unknown~list~selector~`#1'~ignored}}
}

\cs_generate_variant:Nn \seq_if_in:NnF { NV }
\cs_generate_variant:Nn \seq_put_right:Nn { NV }
\cs_generate_variant:Nn \__ias_print_list:n { V }

\cs_new_protected:Npn \__ias_print_selector:n #1
{
	\tl_set:Nx \l_tmpa_tl { \str_lowercase:f { \tl_trim_spaces:n {#1} } }
	\tl_if_blank:VTF \l_tmpa_tl
	{\ClassWarning{IASthesis}{Empty~list~selector~ignored}}
	{
		\str_if_eq:VnTF \l_tmpa_tl {all}
		{\clist_map_inline:Nn \c__ias_default_lists_clist {\__ias_print_selector:n {##1}}}
		{
			\seq_if_in:NVF \l__ias_seen_lists_seq \l_tmpa_tl
			{
				\seq_put_right:NV \l__ias_seen_lists_seq \l_tmpa_tl
				\__ias_print_list:V \l_tmpa_tl
			}
		}
	}
}

\NewDocumentCommand{\lists}{o}
{
	\clearpage
	\chapter{\listsname}
	\seq_clear:N \l__ias_seen_lists_seq
	\IfNoValueTF{#1}
	{\clist_map_inline:Nn \c__ias_default_lists_clist {\__ias_print_selector:n {##1}}}
	{
		\tl_if_blank:nTF {#1}
		{\ClassWarning{IASthesis}{Empty~list~selection;~no~component~lists~printed}}
		{\clist_map_inline:nn {#1} {\__ias_print_selector:n {##1}}}
	}
	\clearpage
}
\ExplSyntaxOff

% --- Abstract and appendix ---
\newenvironment{abstract}
{\clearpage
	\chapter*{\abstractname}
	\thispagestyle{empty}
}{\clearpage}

\renewcommand\appendix{\par
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\setcounter{equation}{0}%
	\setcounter{figure}{0}%
	\setcounter{table}{0}%
	\setcounter{footnote}{0}%
	\pagestyle{fancy}%
	\def\@chapapp{\appendixname}%
	\gdef\thechapter{\@Alph\c@chapter}%
	\gdef\theHchapter{appendix.\@Alph\c@chapter}%
	\gdef\theHsection{\theHchapter.\arabic{section}}%
	\refstepcounter{chapter}%
	\chapter{\appendixname}%
	\chaptershorttitle{\appendixname}%
}

% --- Reference and math helpers ---
% Localized cleveref labels.
\ifenglish
	\crefname{figure}{Fig.}{Figs.}
	\Crefname{figure}{Fig.}{Figs.}
	\crefname{table}{Tab.}{Tabs.}
	\Crefname{table}{Tab.}{Tabs.}
	\crefname{chapter}{Ch.}{Chs.}
	\Crefname{chapter}{Ch.}{Chs.}
	\crefname{section}{Sec.}{Secs.}
	\Crefname{section}{Sec.}{Secs.}
	\crefname{subsection}{Sec.}{Secs.}
	\Crefname{subsection}{Sec.}{Secs.}
	\crefname{subsubsection}{Sec.}{Secs.}
	\Crefname{subsubsection}{Sec.}{Secs.}
	\crefname{algorithm}{Alg.}{Algs.}
	\Crefname{algorithm}{Alg.}{Algs.}
\fi
\ifdeutsch
	\crefname{figure}{Abb.}{Abb.}
	\Crefname{figure}{Abb.}{Abb.}
	\crefname{table}{Tab.}{Tab.}
	\Crefname{table}{Tab.}{Tab.}
	\crefname{chapter}{Kap.}{Kap.}
	\Crefname{chapter}{Kap.}{Kap.}
	\crefname{section}{Abschn.}{Abschn.}
	\Crefname{section}{Abschn.}{Abschn.}
	\crefname{subsection}{Abschn.}{Abschn.}
	\Crefname{subsection}{Abschn.}{Abschn.}
	\crefname{subsubsection}{Abschn.}{Abschn.}
	\Crefname{subsubsection}{Abschn.}{Abschn.}
	\crefname{algorithm}{Alg.}{Alg.}
	\Crefname{algorithm}{Alg.}{Alg.}
\fi

% Compatibility aliases for manuscripts created with IASthesis <= 1.1.
\newcommand{\figref}[1]{\cref{#1}}
\newcommand{\tabref}[1]{\cref{#1}}
\newcommand{\capref}[1]{\cref{#1}}

% Common mathematical notation.
\newcommand{\D}{\mathrm{d}}
\newcommand{\E}{\mathrm{e}}
\let\eul=\E
\newcommand{\I}{\mathrm{j}}
\let\imag=\I
\DeclareMathOperator{\exponential}{exp}
\DeclareMathOperator{\trace}{tr}
\DeclareMathOperator*{\argmax}{argmax}
\DeclareMathOperator*{\argmin}{argmin}
\DeclareMathOperator{\variance}{var}
\newcommand{\T}{^{\mkern-1.5mu\mathsf{T}}}
\newcommand{\const}{\mathrm{const}\@ifnextchar.{}{.}}

\newcommand{\vect}[1]{\symbfit{#1}}

\setlength\arraycolsep{1.5\p@}
\setlength\tabcolsep{1.5\p@}

% --- ToC and footnote layout ---
\setcounter{tocdepth}{2}

% Number-column widths for nested ToC entries.
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
\tocchpnum=20\p@
\tocsecnum=22.5\p@
\tocsubsecnum=30.5\p@
\tocsubsubsecnum=38\p@
\tocparanum=45\p@
\tocsubparanum=53\p@
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
			\advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
			{#4}\nobreak
			\leaders\hbox{$\m@th
					\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
					mu$}\hfill
			\nobreak
			\hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
			\par}%
	\fi}
\def\l@section{\@dottedtocline{1}{\tocchpnum}{\tocsecnum}}
\def\l@subsection{\@dottedtocline{2}{\tocsectotal}{\tocsubsecnum}}
\def\l@subsubsection{\@dottedtocline{3}{\tocsubsectotal}{\tocsubsubsecnum}}
\def\l@paragraph{\@dottedtocline{4}{\tocsubsubsectotal}{\tocparanum}}
\def\l@subparagraph{\@dottedtocline{5}{\tocparatotal}{\tocsubparanum}}

% Footnote rule and spacing.
\renewcommand\footnoterule{%
	\kern-3\p@
	\hrule\@width 36mm
	\kern2.6\p@}

\newdimen\foot@parindent
\foot@parindent 10.83\p@

\footnotesep 9\p@

% --- Title pages ---
% Medium-aware variants for dissertations and other theses.
\def\maketitle{
	% Disable title-page anchors to avoid collisions with main-matter page 1.
	\hypersetup{pageanchor=false}%
	\ifdiss{
		\newpage
		\pagestyle{empty}
		\ifonline
			\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm}
		\else
			\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm,bindingoffset=10mm}
		\fi
		\null
		\begingroup
		\def\and{\unskip, }
		\parindent=\z@
		\pretolerance=10000
		\rightskip=\z@ \@plus 3cm
		\begin{center}
			\includegraphics[height=3.0cm]{Logos/Logo_Kombi_IAS_Blau}
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
		\newpage
		\pagestyle{empty}
		\ifonline
			\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm}
		\else
			\newgeometry{top=2.5cm,left=2.5cm,right=2.5cm,bottom=2.5cm,bindingoffset=10mm}
		\fi
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
	\hypersetup{pageanchor=true}%
}

\endinput
