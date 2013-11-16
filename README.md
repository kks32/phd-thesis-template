phd-thesis-template
===================

> A PhD thesis LaTeX template for Cambridge University, based on Krishna Kumar's King's latex course and CUED V1.1 Template

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