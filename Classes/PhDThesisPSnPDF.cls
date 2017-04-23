%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis PSnPDF''                                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v2.3.1                                                             %%
%% Authors: Krishna Kumar                                                     %%
%% License: MIT License (c) 2016 Krishna Kumar                                %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{2.3.1}
\newcommand\filedate{2016/04/23}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesisPSnPDF}[\filedate\space A PhD thesis class file
 by Krishna Kumar (v\fileversion)]
\typeout{https://github.com/kks32/phd-thesis-template/}


% ******************************************************************************
% **************************** Class Definition ********************************
% ******************************************************************************

% *********************** Define a Print/Online Version ************************
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

% ****************************** Define index **********************************
\newif\ifPHD@index\PHD@indexfalse
\DeclareOption{index}{\PHD@indextrue}

% ******************************* Font Option **********************************
\newif\ifsetFont\setFontfalse                 % Font is not set

\newif\ifPHD@times\PHD@timesfalse             % Times with Math Support
\DeclareOption{times}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@timestrue
    \setFonttrue
  \fi
}

\newif\ifPHD@fourier\PHD@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \PHD@fouriertrue
    \setFonttrue
  \fi
}

\newif\ifsetCustomFont\setCustomFontfalse     % Custom Font with Math Support
\DeclareOption{customfont}{
  \ifsetFont
    \ClassWarning{PhDThesisPSnPDF}{Font selection conflict: A font package was
      aleady specified. Please check the document class options in case you 
      have defined two fonts.}
  \else
    \setCustomFonttrue
    \setFonttrue
  \fi
}

% ******************************* Bibliography *********************************
\newif\ifsetBib\setBibfalse                   % Custom Bibliography = true/false
\newif\ifsetBiBLaTeX\setBiBLaTeXfalse         % BiBLaTeX = True / False

\newif\ifPHD@biblatex\PHD@biblatexfalse       % BiBLaTeX
\DeclareOption{biblatex}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@biblatextrue
  \fi
}

\newif\ifPHD@authoryear\PHD@authoryearfalse   % Author-Year citation
\DeclareOption{authoryear}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@authoryeartrue
    \setBibtrue
  \fi
}

\newif\ifPHD@numbered\PHD@numberedfalse       % Numbered citiation
\DeclareOption{numbered}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \PHD@numberedtrue
    \setBibtrue
  \fi
}

\newif\ifuseCustomBib\useCustomBibfalse     % Custom Bibliography
\DeclareOption{custombib}{
  \ifsetBib
    \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
      bibliography style aleady specified. Please check the document class
      options in case you have defined two bibliography styles.}
  \else
    \ifPHD@biblatex
        \ClassWarning{PhDThesisPSnPDF}{Bibliography selection conflict: A
          bibliography style aleady specified. Please check the document class
          options in case you have defined two bibliography styles.}
    \else
      \useCustomBibtrue
      \setBibtrue
    \fi
  \fi
}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@textJustify\PHD@textJustifytrue % Set Justification true
\DeclareOption{flushleft}{\PHD@textJustifyfalse}


% ************************* Header / Footer Styling ****************************
\newif\ifPHD@pageStyleI\PHD@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\PHD@pageStyleItrue}

\newif\ifPHD@pageStyleII\PHD@pageStyleIIfalse % Set Page StyleII
\DeclareOption{PageStyleII}{\PHD@pageStyleIItrue}

% ***************************** Custom Margins  ********************************
\newif\ifsetCustomMargin\setCustomMarginfalse % Set Custom Margin
\newif\ifsetMargin\setMarginfalse % Set Custom Margin
\DeclareOption{custommargin}{\setCustomMargintrue}

% **************************** Separate Abstract  ******************************
\newif \ifdefineAbstract\defineAbstractfalse %To enable Separate abstract

\newif\ifPHD@abstract\PHD@abstractfalse % Enable Separate Abstract
\DeclareOption{abstract}{
  \PHD@abstracttrue
  \ClassWarning{PhDThesisPSnPDF}{You have chosen an option that generates only
    the Title page and an abstract with PhD title and author name, if this was
    intentional, ignore this warning. Congratulations on submitting your thesis!
    If not, please remove the option `abstract' from the document class and
    recompile. Good luck with your writing!}
  \PassOptionsToClass{oneside}{book}
}

% ****************** Chapter Mode - To print only selected chapters ************
\newif \ifdefineChapter\defineChapterfalse %To enable Separate abstract

\newif\ifPHD@chapter\PHD@chapterfalse % Enable Separate Abstract
\DeclareOption{chapter}{
  \PHD@chaptertrue
  \ClassWarning{PhDThesisPSnPDF}{You have chosen an option that generates only 
    selected chapters with references, if this was intentional, ignore this
    warning. If not, please remove the option `chapter' from the document class
    and recompile. Good luck with your writing!}
}

