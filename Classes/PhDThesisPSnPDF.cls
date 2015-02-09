%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis PSnPDF''                                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v1.4.5                                                            %%
%% Authors: Krishna Kumar                                                     %%
%% Date: 2013/11/16 (inception)                                               %%
%% License: MIT License (c) 2013 Krishna Kumar                                %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\newcommand\fileversion{1.4.5}
\newcommand\filedate{2014/12/02}
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

% ****************************** Draft Option **********************************
\newif\ifsetDraft\setDraftfalse
\newif\ifsetDraftClassic\setDraftClassicfalse

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

\ProcessOptions\relax%

% *************************** Pre-defined Options ******************************

% Font Size
\newcommand\PHD@ptsize{12pt} %Set Default Size as 12

\DeclareOption{10pt}{
  \ClassWarning{PhDThesisPSnPDF}{The Cambridge University PhD thesis guidelines
recommend using a minimum font size of 11pt (12pt is preferred) and 10pt for
footnotes.}
  \renewcommand\PHD@ptsize{10pt}
}
\DeclareOption{11pt}{\renewcommand\PHD@ptsize{11pt}}%
\DeclareOption{12pt}{\renewcommand\PHD@ptsize{12pt}}%
\PassOptionsToClass{\PHD@ptsize}{book}%
\message{PhDThesisPSnPDF: Font size is set as \PHD@ptsize}

% Page Size
\newcommand\PHD@papersize{a4paper} % Set Default as a4paper

\DeclareOption{a4paper}{\renewcommand\PHD@papersize{a4paper}}
\DeclareOption{a5paper}{\renewcommand\PHD@papersize{a5paper}}
\DeclareOption{letterpaper}{
  \ClassWarning{PhDThesisPSnPDF}{The Cambridge University Engineering Deparment
    PhD thesis guidelines recommend using A4 or A5paper}
  \renewcommand\PHD@papersize{letterpaper}
}

\PassOptionsToClass{\PHD@papersize}{book}%

% Column layout
\newif\if@oneside\@onesidefalse
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}\@onesidetrue}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

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


% Deprecated option - use draft instead
\DeclareOption{draftmode}{
\ClassError{PhDThesisPSnPDF}{This option is deprecated. Use `draft' 
  instead this option replaces `draftmode'. To use the classic version
  of draft use `draftclassic`}
\stop}% 


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

% Determine whether to run pdftex or dvips
\ProcessOptions\relax%
\newif\ifsetDVI\setDVIfalse
\ifx\pdfoutput\undefined
  % we are not running PDFLaTeX
  \setDVItrue
  \LoadClass[dvips,fleqn,openright]{book}%
\else % we are running PDFLaTeX
  \ifnum \pdfoutput>0
    %PDF-Output
    \setDVIfalse
    \LoadClass[pdftex,fleqn,openright]{book}%
  \else
    %DVI-output
    \setDVItrue
    \LoadClass[fleqn,openright]{book}%
  \fi
\fi



% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************
% ************************** Layout and Formatting *****************************
\renewcommand\pdfshellescape{1}
\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in paragraph
\RequirePackage{calc}     % To calculate vertical spacing

% ************************* Conditional Statements *****************************
\RequirePackage{ifthen}  % conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX


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
% Disable figures in `draftmode'\
\setkeys{Gin}{draft=true}
\fi

% If Draft Mode is active
\ifsetDraft
% Disable figures in `draftmode'\
\setkeys{Gin}{draft=false}

