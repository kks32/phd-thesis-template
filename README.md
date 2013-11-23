phd-thesis-template
===================
> A PhD thesis LaTeX template for Cambridge University, based on Krishna Kumar's King's latex course, CUED V1.1 Template by H. Banderi, and Cambridge Computer Laboratory Template.

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

*   `print`: Supports Print and Online Version with different page margins and hyperlink styles.
    Use `print` in the options to activate Print Version with appropriate margins and page layout and view styles. 
    Leaving the options field blank will activate Online version.

*   `index`: Including this option in `\documentclass` build the index, which you can put at the and of the thesis.

    Instructions on how to use the index can be found [here](http://en.wikibooks.org/wiki/LaTeX/Indexing#Using_makeidx).

    _Note_: the package `makeidx` is used to create the index.

### Choosing the Fonts:

`PhDThesisPSnPDF` currently supports two fonts `Times` and `Latin Modern (default)`.

*   `times`: Specifying times option in the document class will use `mathptpx` or `Times` font with Math Support.

*   `default (empty)`: When no font is specified, `Latin Modern` is used as the default font with Math Support. The default font is set in preamble with the following condition `ifFontNotSet` is True then default is set as `Latin Modern`. User can change this default font in the preamble.

### Choosing the Bibliography style

`PhDThesisPSnPDF` currently supports two styles `AuthorYear` and `Numbered (default)`. Citation style has to be set. You can also specify `CustomBib` style

* `authoryear`: For author-year citation eg., Krishna (2013)

* `numbered`: (Default Option) For numbered and sorted citation e.g., [1,5,2]

* `custombib`: Define your own bibliography style in the `preamble.tex` file.
		`\RequirePackage[square, sort, numbers, authoryear]{natbib}`


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

*   You can change the Title of Nomenclature to Notations or Symbols in the `preamble.tex` using:
		`\renewcommand\nomname{Symbols}`

## Nomenclature Definition

* To use nomenclature in your chapters:
		`\nomenclature[g-pi]{$\pi$}{ $\simeq 3.14\ldots$}`
The sort keys have prefix. In this case a prefix of `g` is used to denote Greek Symbols, followed by `-pi` or `-sort_key`. Use a `-` to separate sort key from the prefixes. The standard prefixes defined in this class are:

* `A` or `a`: Roman Symbols

* `G` or `g`: Greek Symbols

* `Z` or `z`: Acronyms/Abbreviations

* `R` or `r`: Superscripts

* `S` or `s`: Subscripts

* `X` or `x`: Other Symbols


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


## _Q5_: How can I use my favourite fonts (like Adobe Sabon, Adobe Utopia etc.)?

This template uses Times and Latin Modern (as default) fonts. Libertine Font doesn't support Math (looking for a suitable alternative for Math font in Libertine).
After you've installed your custom/favourite fonts, add the following command in the preamble section within `\ifFontNotSet \fi`:

    \renewcommand\rmdefault{psb}

## _Q6_: How should I count the number of words in my thesis?

You can run the following command:
    `ps2ascii thesis.pdf | wc -w`

--------------------------------------------------------------------------------

# Known Issue(s) / Bugs

*   No know bug(s) so far. If you find any let me know or even better if you can patch it and contribute to the development of the LaTeX Template

--------------------------------------------------------------------------------

# TODO list

*   Support Libertine fonts + Math

*   Support custom margins

*   Support custom headers

*   Headheight should be fixed according to the fontsize used!