% *************************** Pre-defined Options ******************************
% Font Size
\DeclareOption{10pt}{
  \ClassWarning{PhDThesisPSnPDF}{The University of Cambridge PhD thesis guidelines
recommend using a minimum font size of 11pt (12pt is preferred) and 10pt for
footnotes.}
  \PassOptionsToClass{10pt}{book}%
}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{book}}%

% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper

\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\PHD@papersize{a5paper}}
\DeclareOption{letterpaper}{
  \ClassWarning{PhDThesisPSnPDF}{The University of Cambridge
    PhD thesis guidelines recommend using A4 or A5paper}
  \renewcommand\PHD@papersize{letterpaper}
}

\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% ****************************** Draft Option **********************************
\newif\ifsetDraft\setDraftfalse
\newif\ifsetDraftClassic\setDraftClassicfalse
% Draft Mode
\DeclareOption{draftclassic}{\PassOptionsToClass{draft}{book}
  \setDraftClassictrue
  \ClassWarning{PhDThesisPSnPDF}{Draft is ON. Don't forget to turn it
    off in your final version. This is the classic version of draft.
    Use `draft' for enhanced mode, which adds watermark with timestamp, 
    line numbering, and version number.}}%

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}
  \setDrafttrue 
  \ClassWarning{PhDThesisPSnPDF}{Draft is ON. Don't forget to turn it
    off in your final version. This enhanced `draft' mode adds watermark 
    with timestamp, line numbering, and version number. Use `draftclassic'
    if you prefer the \cite{} lassic draft mode. To tweak options see
    `preamble.tex'}}%


% Line Numbers
\newif\ifPHD@lineno\PHD@linenotrue
\DeclareOption{lineno}{\PHD@linenotrue}
\DeclareOption{nolineno}{\PHD@linenofalse}


% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{PhDThesisPSnPDF}{Unknown or non-standard option
'\CurrentOption'. I'll see if I can load it from the book class. If you get a
warning unused global option(s): `\CurrentOption` then the option is not
supported!}
  \PassOptionsToClass{\CurrentOption}{book}
}

% Process options and load class
\ProcessOptions\relax%
\LoadClass{book}%

% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************

\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}   % Conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX
\RequirePackage{ifxetex}  % XeLaTeX

% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage[nottoc]{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}

\renewcommand{\contentsname}{Table of contents}
\renewcommand{\listfigurename}{List of figures}
\renewcommand{\listtablename}{List of tables}

% Hides Contents appearing from TOC, but adds it to bookmarks
\let\temptableofcontents\tableofcontents
\renewcommand{\tableofcontents}{
  \cleardoublepage
  \pdfbookmark[0]{\contentsname}{Contents}
  \temptableofcontents
}

% *************************** Graphics and Figures *****************************
\RequirePackage[usenames, dvipsnames]{color}
\ifpdf
  % Convert eps figures to pdf
  \RequirePackage{epstopdf}
  \RequirePackage[pdftex]{graphicx}
  \DeclareGraphicsExtensions{.png, .jpg, .pdf}
  \pdfcompresslevel=9
  \graphicspath{{Figs/Raster/}{Figs/}}
\else
  \RequirePackage{graphicx}
  \DeclareGraphicsExtensions{.eps, .ps}
  \graphicspath{{Figs/Vector/}{Figs/}}
\fi



% ******************************* Time Stamp ***********************************
% Compute the timestamp based on an idea of
% Tim Piessens \texttt{<Tim.Piessens@esat.kuleuven.ac.be>}.

\RequirePackage{datetime}

\newcount\PHD@hour \newcount\PHD@minute
\PHD@hour=\time
\divide \PHD@hour by 60
\PHD@minute=\time
\count@=\PHD@hour
\multiply \count@ by -60
\advance \PHD@minute by \count@
\newcommand{\PHD@daytime}{%
  \today\space--\space%
  \ifnum\PHD@hour=0 00\else\ifnum\PHD@hour<10 0\fi%
  \number\PHD@hour\fi:\ifnum\PHD@minute<10 0\fi\number\PHD@minute
}

% ******************************* Draft Mode ***********************************
% Initializing Draft Text
\newcommand\SetDraftText[1]{}
% Initializing Draft Version
\newcommand\SetDraftVersion[1]{}
% Initializing Draft Content
\newcommand\SetDraftWMPosition[1]{}
% Initializing Draft Gray Scale
\newcommand\SetDraftGrayScale[1]{}