% Line numbering (can be switched off)
\ifPHD@lineno
\RequirePackage[switch,pagewise,mathlines]{lineno}
\renewcommand{\frontmatter}{\nolinenumbers}
\renewcommand{\mainmatter}{\linenumbers}
\renewcommand{\backmatter}{\linenumbers}

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
  \renewcommand\drafttext{#1}}
% Draft Version
\newcommand\draftVersion{v1.0}
\renewcommand\SetDraftVersion[1]{%
  \renewcommand\draftVersion{#1}}
% Draft Gray Scale
\newcommand\draftGrayScale{0.75}
\renewcommand\SetDraftGrayScale[1]{%
  \renewcommand\draftGrayScale{#1}}

% Draft Content
\newcommand\DraftContent{%
\hspace*{\fill}
\Large
\textcolor[gray]{\draftGrayScale}{%
{\drafttext}\space-\space{\draftVersion}\hspace{\stretch{1}}{\PHD@daytime}
\hspace*{\fill}}}

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

% If NOT Draft Mode
\else 

\renewcommand\SetDraftText[1]{\ClassWarning{PhDThesisPSnPDF}{DraftMode is
    inactive, to use SetDraftText include `draftmode' in the document 
    class options.}}
% Draft Version
\renewcommand\SetDraftVersion[1]{\ClassWarning{PhDThesisPSnPDF}{DraftMode is
    inactive, to use SetDraftVersion include `draftmode' in the document
    class options.}}
% Draft Content
\renewcommand\SetDraftWMPosition[1]{\ClassWarning{PhDThesisPSnPDF}{DraftMode
    is inactive, to use SetDraftWMPosition include `draftmode' in the document
    class options.}}

\renewcommand\SetDraftGrayScale[1]{\ClassWarning{PhDThesisPSnPDF}{DraftMode is
    inactive, to use SetDraftWMPosition include `draftmode' in the document
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
      \RequirePackage[numbers,sort&compress]{natbib} % numbered citation
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
        \RequirePackage[numbers,sort&compress]{natbib} 
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

% *********************** To copy ligatures and Fonts **************************
\RequirePackage{textcomp}
% Font Selection
\ifPHD@times
  \RequirePackage{mathptmx}  % times roman, including math (where possible)
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

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{f_l}{FB02}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfgentounicode=1

% Don't break enumeration (etc.) across pages in an ugly manner
\clubpenalty=10000
\widowpenalty=10000

% If building with PDFLaTeX, use microtype spacing adjustments
\RequirePackage[final]{microtype}

%******************************* Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering

% Moved below other usepackage definitions to fix PDFLaTeX footnote warning
% Based on the suggestion by John Plaice

\ifsetDVI
\special{papersize=\the\paperwidth,\the\paperheight}
\RequirePackage[dvips,unicode=true]{hyperref}
\else
\RequirePackage[unicode=true]{hyperref}
\pdfpagewidth=\the\paperwidth
\pdfpageheight=\the\paperheight
\fi

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
        \ifsetDVI
        % Odd and Even side Margin for binding and set viewmode for PDF
	\RequirePackage[dvips,paper=\PHD@papersize,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
        \else
	\RequirePackage[pdftex,paper=\PHD@papersize,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
        \fi
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
        \ifsetDVI
	\RequirePackage[dvips,paper=\PHD@papersize,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75]{geometry}
        \else
	\RequirePackage[pdftex,paper=\PHD@papersize,hmarginratio=1:1,
          vmarginratio=1:1,scale=0.75]{geometry}
        \fi
    \fi

    \hypersetup{pdfpagelayout=OneColumn}
\fi

% Backward compatibility - setMargin is now replaced with customMargin
\ifsetCustomMargin
  \setMarginfalse
\else
  \setMargintrue
\fi

% ************************ URL Package and Definition **************************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sffamily}}
 {\renewcommand{\UrlFont}{\normalsize}}}
\urlstyle{leo}

% option to split urls over multiple lines for latex >> DVIPS >> PDF option
% PDFLaTeX does it automatically.

\ifsetDVI
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

% Set Fancy Header Command is defined to Load FancyHdr after Geometry is defined
\newcommand{\setFancyHdr}{

\pagestyle{fancy}
\ifPHD@pageStyleI
% Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1\ }}
\fancyhf{}
\fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | 
  \hspace{0.25em} \bfseries{\thepage}}
\fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | 
  \hspace{0.25em} \nouppercase \leftmark}


\else
\ifPHD@pageStyleII
% Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
\renewcommand{\chaptermark}[1]{\markboth{##1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ ##1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\nouppercase \rightmark}
\fancyhead[LE]{\bfseries \nouppercase \leftmark}
\fancyfoot[C]{\thepage}


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


% ******************************** Roman Pages *********************************
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}{
  \setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}

% ******************************* Appendices **********************************
% Appending the appendix name to the letter in TOC
% Especially when backmatter is enabled

%\renewcommand\backmatter{
%    \def\chaptermark##1{\markboth{%
%        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}{%
%        \ifnum  \c@secnumdepth > \m@ne  \@chapapp\ \thechapter:  \fi  ##1}}%
%    \def\sectionmark##1{\relax}}


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

% ******************************** titlepage  **********************************

% Fix issue of title page having same number as the next page in oneside option
% Issue #24 https://github.com/kks32/phd-thesis-template/issues/24
\if@oneside
\renewenvironment{titlepage} % changed from "newenvironment"
{%
\begingroup
\if@twocolumn
    \@restonecoltrue\onecolumn
\else
    \@restonecolfalse\newpage
\fi
\thispagestyle{empty}
\setcounter{page}\z@ 
}%
{

\if@restonecol
    \twocolumn
\else 
    \newpage 
\fi 
\endgroup
\clearpage
\addtocounter{page}{1}
}
\fi

% ******************************** Title Page **********************************
\renewcommand{\maketitle}{

% To compute the free vertical space in Title page
\computeTitlePageSpacing

% Fix for issue #24 https://github.com/kks32/phd-thesis-template/issues/24
\renewcommand*{\thepage}{i}

\begin{singlespace}
\begin{center}
% Title
{\Huge \bfseries{\@title} \par}
\ifthenelse{\equal{\@subtitle}{}}{
% subtitle is not defined
}{
\vspace*{1em}
\centering \Large {\@subtitle}
} % subtitle is defined

\vspace{.25\PHD@titlepagespacing}

% Crest
{\@crest \par}
\vspace{.2\PHD@titlepagespacing}

% Author
{\Large \bfseries{\@author} \par}
\vspace*{1em}

% Department and University
{\large \@dept \par}
\vspace*{1ex}
{\large \@university \par}
\vspace{.2\PHD@titlepagespacing}

% Submission Text
{\large \submissiontext \par}
\vspace*{1ex}
{\large \textit {\@degreetitle} \par}

\end{center}

% College and degree date
\vfill
\large

\ifthenelse{\equal{\@college}{}}{
% college is not defined
\centering
\@degreedate
}{
  % college is defined
\begin{minipage}[b]{0.45\textwidth}
\flushleft\@college
\end{minipage}
\begin{minipage}[b]{0.45\textwidth}
\flushright\@degreedate
\end{minipage}
} % end-if- college is defined
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


% ******************** To compute empty space in title page ********************
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
\vspace*{1em}
\centering \Large {\@subtitle}
} % subtitle is defined
\end{minipage}
\end{lrbox}

% University Crest Box
\newsavebox{\PHD@crest}
\begin{lrbox}{\PHD@crest}
\@crest
\end{lrbox}

% Author Box
\newsavebox{\PHD@author}
\begin{lrbox}{\PHD@author}
\begin{minipage}[c]{\textwidth}
\centering \Large \bfseries{\@author}
\end{minipage}
\end{lrbox}

% Department Box
\newsavebox{\PHD@dept}
\begin{lrbox}{\PHD@dept}
\begin{minipage}[c]{\textwidth}
\centering {\large \@dept \par}
\vspace*{1em}
{\large \@university \par}
\end{minipage}
\end{lrbox}

% Submission Box
\newsavebox{\PHD@submission}
\begin{lrbox}{\PHD@submission}
\begin{minipage}[c]{\textwidth}
\begin{center}
\large \submissiontext \par
\vspace*{1ex}
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
\@degreedate
}{
% college is defined
\begin{minipage}{0.49\textwidth}
\flushleft\@college
\end{minipage}
\begin{minipage}{0.49\textwidth}
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
			- \totalheightof{\usebox{\PHD@author}}
			- \totalheightof{\usebox{\PHD@dept}}
			- \totalheightof{\usebox{\PHD@submission}}
			- \totalheightof{\usebox{\PHD@collegedate}}
}
}

