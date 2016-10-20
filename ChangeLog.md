## Change log
### 2016/10/20 - Version 2.2.2
> Commit 7867b367fe6c9523461f5bcd91a8f4f5e92badb2
*   Fixes issue of non-centered style for advisors and supervisors

### 2016/07/04 - Version 2.2.1
> Commit ef6e4394f3dd5a7442c2f48f3196d7d0a15d077f
*   Removed deprecated unused function romanpages defined in `preamble.tex`.
*   https://tex.stackexchange.com/questions/328438/roman-numbering-not-enumerating-latex-error
*   Fixes issue #101 incorrect page numbering scheme in `draft`.
*   Deprecated function `draftmode` use `draft` instead.

### 2016/07/04 - Version 2.2
> Commit 68c4499d170bf167d2410741d573cdf9402d6e80
*   Support for including multiple supervisor and/or advisor
*   Fixes `maketitle` in thesis.tex

### 2015/06/20 - Version 2.1
> Commit a5feb0732d7f13fa9703fddcee703224c00b83dd
*   Support for including supervisor and/or advisor

### 2015/06/20 - Version 2.0.1
> Commit 0e0d1e617acb42b034870ea325271cce8d3d8d8e
*   Fixed centering of year on front page - Issue #16

### 2015/06/20 - Version 2.0
> Commit f4723434f92eedc163fdcb74c7ac04c8d842bc05
*   XeLaTeX and LuaLaTeX support
*   College crest + University crest support

### 2014/12/02 - Version 1.4.5
> Commit 427230cae012194a2e433ec001677c43ffd8250e
*   Fixed issue with the misaligned date and college in the frontpage.

### 2014/12/02 - Version 1.4.4
> Commit 7f17bc3c682df2950e4dc09cd5e71278edc3fc6d
*   Fixed pagenumbering issue in 2 page nomenclature - Issue #28

### 2014/10/08 - Version 1.4.3
> Commit df43fcdc7308feeea8c7dfe06ad24d45d5caca3e
*   Fixed `\degree` command conflict - Issue #26

### 2014/10/08 - Version 1.4.2
> Commit 4f0f3394330bfca302b724ab1b3c06977f7e08f3
*   Added mynotes support in preamble
*   Fixed printnomecl in abstractmode
*   Fixed issue with pagenumbering when using oneside option
*   Draftmode is deprecated, default `draft' supports linenumbering, watermark
*   List of contents doesn't appear in TOC but appears in bookmarks

### 2014/08/11 - Version 1.4.1
> Commit fb70181ff9e00bfb50e3e3040d6b2cf15cd6ebfe
*   Fixed line numbering in draft mode with AMS Math environment
*   Biblatex & custombib error catcher - bug fix
*   Modification to the declaration text

### 2014/07/15 - Version 1.4
> Commit 330f82a439e179dc03fbbbe156f3e830ca1fdd68
*   Option to have subtitle on front page
*   College name is an optional argument
*   Travis-CI integration

### 2014/06/09 - Version 1.3
> Commit 93723653eef19b8ca81d57df389b3a8efa652203
*   Draftmode - watermark text, line numbering, version numbering
*   Better error checking for documentclass options and log messages
*   arara/LaTeX-mk support
*   Option to choose `raggedright` for text

### 2014/03/24 - Version 1.2
> Commit 4b709fed6cdfd5b3796152f9c59b619c72df491f
*   Rearranged package order in preamble to support equation numbering using cref
*   Removed dependencies on obsolete packages
*   Restyled the URL fonts to use the same font as text

### 2014/02/14 - Version 1.1.2
> Commit a7f123bb220bf1e207b6e49e8b2978c203582e12
*   Updates to abstract separate mode with no page numbers
*   Declaration included in abstract mode for submission to student registry

### 2014/02/10 - Version 1.1.1
> Commit e7f34cfd71cbe1b590d615a00d99b8d05513e5ba
*   Biblatex handled as a custombib option
*   UTF8 and Fontencoding after font has been loaded

### 2014/02/04 - Version 1.1
> Commit 6e00ac94c2193882dd6f42686fc455cc66d829df
*   BibLatex Support with bibtex backend
*   Chapter mode for compiling only specified chapters and references

### 2014/01/11 - Version 1.0
> Commit 2f6918863e3c9d0a7e95bd2651ce7ef8ae38f90a
*   Fixed an issue with the headers in Nomenclature section
*   Removed deprecated codes, added functionality to tweak chapter headings in preamble.tex.
*   Distributed under MIT license
*   Acknowledgement and Cls file update
*   Appendices after References

### 2013/12/09 - Version 1.0 Beta Release 10.0
> Commit 973492fe1f1805e4fef60ec54060621b3e90a3cd
*   Fixed issues with DVI >> PS >> PDF and workaround, when papersize is not set for older versions of dvips (5.97 or lower).

### 2013/12/08 - Version 1.0 Beta Release 9.0
> Commit c11f98e26566af08cb9c4cacbdfddf6b28111886
*   Wider text area (75% of page size), support for separate abstract for submission to the Student Registry, appendix

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
