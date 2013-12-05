phd-thesis-template
===================
> A PhD thesis LaTeX template for Cambridge University Engineering Department. Based on Krishna Kumar's King's latex course, Cambridge Computer Laboratory Template and CUED V1.1 Template by H. Banderi.

* Distributed under GPLv2.0

### Features

*   Conforms to the Student Registry PhD dissertation guidelines and CUED PhD guidelines

*   Adaptive Title Page: Title page adapts to title length

*   Print / On-line version: Different layout and hyper-referncing styles

*   Pre-defined and custom fonts (Times / fourier / Latin Modern) with math support

*   Pre-defined and custom bibliography style support (authoryear / numbered / custom)

*   Custom page styles: 3 Different Header / Footer styles

*   Pre-defined and custom margin size

*   Abstract separate with title and name is generated as per the requirements of the Student Registry for submitting the PhD dissertation. 


### Building your thesis

#### Using the Make File (Unix/Linux)

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

Clean unwanted files

To clean unwanted clutter (all LaTeX auto-generated files), run:

    make clean

__Note__: the `Makefile` itself is take from and maintained at
[here](http://code.google.com/p/latex-makefile/).

#### Shell script for PDFLaTeX (Unix/Linux)

Usage: `sh ./compile-thesis.sh [OPTIONS] [filename]`
[option]  compile: Compiles the PhD Thesis
[option]  clean: removes temporary files no filename required

#### Using the Batch file on Windows (PDFLaTeX)

*    Open command prompt and navigate to the directory with the tex file. Run `compile-thesis-windows.bat`.

*    Double click on `compile-thesis-windows.bat`

-------------------------------------------------------------------------------

# Usage details

## Class Options

`PhDThesisPSnPDF` is based on the standard `book` class

It support the following custom options:

*   `a4paper` (default as per the University guidelines) or `a5paper`: Paper size

*   `11pt` or `12pt`: The University of Cambridge guidelines recommend using a minimum font size of 11pt (12pt is preferred) and 10pt for footnotes. This template also supports `10pt`.

*   `oneside` or `twoside` (default): This is especially useful for printing double side (twoside) or single side.

*   `print`: Supports Print and Online Version with different page margins and hyperlink styles.
    Use `print` in the options to activate Print Version with appropriate margins and page layout and view styles. 
    Leaving the options field blank will activate Online version.

*   `custommargin`: You can alter the margin dimension for both print and online version by using the keyword `custommargin` in the options sections. Then you can define the dimensions of the margin in the `PhDThesisPSnPDF.cls` Class file.

*   `index`: Including this option in `\documentclass` build the index, which you can put at the and of the thesis.

    Instructions on how to use the index can be found [here](http://en.wikibooks.org/wiki/LaTeX/Indexing#Using_makeidx).

    _Note_: the package `makeidx` is used to create the index.



### Choosing the Fonts:

`PhDThesisPSnPDF` currently supports two fonts `Times` and `Latin Modern (default)`.

*   `times`: (The University of Cambridge guidelines recommend using Times). Specifying times option in the document class will use `mathptpx` or `Times` font with Math Support.
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

## Abstract separate

*  A separate abstract with the title of the PhD and the candidate name is to be submitted to the Student Registry. This can be generated using abstractseparate environment in abstract.tex file and uncommenting the following line in `thesis.tex` file. Ignore subsequent warnings about skipping sections.

	`\includeonly{Abstract/abstract}`
-------------------------------------------------------------------------------

# Frequently Asked Questions

## _Q1_: Where can I find the thesis formatting guidelines this class is based on?

[https://www.admin.cam.ac.uk/students/studentregistry/exams/submission/phd/format.html](https://www.admin.cam.ac.uk/students/studentregistry/exams/submission/phd/format.html)

[http://www.eng.cam.ac.uk/postgraduate/assets/library/document/p/original/planningphd.pdf](http://www.eng.cam.ac.uk/postgraduate/assets/library/document/p/original/planningphd.pdf)


## _Q2_: Where can I find newer versions of the University of Cambridge crest/logos?

The university updates its crest every now and then. You can find up-to-date
logos on [this page](http://www.admin.cam.ac.uk/offices/communications/services/logos/)
(subject to change without notice).

Download and exchange the new logos with `CUni.eps` and/or `CUni.pdf`. I'll try to keep the crest up to date.

## _Q3_: Where can I find the guidelines to submit my thesis and requirements?

[Preparing to submit:](https://www.admin.cam.ac.uk/students/studentregistry/exams/submission/phd/preparing.html)

[Formatting styles:](https://www.admin.cam.ac.uk/students/studentregistry/exams/submission/phd/format.html)

[Submitting the dissertation](https://www.admin.cam.ac.uk/students/studentregistry/exams/submission/phd/submitting.html)

## _Q4_: How should I count the number of words in my thesis?

You can run the following command:
    `ps2ascii thesis.pdf | wc -w` (eg., result 2713 words)

or 
    `pdftotext thesis.pdf | wc thesis.txt -w` (eg., result 2690 words)

## _Q5_: I found a bug in the template. Where do I report bugs?

You can report issues at
[our GitHub repository](https://github.com/kks32/phd-thesis-template).

You can also mail 
[the developer](https://github.com/kks32/phd-thesis-template/collaborators) directly.


--------------------------------------------------------------------------------
# Troubleshooting Warnings

### _W1_: I get the LaTeX Warning: You have requested document class Classes/PhDThesisPSnPDF, but the document class provides PhDThesisPSnPDF, should I be concerned? 

No! Do nothing, or if you don't want any warning messages change the line near the top of the class file to \ProvidesClass{Classes/PhDthesisPSnPDF} if you're not going to install the class file in a more standard location.

### _W2_:I get the package Fancyhdr Warning: \fancyhead's `E` option without twoside option is useless on input line 321 or 322.. What should I do? 

Nothing. The warning is because twoside option is also defined in the class, although only oneside option is currently used. 

### _W3_: I get the Class PhDThesisPSnPDF Warning: Unknown or non-standard option 'something'. Will see if I can load it from the book class. If you get a warning unused global option(s): `something` then the option is not supported! on input line \#.

You are either trying to use a undefined option or a non-standard option, which is in the book class but not defined in the PhD Thesis Template. If it can be used it will be loaded and you will get no further warnings. If not the option you chose is unavailable. 


### _W4_: I get LaTeX Warning: Unused global option(s):[something].

You are trying to load an option that is not supported in the PhDThesisClass and the Book Class. Are you sure you are using the right option? check you spelling!

### _W5_: I get I'm skipping whatever remains of this command line 28 of file thesis.aux \@input{Chapter1/chapter1.aux}

If you are generating a separate abstract for your thesis submission, ignore this warning and good luck with your submission. If you are compiling your thesis and see this warning, please change your environment in abstract.tex file to abstract and make sure \includeonly command is commented before the begin{document} environment in thesis.tex file



--------------------------------------------------------------------------------

# Known Issue(s) / Bugs

*   No know bug(s) so far. If you find any let me know or even better, if you can patch it and contribute to the development of the LaTeX Template.


--------------------------------------------------------------------------------

# TODO list


--------------------------------------------------------------------------------

# Author(s)
*   Krishna Kumar

# License

This LaTeX template is free software: you can redistribute it and/or modify tt under the terms of the GNU General Public License as published by the Free Software Foundation, either version 2 of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see [http://www.gnu.org/licenses/](http://www.gnu.org/licenses/)

--------------------------------------------------------------------------------
# ChangeLog
### 2013/12/05 - Version 1.0 Beta Release 8.0
> Commit 324d1a5609992028afb109b424573cd3a5e31849
*   Update class file to support dvips driver when using dvi > PS output in hyperTeX. Removed deprecated codes from Declaration and class files

### 2013/12/05 - Version 1.0 Beta Release 7.2
> Commit 2f397eda12ef2b81314b67847e312f688095a379
*   Update to margin dimensions (1:1 ratio is maintained) with a binding offset of 5mm on the print version. Replaced the hmargin ratio of 3:2 with 1:1 with a binding offset.

### 2013/12/04 - Version 1.0 Beta Release 7.1
> Commit 9cb782f26cc3573f8d3077db520ba84b5f295049
*   Declaration with automatic insertion of the author and the degree date and conforming to the statments in the University guidelines

### 2013/12/03 - Version 1.0 Beta Release 7.0
> Commit 1f695d512ae5ce765398db4dc4b6381dc0351868
*   Default font size is 12pt and the default paper size is A4, confirming to the University regulations in terms of font, font sizer, paper size and set them as defaults.

### 2013/11/27 - Version 1.0 Beta Release 6.2
> Commit a5f49d49a6cc39209d95f91e667fd7b359ab5227
*   Update to the Makefile to remove PS files when running Makeclean

### 2013/11/26 - Version 1.0 Beta Release 6.1 
> Commit e29a99406649dcce8f23b6d9df0b87eabd09fc0e
*   Update to the Makefile to support PS to PDF conversion

### 2013/11/26 - Version 1.0 Beta Release 6.0
> Commit 187b9324420812326e62d963afa42e26532e82e7
*   Included a Windows Batch file for LaTeX / Nomenclature compilation
*   Supports \printnomencl[optional_argument]

### 2013/11/26 - Version 1.0 Beta Release 5.0
> Commit 76a733ee305ed4aae9d546492cef768512df2b13
*   Supports DVI/PS
*   Supports Custom Margin and FancyHdr update

### 2013/11/24 - Version 1.0 Beta Release 0
> Commit 73c8dd9ea82c21476d964ad5cdff1b71fe7327c8
*   Author(s): Krishna Kumar
*   Adaptive Title Page: Title page adapts to the length of the title
*   Print / On-line version: Different layout and hyper-referncing styles
*   Pre-defined and custom fonts (Times / Palatino / Latin Modern) with math support
*   Pre-defined and custom bibliography style support (authoryear / numbered / custom)
*   Custom page styles: 3 Different Header / Footer styles

### 2013/11/14 - Inception
> Author(s): Krishna Kumar

