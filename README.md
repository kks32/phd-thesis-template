phd-thesis-template
===================
> A PhD thesis LaTeX template for Cambridge University, based on Krishna Kumar's King's latex course, CUED V1.1 Template by H. Banderi, and Cambridge Computer Laboratry Template.

### Build your thesis
The template supports PDF, DVI and PS formats. All three formats can be generated
with the provided `Makefile`.

To build the `PDF` version of your thesis, run:

    make

or

    ./makepdf

This build procedure uses `pdflatex` and will produce `thesis.pdf`.

To produce `DVI` and `PS` versions of your document, you should run:

    ./makeps

or

    make BUILD_STRATEGY=latex

This will use the `latex` command to build the document and will produce
`thesis.dvi`, `thesis.ps` and `thesis.pdf` documents.

### Clean unwanted files

To clean unwanted clutter (all LaTeX auto-generated files), run:

    make clean

__Note__: the `Makefile` itself is take from and maintained at
[here](http://code.google.com/p/latex-makefile/).

-------------------------------------------------------------------------------

# Usage details

## Class Options

`PhDThesisPSnPDF` supports all the options of the standard `book` and `report` classes (on which
it is based).

It also supports some custom options:

*   `book` or `report`: Supports both book and report class. Default is `book`.

*   `twoside` or `oneside`: This is especially useful for printing double side (twoside) or single side.

*   `printmode`: Supports PrintMode and Online Version with different page margins and hyperlink styles.
    Use `printmode` in the options to activate Print Version with appropriate margins and page layout and view    styles. Leaving the options field blank will activate Online version.

*   `index`: Including this option in `\documentclass` build the index, which you can put at the and of the thesis.

    Instructions on how to use the index can be found [here](http://en.wikibooks.org/wiki/LaTeX/Indexing#Using_makeidx).

    _Note_: the package `makeidx` is used to create the index.

### Choosing the Fonts:

`PhDThesisPSnPDF` currently supports two fonts `Times` and `Latin Modern (default)`.

*   `times`: Specifying times option in the document class will use `mathptpx` or `Times` font with Math Support.

*   `default (empty)`: When no font is specified, `Latin Modern` is used as the default font with Math Support. The default font is set in preamble with the following condition `ifFontNotSet` is True then default is set as `Latin Modern`. User can change this default font in the preamble.

## Custom Settings

*   The depth of table of contents can be set using: 
		`\setcounter{secnumdepth}{3}`
		`\setcounter{tocdepth}{3}`
    a depth of [3] indicates to a level of `\subsubsection` or #.#.#.#. Default set as 2.

*   To hide sections from appearing in TOC use: `\tochide\section{Section name}` in your TeX files

*   To restrict the length of the figure caption in List of figures use in `preamble.tex`:
		`\caption[Caption that you want to appear in TOC]{Actual caption of the figure}`
		`\section[short]{title}`

*   Define custom caption style for figure and table caption in `preamble.tex` using:
		`\RequirePackage[small,bf,figurename=Fig.,labelsep=space,tableposition=top]{caption}`

*   Bibliography with Author-Year Citation in `preamble.tex`:
		`\RequirePackage[round, sort, numbers, authoryear]{natbib}`

-------------------------------------------------------------------------------

# Troubleshooting

## _Q1_: I found a bug in the template. Where do I report bugs?

You can report issues through
[our GitHub repository](https://github.com/kks32/phd-thesis-template).

You can also mail 
[the maintainers](https://github.com/kks32/phd-thesis-template/collaborators) directly.

## _Q2_: Where can I find the thesis formatting guidelines this class is based on?

[http://www.eng.cam.ac.uk/postgraduate/assets/library/document/p/original/planningphd.pdf](http://www.eng.cam.ac.uk/postgraduate/assets/library/document/p/original/planningphd.pdf)

## _Q3_: Can I use my own Makefile?

By all means. We are currently using the very nice (and smart) `Makefile` built
specifically for LaTeX:

> [http://code.google.com/p/latex-makefile/](http://code.google.com/p/latex-makefile/)


## _Q4_: Where can I find newer versions of the University of Cambridge logo?

The university updates its logo every now and then. You can find up-to-date
logos on [this page](http://www.admin.cam.ac.uk/offices/communications/services/logos/)
(subject to change without notice).

Download and exchange the new logos with `CUni.eps` and/or `CUni.pdf`.


## _Q5_: Where can I find extra fonts (like Adobe Sabon, Adobe Utopia etc.)?

This template uses Libertine fonts instead of Arial/Times/Sabon.
After you've installed the fonts, add somewhere in the preamble (before `\begin{document}`) the following command:

    \renewcommand\rmdefault{psb}

## _Q6_: How should I count the number of words in my thesis?

You can run the following command:
    `ps2ascii thesis.pdf | wc -w`

--------------------------------------------------------------------------------

# Known Issues / Bugs

*   Abstract, Acknowlegment and Dedication has extra spacing at the top: needs removal

--------------------------------------------------------------------------------

# TODO list

*   Support custom margins

*   Headheight should be fixed according to the fontsize used!
