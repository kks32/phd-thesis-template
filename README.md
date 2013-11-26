phd-thesis-template
===================
> A PhD thesis LaTeX template for Cambridge University, based on Krishna Kumar's King's latex course, CUED V1.1 Template by H. Banderi, and Cambridge Computer Laboratory Template.

### Features

*   Adaptive Title Page: Title page adapts to title length

*   Print / On-line version: Different layout and hyper-referncing styles

*   Pre-defined and custom fonts (Times / fourier / Latin Modern) with math support

*   Pre-defined and custom bibliography style support (authoryear / numbered / custom)

*   Custom page styles: 3 Different Header / Footer styles

*   Pre-defined and custom margin size (should be modified in the class file)


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

`PhDThesisPSnPDF` is based on the standard `book` class

It support the following custom options:

*   `a4paper` or `a5paper` or `letter`: Paper size

*   `10pt` or `11pt` or `12pt`: Font Size

*   `oneside` or `twoside`: This is especially useful for printing double side (twoside) or single side.

*   `print`: Supports Print and Online Version with different page margins and hyperlink styles.
    Use `print` in the options to activate Print Version with appropriate margins and page layout and view styles. 
    Leaving the options field blank will activate Online version.

*   `custommargin`: You can alter the margin dimension for both print and online version by using the keyword `custommargin` in the options sections. Then you can define the dimensions of the margin in the `PhDThesisPSnPDF.cls` Class file.

*   `index`: Including this option in `\documentclass` build the index, which you can put at the and of the thesis.

    Instructions on how to use the index can be found [here](http://en.wikibooks.org/wiki/LaTeX/Indexing#Using_makeidx).

    _Note_: the package `makeidx` is used to create the index.



### Choosing the Fonts:

`PhDThesisPSnPDF` currently supports two fonts `Times` and `Latin Modern (default)`.

*   `times`: Specifying times option in the document class will use `mathptpx` or `Times` font with Math Support.
*   `fourier`: fourier font with math support
*   `default (empty)`: When no font is specified, `Latin Modern` is used as the default font with Math Support. 
*   `customfont`: Any custom font can be set in preamble by using `customfont` option in the document class. Then the custom font can be loaded in preamble.tex in 
		`\ifsetFont\else \RequirePackage{Your_Custom_Font}\fi`

### Choosing the Bibliography style

`PhDThesisPSnPDF` currently supports two styles `authoryear` and `numbered (default)`. Citation style has to be set. You can also specify `custombib` style

* `authoryear`: For author-year citation eg., Krishna (2013)

* `numbered`: (Default Option) For numbered and sorted citation e.g., [1,5,2]

* `custombib`: Define your own bibliography style in the `preamble.tex` file.
		`\RequirePackage[square, sort, numbers, authoryear]{natbib}`

### Choosing the Page Style

`PhDThesisPSnPDF` defines 3 different page styles (header and footer). The following definition is for `twoside` layout.

* `default (leave empty)`: For Page Numbers in Header (Left Even, Right Odd) and Chapter Name in Header (Right Even) and Section #. Section Name (Left Odd). Blank Footer.

Header (Even)   : 4				Introduction 
Header (Odd)    : 1.2 Section Name 			   5
Footer 		: Empty

* `PageStyleI`: For Page Numbers in Header (Left Even, Right Odd) and Chapter Name next to the Page Number on Even Side (Left Even). Section Number and Section Name and Page Number in Header on Odd Side (Right Odd). Footer is empty. Layout:

Header (Even)   : 4 | Introduction 
Header (Odd)    :                         1.2 Section Name | 5
Footer 		: Empty

* `PageStyleII`: Chapter Name on Even Side (Left Even) in Header. Section Number and Section Name in Header on Odd Side (Right Odd). Page numbering in footer. Layout:

Header (Even)   : Introduction
Header (Odd)    : 			   1.2 Section Name
Footer[centered]:                   3

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

*   You can change the Title of Nomenclature to Notations or Symbols in the `preamble.tex` using:
		`\renewcommand\nomname{Symbols}`


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

Yes please. We are using this nice `Makefile` built specifically for LaTeX:

> [http://code.google.com/p/latex-makefile/](http://code.google.com/p/latex-makefile/)


## _Q4_: Where can I find newer versions of the University of Cambridge logo?

The university updates its logo every now and then. You can find up-to-date
logos on [this page](http://www.admin.cam.ac.uk/offices/communications/services/logos/)
(subject to change without notice).

Download and exchange the new logos with `CUni.eps` and/or `CUni.pdf`.


## _Q5_: How can I use my favourite fonts (like Libertine etc.)?

This template uses Times and Latin Modern (as default) fonts. Libertine Font doesn't support Math (looking for a suitable alternative for Math font in Libertine).
After you've installed your custom/favourite fonts, add the following command in the preamble section within `\ifsetFont\else \RequirePackage{yourfont} \fi`:

    \renewcommand\rmdefault{psb}

## _Q6_: How should I count the number of words in my thesis?

You can run the following command:
    `ps2ascii thesis.pdf | wc -w`

--------------------------------------------------------------------------------
# Warnings and FAQs

__W1__: I get the ``LaTeX Warning: You have requested document class `Classes/PhDThesisPSnPDF', but the document class provides `PhDThesisPSnPDF'." warning, should I be concerned? 

No! Do nothing, or if you don't want any warning messages change the line near the top of the class file to \ProvidesClass{Classes/PhDthesisPSnPDF} if you're not going to install the class file in a more standard location.

__W2__:I get package Fancyhdr Warning: \fancyhead's `E' option without twoside option is useless on input line 321 or 322.. What should I do? 

Nothing. The warning is because twoside option is also defined in the class, although only oneside option is currently used. 

__W3__: I get Class PhDThesisPSnPDF Warning: Unknown or non-standard option 'something'. Will see if I can load it from the book class. If you get a warning unused global option(s): `eco` then the option is not supported! on input line 91.

You are either trying to use a undefined option or a non-standard option, which is in the book class but not defined in the PhD Thesis Template. If it can be used it will be loaded and you will get no further warnings. If not the option you chose is unavailable. 


__W4__: I get LaTeX Warning: Unused global option(s):[something].

You are trying to load an option that is not supported in the PhDThesisClass and the Book Class. Check you spelling!


--------------------------------------------------------------------------------

# Known Issue(s) / Bugs

*   No know bug(s) so far. If you find any let me know or even better, if you can patch it and contribute to the development of the LaTeX Template.

*   Bug in Makefile that prevents conversion from PS to PDF. Workaround: `Run ps2pdf thesis.ps thesis.pdf` to produce the PDF output.

--------------------------------------------------------------------------------

# TODO list

*   Scale the section sizes by an order when moving from a4paper to a5paper

*   Support Libertine fonts + Math

*   Tweak Make file to convert PS to PDF and clean PS files