% Classic Draft Mode
\ifsetDraftClassic
% Disable figures in `draft'\
\setkeys{Gin}{draft=true}
\fi

% If Draft Mode is active
\ifsetDraft
% Disable figures in `draft'\
\setkeys{Gin}{draft=false}

% Line numbering (can be switched off)
\ifPHD@lineno
\RequirePackage[switch,pagewise,mathlines]{lineno}
\renewcommand{\frontmatter}{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{roman}
  \nolinenumbers
}
\renewcommand{\mainmatter}{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}
  \linenumbers
}
\renewcommand{\backmatter}{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \linenumbers
}

% Fix display lineno issue in mathmode
\newcommand*\patchAmsMathEnvironmentForLineno[1]{%
  \expandafter\let\csname old#1\expandafter\endcsname\csname #1\endcsname
  \expandafter\let\csname oldend#1\expandafter\endcsname\csname end#1\endcsname
  \renewenvironment{#1}%
     {\linenomath\csname old#1\endcsname}%
     {\csname oldend#1\endcsname\endlinenomath}%
}% 

\newcommand*\patchBothAmsMathEnvironmentsForLineno[1]{%
  \patchAmsMathEnvironmentForLineno{#1}%
  \patchAmsMathEnvironmentForLineno{#1*}%
}%

\AtBeginDocument{%
  \patchBothAmsMathEnvironmentsForLineno{equation}%
  \patchBothAmsMathEnvironmentsForLineno{align}%
  \patchBothAmsMathEnvironmentsForLineno{flalign}%
  \patchBothAmsMathEnvironmentsForLineno{alignat}%
  \patchBothAmsMathEnvironmentsForLineno{gather}%
  \patchBothAmsMathEnvironmentsForLineno{multline}%
}

\fi % End \ifPDH@lineno

% Creates a Watermark Draft at the specified location.
% The settings can be tweaked in the preamble

% Draft text
\newcommand\drafttext{Draft}
\renewcommand\SetDraftText[1]{%
  \renewcommand\drafttext{#1}
}

% Draft Version
\newcommand\draftVersion{v1.0}
\renewcommand\SetDraftVersion[1]{%
  \renewcommand\draftVersion{#1}
}

% Draft Gray Scale
\newcommand\draftGrayScale{0.75}
\renewcommand\SetDraftGrayScale[1]{%
  \renewcommand\draftGrayScale{#1}
}

% Draft Content
\newcommand\DraftContent{%
  \hspace*{\fill}
  \Large
  \textcolor[gray]{\draftGrayScale}{%
    {\drafttext}\space-\space{\draftVersion}\hspace{\stretch{1}}{\PHD@daytime}
    \hspace*{\fill}
  }
}

% Adding watermark in draft mode with time stamp
\RequirePackage{everypage}
\RequirePackage[absolute]{textpos}
% Default values for draft watermark
\newcommand\draftposition{top}
\newcommand\draftnodeanchor{1in+\voffset-\topmargin}
\AddEverypageHook{%
  \begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
    \DraftContent
  \end{textblock*}
}

% Conditional evaluation to position the draft water mark  (top / bottom)
\renewcommand\SetDraftWMPosition[1]{%
  \renewcommand\draftposition{#1}
  \ifthenelse{\equal{\draftposition}{bottom}}
    {\renewcommand\draftnodeanchor{\paperheight-\voffset}} %Bottom
    {\ifthenelse{\equal{\draftposition}{top}}
      {\renewcommand\draftnodeanchor{1in+\voffset-\topmargin}} %Top
      {\ClassWarning{PDThesisPSnPDF}{Unrecognised draft position
          using default value of top}
        \renewcommand\draftnodeanchor{1in+\voffset-\topmargin}}} %Top
    
    \AddEverypageHook{%
    \begin{textblock*}{\paperwidth}[0.,2.5](0\paperwidth,\draftnodeanchor)
      \DraftContent
    \end{textblock*}
  }
}

% If NOT Draft
\else 

\renewcommand\SetDraftText[1]{\ClassWarning{PhDThesisPSnPDF}{Draft is
    inactive, to use SetDraftText include `draft' in the document 
    class options.}}
% Draft Version
\renewcommand\SetDraftVersion[1]{\ClassWarning{PhDThesisPSnPDF}{Draft is
    inactive, to use SetDraftVersion include `draft' in the document
    class options.}}
% Draft Content
\renewcommand\SetDraftWMPosition[1]{\ClassWarning{PhDThesisPSnPDF}{Draft
    is inactive, to use SetDraftWMPosition include `draft' in the document
    class options.}}

\renewcommand\SetDraftGrayScale[1]{\ClassWarning{PhDThesisPSnPDF}{Draft is
    inactive, to use SetDraftWMPosition include `draft' in the document
    class options.}}
\fi



% ******************************* Bibliography *********************************
\ifPHD@authoryear
  \ifPHD@biblatex
    \RequirePackage[backend=biber, style=authoryear, citestyle=alphabetic, 
      sorting=nty, natbib=true]{biblatex}
    \setBiBLaTeXtrue
  \else
    \RequirePackage[round, sort, numbers, authoryear]{natbib} %author year
  \fi
\else
  \ifPHD@numbered
    \ifPHD@biblatex
      \RequirePackage[backend=biber, style=numeric-comp, 
        citestyle=numeric, sorting=none, natbib=true]{biblatex}
      \setBiBLaTeXtrue
    \else
      \RequirePackage[numbers,compress]{natbib} % numbered citation
    \fi
  \else
    \ifuseCustomBib
       \AtBeginDocument{
          \@ifpackageloaded{natbib}{}{
            \@ifpackageloaded{biblatex}{}{
              \ClassWarning{PhDThesisPSnPDF}{%
                You chose custom bibliography, but no corresponding package 
                (biblatex/natbib) has been loaded. Please load the
                appropriate bibliography package in the preamble.}
            }
          }
        }
    \else                                            % set default to numbered
      \ifPHD@biblatex
        \RequirePackage[backend=biber, style=numeric-comp,
          citestyle=numeric, sorting=none, natbib=true]{biblatex}
        \setBiBLaTeXfalse
      \else
        \RequirePackage[numbers,compress]{natbib} 
      \fi % default
      \setBibfalse
    \fi % custombib
  \fi % numbered
\fi % author year

\ifsetBib
\else
\ClassWarning{PhDThesisPSnPDF}{No bibliography style was specified.
  Default numbered style is used. If you would like to use a 
  different style, use `authoryear' or `numbered' in the options in
  documentclass or use `custombib` and define the natbib package or
  biblatex package with required style in the Preamble.tex file}
\fi

% ********************************** Fonts **********************************
\RequirePackage{textcomp}
% Font Selection
\ifPHD@times
  \ifxetex
  \else
    \RequirePackage{mathptmx}  % times roman, including math (where possible)
  \fi
  \setFonttrue
  \message{PhDThesisPSnPDF: Using Times Roman font}
\else
  \ifPHD@fourier
    \RequirePackage{fourier} % Fourier
    \setFonttrue
    \message{PhDThesisPSnPDF: Using Fourier font}
  \else
    \ifsetCustomFont
      \setFonttrue
      \message{PhDThesisPSnPDF: Using custom font}
    \else
      \setFontfalse
      \message{PhDThesisPSnPDF: No font is set}
    \fi % custom font
  \fi % Fourier font
\fi % Times font

% If Font is not set throw a warning.
\ifsetFont
\else
  \ClassWarning{PhDThesisPSnPDF}{Using default font Latin Modern. If you
    would like to use other pre-defined fonts use `times' (The Cambridge 
    University PhD thesis guidelines recommend using Times font)  or `fourier'
    or load a custom font in the preamble.tex file by specifying `customfont' 
    in the class options}
  \RequirePackage{lmodern}
\fi


\ifxetex
  % XeLaTeX
  \usepackage{amsmath}
  \usepackage{fontspec}
  \usepackage[]{unicode-math}
  \setmainfont[
    Extension = .otf,
    UprightFont = *-regular,
    BoldFont = *-bold,
    ItalicFont = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{xits}
  
  \setmathfont[ 
    Extension = .otf,
    BoldFont = *bold,
  ]{xits-math}
  
\else
  % default: pdfLaTeX
  \RequirePackage[utf8]{inputenc}
  \RequirePackage[T1]{fontenc}
  
  % If building with PDFLaTeX, use microtype spacing adjustments
  \RequirePackage[final]{microtype}
  
  \input{glyphtounicode}
  \pdfglyphtounicode{f_f}{FB00}
  \pdfglyphtounicode{f_i}{FB01}
  \pdfglyphtounicode{f_l}{FB02}
  \pdfglyphtounicode{f_f_i}{FB03}
  \pdfglyphtounicode{f_f_l}{FB04}
  \pdfgentounicode=1

  \RequirePackage{amsfonts}
  \RequirePackage{amsmath}
  \RequirePackage{amssymb}
\fi

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\RequirePackage[unicode=true]{hyperref}

\if@print
  % For Print version
  \hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=true,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage,
    colorlinks=true,
    linkcolor=black,
    urlcolor=black,
    citecolor=black,
    anchorcolor=black
  }
  \ifsetCustomMargin
  % Margin to be define in preamble using geometry package
  \else
    \RequirePackage[paper=\PHD@papersize,hmarginratio=1:1,
      vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
  \fi

  \if@twoside
    \hypersetup{pdfpagelayout=TwoPageRight}
  \else
    \hypersetup{pdfpagelayout=OneColumn}
  \fi

\else
  % For PDF Online version
  \hypersetup{
    final=true,
    plainpages=false,
    pdfstartview=FitV,
    pdftoolbar=true,
    pdfmenubar=true,
    bookmarksopen=true,
    bookmarksnumbered=true,
    breaklinks=true,
    linktocpage,
    colorlinks=true,
    linkcolor=blue,
    urlcolor=blue,
    citecolor=blue,
    anchorcolor=green
  }

  \ifsetCustomMargin
    % Margin to be define in preamble using geometry package
    \else
      % No Margin staggering on Odd and Even side
      \RequirePackage[paper=\PHD@papersize,hmarginratio=1:1,
        vmarginratio=1:1,scale=0.75]{geometry} % dvips
    \fi
    \hypersetup{pdfpagelayout=OneColumn}
\fi

% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
\ifpdf
  % PDFLaTeX does it automatically.
\else
  % dvips
  \RequirePackage{breakurl} % to split the url over multiple lines
\fi
  
% ******************************************************************************
% **************************** Pre-defined Settings ****************************
% ******************************************************************************

% *************************** Setting PDF Meta-Data ****************************
\ifpdf
\AtBeginDocument{
  \hypersetup{
    pdftitle = {\@title},
    pdfauthor = {\@author},
    pdfsubject={\@subject},
    pdfkeywords={\@keywords}
  }
}
\fi

% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PhD Thesis
% In practice, fortunately, nobody knows really what “one-and-a-half spaced
% type” means exactly (in terms of millimetres baseline distance). The following
% LaTeX setting has routinely been considered perfectly acceptable:

\renewcommand\baselinestretch{1.2}

% ******************************** Justification *******************************
% Left aligned as per University identity guidelines
\ifPHD@textJustify
\message{PhDThesisPSnPDF: The University identity guidelines recommend using 
left aligned text. Please use `flushleft' in the documentclass option, if you
wish to left align your text}
\else
\AtBeginDocument{
\raggedright
}
\fi


% ************************** TOC and Hide Sections *****************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{
	\bgroup\let
	\addcontentsline=\nocontentsline#1{#2}
	\egroup}
% Removes pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}


% ***************************** Header Formatting ******************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

% Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
\fancypagestyle{PageStyleI}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1\ }}
  \fancyhf{}
  \fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | 
    \hspace{0.25em} \bfseries{\thepage}}
  \fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | 
    \hspace{0.25em} \nouppercase \leftmark}
}

% Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
\fancypagestyle{PageStyleII}{
  \renewcommand{\chaptermark}[1]{\markboth{##1}{}}
  \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
  \fancyhf{}
  \fancyhead[RO]{\bfseries\nouppercase \rightmark}
  \fancyhead[LE]{\bfseries \nouppercase \leftmark}
  \fancyfoot[C]{\thepage}
}


% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{

\pagestyle{fancy}

\ifPHD@pageStyleI
  % Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
  \pagestyle{PageStyleI}

\else
  \ifPHD@pageStyleII

  % Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
  \pagestyle{PageStyleII}

  \else
  % Default Style: Sets Page Number at the Top (LE/RO) with Chapter/Section Name
  % on LO/RE and an empty footer
    \renewcommand{\chaptermark}[1]{\markboth {##1}{}}
    \renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
    \fancyhf{}
    \fancyhead[LO]{\nouppercase \rightmark}
    \fancyhead[LE,RO]{\bfseries\thepage}
    \fancyhead[RE]{\nouppercase \leftmark}
  \fi
\fi
}

\setlength{\headheight}{14.5pt}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}

% If Margin has been set (default margin print/online version)
\ifsetCustomMargin
\AtBeginDocument{
\@ifpackageloaded{geometry}{}{\ClassWarning{PhDThesisPSnPDF}{%
  Custom margin is chosen, but geometry package is not loaded. Please load the
  `geometry' package in the preamble.}}}
\else
\setFancyHdr % Apply fancy header settings otherwise apply it in preamble
\fi

% **************** Clear Header Style on the Last Empty Odd pages **************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ******************************************************************************
% **************************** Macro Definitions *******************************
% ******************************************************************************
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% Subtitle (optional)
\newcommand{\@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\@subtitle}{#1}}

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{\monthname[\the\month]\space\the\year}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degreetitle}{}
\newcommand{\degreetitle}[1]{\renewcommand{\@degreetitle}{#1}}

% The name of your department(eg. Engineering, Maths, Physics)
\newcommand{\@dept}{}
\newcommand{\dept}[1]{\renewcommand{\@dept}{#1}}

% The name of your college (eg. King's)
\newcommand{\@college}{}
\newcommand{\college}[1]{\renewcommand{\@college}{#1}}

% The name of your University
\newcommand{\@university}{}
\newcommand{\university}[1]{\renewcommand{\@university}{#1}}

% Defining the crest
\newcommand{\@crest}{}
\newcommand{\crest}[1]{\renewcommand{\@crest}{#1}}

% Defining the college crest
\newif\ifPHD@collegeshield\PHD@collegeshieldfalse
\newcommand{\@collegeshield}{}
\newcommand{\collegeshield}[1]{\renewcommand{\@collegeshield}{#1}\PHD@collegeshieldtrue}

% Supervisor
\newif\ifPHD@supervisor\PHD@supervisorfalse
\newcommand{\@supervisor}{}
\newcommand{\supervisor}[1]{\renewcommand{\@supervisor}{#1}\PHD@supervisortrue}

% Supervisor Title (Supervisor - Default, can be changed)
\newcommand{\@supervisorrole}{Supervisor: }
\newcommand{\supervisorrole}[1]{\renewcommand{\@supervisorrole}{#1}}

% Supervisor width to align
\newcommand{\@supervisorlinewidth}{0.35\textwidth}
\newcommand{\supervisorlinewidth}[1]{\renewcommand{\@supervisorlinewidth}{#1}}

% Advisor
\newif\ifPHD@advisor\PHD@advisorfalse
\newcommand{\@advisor}{}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}\PHD@advisortrue}

% Advisor Title (Advisor - Default, can be changed)
\newcommand{\@advisorrole}{Advisor: }
\newcommand{\advisorrole}[1]{\renewcommand{\@advisorrole}{#1}}

% Advisor width to align
\newcommand{\@advisorlinewidth}{0.25\textwidth}
\newcommand{\advisorlinewidth}[1]{\renewcommand{\@advisorlinewidth}{#1}}

% Submission Text
\newcommand{\submissiontext}{This dissertation is submitted for the degree of }

% keywords (These keywords will appear in the PDF meta-information
% called `pdfkeywords`.)
\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\@keywords}{#1}}

% subjectline (This subject will appear in the PDF meta-information
% called `pdfsubject`.)
\newcommand{\@subject}{}
\newcommand{\subject}[1]{\renewcommand{\@subject}{#1}}


% These macros define an environment for front matter that is always
% single column even in a double-column document.
\newenvironment{alwayssingle}{%
       \@restonecolfalse\if@twocolumn\@restonecoltrue\onecolumn
       \else\newpage\fi}
       {\if@restonecol\twocolumn\else\newpage\fi}

% Set single column even under two column layout
\newcommand{\setsinglecolumn}{
\if@twocolumn
   \onecolumn
\else
\fi
}


% ******************************************************************************
% *************************** Front Matter Layout ******************************
% ******************************************************************************

% ******************************** Title Page **********************************
\renewcommand{\maketitle}{

% To compute the free vertical space in Title page
\computeTitlePageSpacing

\thispagestyle{empty}

\begin{singlespace}
\begin{center}

% University Crest Long if college crest is defined
\ifPHD@collegeshield%
	{\usebox{\PHD@crest}}
	\vspace{.15\PHD@titlepagespacing}
\fi

% Title
{\usebox{\PHD@Title}} % subtitle is defined


% Crest

\ifPHD@collegeshield%
	\vspace{.15\PHD@titlepagespacing}
	{\usebox{\PHD@collegecrest}}
	\vspace{.1\PHD@titlepagespacing}
\else
	\vspace{.25\PHD@titlepagespacing}
	{\usebox{\PHD@crest}}
	\vspace{.15\PHD@titlepagespacing}
\fi



% Author
{\usebox{\PHD@author}}
\vspace*{1em}

% Supervisor
\ifPHD@supervisor%
{\usebox{\PHD@supervisor}}
\vspace*{0.5em}
\fi

% Advisor
\ifPHD@advisor%
{\usebox{\PHD@advisor}}
\vspace*{0.5em}
\fi

% Department and University
{\usebox{\PHD@dept}}
\vspace{.2\PHD@titlepagespacing}

% Submission Text
{\usebox{\PHD@submission}}

% College and degree date
\vfill
{\usebox{\PHD@collegedate}}
    
\end{center}

\end{singlespace}
}

% ********************************* Dedication *********************************
% The dedication environment makes sure the dedication gets its
% own page, centered

\newenvironment{dedication}
{
\cleardoublepage
\setsinglecolumn
\vspace*{0.2\textheight}
\thispagestyle{empty}
\centering
}



% ******************************* Declaration **********************************
% The declaration environment puts a large, bold, centered
% "Declaration" label at the top of the page.

\newenvironment{declaration}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Declaration}
\thispagestyle{empty}
}{
\flushright
\@author{}\\
\@degreedate{}
\vfill
}



% ****************************** Acknowledgements ********************************
% The acknowledgements environment puts a large, bold, centered
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Acknowledgements}
\thispagestyle{empty}
}



% ******************************* Nomenclature *********************************
\RequirePackage[intoc]{nomencl}
\makenomenclature
\renewcommand{\nomgroup}[1]{%
\ifthenelse{\equal{#1}{A}}{\item[\textbf{Roman Symbols}]}{%
\ifthenelse{\equal{#1}{G}}{\item[\textbf{Greek Symbols}]}{%
\ifthenelse{\equal{#1}{Z}}{\item[\textbf{Acronyms / Abbreviations}]}{%
\ifthenelse{\equal{#1}{R}}{\item[\textbf{Superscripts}]}{%
\ifthenelse{\equal{#1}{S}}{\item[\textbf{Subscripts}]}{%
\ifthenelse{\equal{#1}{X}}{\item[\textbf{Other Symbols}]}
{}
}% matches mathematical symbols > X
}% matches Subscripts           > S
}% matches Superscripts         > R
}% matches Abbreviations        > Z
}% matches Greek Symbols        > G
}% matches Roman Symbols        > A

% To add nomenclature in the header
\renewcommand{\nompreamble}{\markboth{\nomname}{\nomname}}

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}[1][]{
\ifthenelse{\equal {#1}{}}
{\printnomenclature}
{\printnomenclature[#1]}
%\addcontentsline{toc}{chapter}{\nomname}
}


% ***************************** Create the index *******************************
\ifPHD@index
    \RequirePackage{makeidx}
    \makeindex
    \newcommand{\printthesisindex}{
        \cleardoublepage
        \phantomsection
        \printindex}
\else
    \newcommand{\printthesisindex}{}
\fi

% ***************************** Chapter Mode ***********************************
% The chapter mode allows user to only print particular chapters with references
% All other options are disabled by default
% To include only specific chapters without TOC, LOF, Title and Front Matter
% To send it to supervisior for changes

\ifPHD@chapter
    \defineChaptertrue
    % Disable the table of contents, figures, tables, index and nomenclature
    \renewcommand{\maketitle}{}
    \renewcommand{\tableofcontents}{}
    \renewcommand{\listoffigures}{}
    \renewcommand{\listoftables}{}
    \renewcommand{\printnomencl}{}
    \renewcommand{\printthesisindex}{}
\else
    \defineChapterfalse
\fi

% ******************************** Abstract ************************************
% The abstract environment puts a large, bold, centered "Abstract" label at
% the top of the page. Defines both abstract and separate abstract environment

% To include only the Title and the abstract pages for submission to BoGS
\ifPHD@abstract
    \defineAbstracttrue
    % Disable the table of contents, figures, tables, index and nomenclature
    \renewcommand{\tableofcontents}{}
    \renewcommand{\listoffigures}{}
    \renewcommand{\listoftables}{}
    \renewcommand{\printnomencl}{}
    \renewcommand{\printnomencl}[1][2]{}
    \renewcommand{\printthesisindex}{}
    \renewcommand{\bibname}{}
    \renewcommand{\bibliography}[1]{\thispagestyle{empty}}
\else
    \defineAbstractfalse
\fi


\newenvironment{abstract} {
\ifPHD@abstract
% Separate abstract as per Student Registry guidelines
  \thispagestyle{empty}
  \setsinglecolumn
  \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1em} \@author} \par}
  \end{center}
\else
% Normal abstract in the thesis
  \cleardoublepage
  \setsinglecolumn
  \chapter*{\centering \Large Abstract}
  \thispagestyle{empty}
\fi
}


% ******************** To compute empty space in title page *******************
% Boxes below are used to space different contents on the title page
% Based on https://github.com/cambridge/thesis

\newcommand{\computeTitlePageSpacing}{


% Title Box
\newsavebox{\PHD@Title}
\begin{lrbox}{\PHD@Title}
  \begin{minipage}[c]{0.98\textwidth}
    \centering \Huge \bfseries{\@title}
    \ifthenelse{\equal{\@subtitle}{}}{
      % subtitle is not defined
    }{
      \\
      \centering \Large {\@subtitle}
    } % subtitle is defined
  \end{minipage}
\end{lrbox}

% University Crest Box
\newsavebox{\PHD@crest}
\begin{lrbox}{\PHD@crest}
  {\@crest \par}
\end{lrbox}

\newsavebox{\PHD@collegecrest}
\begin{lrbox}{\PHD@collegecrest}
  \ifPHD@collegeshield%
    {\@collegeshield}
  \else
    % College shield is undefined
  \fi
\end{lrbox}

% Author Box
\newsavebox{\PHD@author}
\begin{lrbox}{\PHD@author}
  \begin{minipage}[c]{\textwidth}
    \centering \Large \bfseries{\@author}
      \vspace{0.5em}   
  \end{minipage}
\end{lrbox}

% Supervisor Box
\newsavebox{\PHD@supervisor}
\begin{lrbox}{\PHD@supervisor}
  \begin{minipage}[c]{\textwidth}
    \ifthenelse{\equal{\@supervisor}{}}{
      % supervisor is not defined
    }{
      \begin{center}
        \makebox[\widthof{supervisorrole} + \@supervisorlinewidth][c]{
          \Large
          \@supervisorrole \parbox[t]{\@supervisorlinewidth}{\@supervisor}
        }
      \end{center}
      \vspace{0.5em}
    } % supervisor is defined
  \end{minipage}
\end{lrbox}

% Advisor Box
\newsavebox{\PHD@advisor}
\begin{lrbox}{\PHD@advisor}
  \begin{minipage}[c]{\textwidth}
    \ifthenelse{\equal{\@advisor}{}}{
      % advisor is not defined
    }{
      \begin{center}
        \makebox[\widthof{advisorrole} + \@advisorlinewidth][c]{
          \Large
          \@advisorrole \parbox[t]{\@advisorlinewidth}{\@advisor}
        }
      \end{center}
      \vspace{0.5em}
    } % advisor is defined
  \end{minipage}
\end{lrbox}

% Department Box
\newsavebox{\PHD@dept}
\begin{lrbox}{\PHD@dept}
  \begin{minipage}[c]{\textwidth}
    \centering {\large \@dept \par}
	       {\large \@university \par}
  \end{minipage}
\end{lrbox}

% Submission Box
\newsavebox{\PHD@submission}
\begin{lrbox}{\PHD@submission}
  \begin{minipage}[c]{\textwidth}
    \begin{center}
      \large \submissiontext \par
      \large \textit {\@degreetitle} \par
    \end{center}
  \end{minipage}
\end{lrbox}

% College and Date Box
\newsavebox{\PHD@collegedate}
\begin{lrbox}{\PHD@collegedate}
\begin{minipage}[c]{\textwidth}
  \large
  \ifthenelse{\equal{\@college}{}}{
    % college is not defined
    \begin{center}
      \@degreedate
    \end{center}
  }{
    % college is defined
    \begin{minipage}[b]{0.49\textwidth}
      \flushleft\@college
    \end{minipage}
    \begin{minipage}[b]{0.49\textwidth}
      \flushright \@degreedate
    \end{minipage}
  } % college is defined
\end{minipage}
\end{lrbox}

%  Now to compute the free vertical space
\newlength{\PHD@titlepagespacing}
\setlength{\PHD@titlepagespacing}{ \textheight %
			- \totalheightof{\usebox{\PHD@Title}}
			- \totalheightof{\usebox{\PHD@crest}}
			- \totalheightof{\usebox{\PHD@collegecrest}}
			- \totalheightof{\usebox{\PHD@author}}
                   	- \totalheightof{\usebox{\PHD@supervisor}}
                   	- \totalheightof{\usebox{\PHD@advisor}}
			- \totalheightof{\usebox{\PHD@dept}}
			- \totalheightof{\usebox{\PHD@submission}}
			- \totalheightof{\usebox{\PHD@collegedate}}
}
}

