[![Build PDF](https://github.com/IAS-Uni-Siegen/thesis_latex_template/actions/workflows/buildPDF.yml/badge.svg)](https://github.com/IAS-Uni-Siegen/thesis_latex_template/actions/workflows/buildPDF.yml)
[![CC BY 4.0][cc-by-shield]][cc-by]
[![made-with-latex](https://img.shields.io/badge/Made%20with-LaTeX-1f425f.svg)](https://www.latex-project.org/)

This work is licensed under a
[Creative Commons Attribution 4.0 International License][cc-by].

[![CC BY 4.0][cc-by-image]][cc-by]

[cc-by]: http://creativecommons.org/licenses/by/4.0/
[cc-by-image]: https://licensebuttons.net/l/by/4.0/88x31.png
[cc-by-shield]: https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg

***

This is a LaTeX document template for IAS students writing a project report,
a bachelor's or master's thesis, or a dissertation.

## Preview

The image links to the example PDF generated from this template:

[![Preview of the compiled thesis title page](first_page.png)](https://ias-uni-siegen.github.io/thesis_latex_template/thesis.pdf)

[View or download the compiled example PDF](https://ias-uni-siegen.github.io/thesis_latex_template/thesis.pdf).

## Requirements and build

The supported typesetting engine is LuaLaTeX. Choose either MiKTeX or TeX Live;
do not mix executables from both distributions on the same `PATH`.

### MiKTeX

MiKTeX is a convenient setup for Windows because it can install missing LaTeX
packages when they are first needed.

1. Install [MiKTeX](https://miktex.org/howto/install-miktex), preferably as a
   private per-user installation. Select `Ask me first` or `Always` for missing
   package installation.
2. Install [Perl](https://learn.perl.org/installing/windows.html) and ensure that
   `perl` is available on `PATH`. MiKTeX's `latexmk` and the glossary tooling
   require it; Strawberry Perl is a common Windows distribution.
3. Open MiKTeX Console, install all available updates, and confirm under
   `Settings` that missing packages may be installed on the fly.
4. Open a new terminal and run the build command below. Accept any MiKTeX
   prompts for packages required by the template. The first build can therefore
   take longer than subsequent builds.

If `latexmk` reports that Perl cannot be found, restart the terminal or VS Code
after installing Perl and verify the installation with `perl --version`.

### TeX Live

Install [TeX Live](https://tug.org/texlive/quickinstall.html) using the default
`scheme-full`. This avoids having to identify the individual packages and fonts
used by the class. On macOS, the corresponding full distribution is
[MacTeX](https://tug.org/mactex/). Ensure that the TeX Live binary directory is
on `PATH`; the Windows installer normally handles this automatically.

Continuous integration currently uses TeX Live 2025. Use that release when
exact CI parity is required; a current full TeX Live installation is suitable
for normal local work.

### Build the document

After installing either distribution, `lualatex`, `latexmk`, `biber`,
`makeglossaries`, and `makeindex` must be available on `PATH`. Run this command
from the repository root:

```console
latexmk -norc -r .latexmkrc main.tex
```

The explicit `-norc` and `-r` options ensure that only the repository's
`.latexmkrc` controls the build. It runs LuaLaTeX and all required Biber and
glossary passes. To remove generated auxiliary files, use:

```console
latexmk -norc -r .latexmkrc -c main.tex
```

GitHub Actions uses the same build command with TeX Live 2025.

## Working with VS Code

[Visual Studio Code](https://code.visualstudio.com/) together with the
[LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop)
extension provides editing, building, error navigation, and an integrated PDF
viewer. VS Code and the extension do not include a LaTeX distribution, so
complete one of the MiKTeX or TeX Live installations above first.

1. Open the repository folder in VS Code, rather than opening only `main.tex`.
   This activates the included workspace configuration and extension
   recommendations.
2. Install LaTeX Workshop when VS Code displays the recommendation, or find it
   in the Extensions view.
3. Restart VS Code after installing or changing MiKTeX, TeX Live, Perl, or
   `PATH` so the editor can find the command-line tools.
4. Open `main.tex` and run `LaTeX Workshop: Build LaTeX project` from the
   Command Palette. The usual shortcut is `Ctrl+Alt+B` on Windows and Linux.
5. The configured recipe, `LuaLaTeX (project latexmkrc)`, invokes the same
   project-level `latexmk` command documented above. Open the result using
   `LaTeX Workshop: View LaTeX PDF` or the TeX sidebar.

Formatting on save uses `latexindent` from the selected distribution. If
building works but formatting does not, first confirm that `latexindent` is
available on `PATH`; formatting is independent of PDF compilation.

## Document configuration

English is the default language, so no language option is required. Use
`english` to be explicit or `deutsch` for German. The default medium is
`medium=screen`; select `medium=print` when preparing a duplex hard copy:

```latex
\documentclass{IASthesis}                        % English, digital PDF
\documentclass[deutsch,medium=print]{IASthesis}  % German, duplex printing
```

`medium=screen` uses a single-sided layout and opens the PDF outline for digital
reading. `medium=print` uses a duplex layout with a 10 mm binding correction;
override it in `chapters/header.tex`, if necessary, with, for example,
`\geometry{bindingoffset=12mm}`. It is a regular print PDF, not an archival/PDF-A
profile. Both profiles retain
functional links and embed title, author, subject, keyword, language, and
creator metadata. The legacy `online` option remains available as a deprecated
alias for `medium=screen`. For dissertations, add `diss`; this also includes the
CV scaffold. Add `final` only for the approved final-version title-page details.
Add `thanks` to insert a localized `Acknowledgements` page
between the declaration of authorship and the abstract.

Front-matter pages retain internal Roman numbering for unambiguous PDF links,
but those folios are not printed. Arabic page numbers begin visibly with
`\mainmatter`. In the print profile, define a concise running-head title directly
after every numbered chapter while keeping the full chapter title in the table
of contents and PDF outline:

```latex
\chapter{A descriptive full chapter title}
\chaptershorttitle{Concise chapter title}
```

The even-page outer header then reads, for example, `2. Concise chapter title`;
the odd-page outer header contains the author name. The first table-of-contents
page is headerless; continuation pages use only the localized table-of-contents
name in their outer header.

The `\lists` command prints the list of tables, list of figures, list of
algorithms, acronyms, glossary, notation, symbols, and bibliography by default.
Pass a case-insensitive comma-separated selection to print only specific
entries:

```latex
\lists
\lists[LoT,LoF,LoA,acronyms,bibliography]
```

Supported selectors are `LoT`, `LoF`, `LoA`, `acronyms`, `glossary`,
`notation`, `symbols`, `bibliography`, and `all`. If the manuscript cites
bibliography or glossary entries, include the corresponding list here or print
it elsewhere so that those PDF links have destinations.

Bibliography entries belong in `references.bib`; the template loads that file
with BibLaTeX/Biber.

## Using your own packages

Do not modify the `.cls` file for thesis-specific additions. Add packages,
commands, and geometry overrides to `chapters/header.tex`. A commented package
whose note mentions class-level integration has a load-order constraint and
must not simply be uncommented there.

## Contributing and feedback

- Please open an issue or pull request to suggest changes. Critical feedback
  and improvement hints are welcome.
