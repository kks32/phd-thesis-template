%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                            %%
%% Class ``PhD Thesis PSnPDF''                                                %%
%%                                                                            %%
%% A PhD thesis LaTeX template for Cambridge University Engineering Department%%
%%                                                                            %%
%% Version: v1.0                                                              %%
%% Authors: Krishna Kumar                                                     %%
%% Date: 2013/11/16 (inception)                                               %%
%% License: MIT License (c) 2013 Krishna Kumar                                %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                 %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ************************** Class Identification ******************************
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesisPSnPDF}[2013/12/10 version 1.0 by Krishna Kumar]
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
\DeclareOption{times}{\PHD@timestrue}

\newif\ifPHD@fourier\PHD@fourierfalse         % Fourier with Math Support
\DeclareOption{fourier}{\PHD@fouriertrue}

\newif\ifPHD@customfont\PHD@customfontfalse   % Custom Font with Math Support
\DeclareOption{customfont}{\PHD@customfonttrue}

% ******************************* Bibliography *********************************
\newif\ifsetBib\setBibfalse                   % Custom Bibliography = true/false
\newif\ifsetBiBLaTeX\setBiBLaTeXfalse         % BiBLaTeX = True / False

\newif\ifPHD@biblatex\PHD@biblatexfalse       % BiBLaTeX
\DeclareOption{biblatex}{\PHD@biblatextrue}

\newif\ifPHD@authoryear\PHD@authoryearfalse   % Author-Year citation
\DeclareOption{authoryear}{\PHD@authoryeartrue}

\newif\ifPHD@numbered\PHD@numberedfalse       % Numbered citiation
\DeclareOption{numbered}{\PHD@numberedtrue}

\newif\ifPHD@custombib\PHD@custombibfalse     % Custom Bibliography
\DeclareOption{custombib}{\PHD@custombibtrue}

% ************************* Header / Footer Styling ****************************
\newif\ifPHD@pageStyleI\PHD@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\PHD@pageStyleItrue}

\newif\ifPHD@pageStyleII\PHD@pageStyleIIfalse % Set Page StyleII
\DeclareOption{PageStyleII}{\PHD@pageStyleIItrue}

% ***************************** Custom Margins  ********************************
\newif\ifsetMargin\setMarginfalse % Margins are not set

\newif\ifPHD@custommargin\PHD@custommarginfalse % Custom margin
\DeclareOption{custommargin}{\PHD@custommargintrue}

% **************************** Separate Abstract  ******************************
\newif \ifdefineAbstract\defineAbstractfalse %To enable Separate abstract

\newif\ifPHD@abstract\PHD@abstractfalse % Enable Separate Abstract
\DeclareOption{abstract}{
  \PHD@abstracttrue     
  \ClassWarning{PhDThesisPSnPDF}{You have chosen an option that generates only
the Title page and an abstract with PhD title and author name, if this was
intentional, ignore this warning. Congratulations on submitting your thesis!!
If not, please remove the option `abstract' from the document class and
recompile. Good luck with your writing!}
  \PassOptionsToClass{oneside}{book}
}

% ****************** Chapter Mode - To print only selected chapters ************
\newif \ifdefineChapter\defineChapterfalse %To enable Separate abstract

\newif\ifPHD@chapter\PHD@chapterfalse % Enable Separate Abstract
\DeclareOption{chapter}{
  \PHD@chaptertrue     
  \ClassWarning{PhDThesisPSnPDF}{You have chosen an option that generates only selected chapters with references, if this was intentional, ignore this warning. If not, please remove the option `chapter' from the document class and recompile. Good luck with your writing!}
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
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Draft Mode
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}%

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

%* ***************************** Print / Online ********************************
% Defines a print / online version to define page-layout and hyperrefering 
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
    \ifPHD@custommargin
        \setMarginfalse
    \else
        \ifsetDVI
        % Odd and Even side Margin for binding and set viewmode for PDF
	\RequirePackage[dvips,paper=\PHD@papersize,hmarginratio=1:1,vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
        \else
	\RequirePackage[pdftex,paper=\PHD@papersize,hmarginratio=1:1,vmarginratio=1:1,scale=0.75,bindingoffset=5mm]{geometry}
        \fi
	\setMargintrue
    \fi

    \if@twoside 
        \hypersetup{pdfpagelayout=TwoPageRight}
    \else 
    	\hypersetup{pdfpagelayout=OneColumn}
    \fi

\else
    % For PDF Online version
    \hypersetup{
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
    
    \ifPHD@custommargin
        \setMarginfalse
    \else
	% No Margin staggering on Odd and Even side 
        \ifsetDVI
	\RequirePackage[dvips,paper=\PHD@papersize,hmarginratio=1:1,vmarginratio=1:1,scale=0.75]{geometry} 
        \else
	\RequirePackage[pdftex,paper=\PHD@papersize,hmarginratio=1:1,vmarginratio=1:1,scale=0.75]{geometry} 
        \fi
        \setMargintrue
    \fi

    \hypersetup{pdfpagelayout=OneColumn}
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
\RequirePackage{ifthen}   % Used in LaTeX Class files for conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX


% *********************** Table of Contents & Appendices ***********************
% add Bibliography, List of figures and tables to contents
\RequirePackage{tocbibind}
% Add appendices
\RequirePackage[title,titletoc]{appendix}

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


% ******************************* Bibliography *********************************
\ifPHD@authoryear
\ifPHD@biblatex
\RequirePackage[backend=biber, style=authoryear, citestyle=alphabetic, sorting=nty, natbib=true]{biblatex}
\setBiBLaTeXtrue
\else
\RequirePackage[round, sort, numbers, authoryear]{natbib} %author year
\fi
\setBibtrue
\else
     \ifPHD@numbered
     \ifPHD@biblatex
     \RequirePackage[backend=biber, style=numeric-comp, citestyle=numeric, sorting=none, natbib=true]{biblatex}
     \setBiBLaTeXtrue
     \else
     \RequirePackage[numbers,sort&compress]{natbib} % numbered citation
     \fi
     \setBibtrue
     \else
         \ifPHD@custombib
         \setBibfalse
         \ifPHD@biblatex
             \setBiBLaTeXtrue
         \fi
         \else
             \ifPHD@biblatex
                 \RequirePackage[backend=biber, style=numeric-comp, citestyle=numeric, sorting=none, natbib=true]{biblatex}
                 \setBiBLaTeXtrue
             \else
                 \RequirePackage[numbers,sort&compress]{natbib} % Default - numbered
             \fi
         \setBibtrue
	 \ClassWarning{PhDThesisPSnPDF}{No bibliography style was specified.
Default numbered style is used. If you would like to use a different style, use
`authoryear' or `numbered' in the options in documentclass or use `custombib`
and define the natbib package or biblatex package with required style in the Preamble.tex file}
         \fi
     \fi
\fi


% *********************** To copy ligatures and Fonts **************************
\RequirePackage{textcomp}

% Font Selection
\ifPHD@times
\RequirePackage{mathptmx}  % times roman, including math (where possible)
\setFonttrue
\else
     \ifPHD@fourier
     \RequirePackage{fourier} % Fourier
     \setFonttrue
     \else
          \ifPHD@customfont
          \setFontfalse
          \else
	  \ClassWarning{PhDThesisPSnPDf}{Using default font Latin Modern. If you
would like to use other pre-defined fonts use `times' (The Cambridge University
PhD thesis guidelines recommend using Times font)  or `fourier' or load a custom
font in the preamble.tex file by specifying `customfont' in the class options}
          \RequirePackage{lmodern}
          \setFonttrue
          \fi
    \fi
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
\fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | \hspace{0.25em} \bfseries{\thepage}}
\fancyhead[LE]{ {\bfseries\thepage} \hspace{0.25em} | \hspace{0.25em} \nouppercase \leftmark}


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
\ifsetMargin
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

% The year and term the degree will be officially conferred
\newcommand{\@degreedate}{}
\newcommand{\degreedate}[1]{\renewcommand{\@degreedate}{#1}}

% The full (unabbreviated) name of the degree
\newcommand{\@degree}{}
\newcommand{\degree}[1]{\renewcommand{\@degree}{#1}}

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

% ******************************** Title Page **********************************
\renewcommand{\maketitle}{

% To compute the free vertical space in Title page
\computeTitlePageSpacing

\begin{singlespace}
\begin{center}
% Title
{\Huge \bfseries{\@title} \par}
\vspace{.25\PHD@titlepagespacing}

% Crest
{\@crest \par}
\vspace{.2\PHD@titlepagespacing}

% Author
{\Large \bfseries{\@author} \par}
\vspace*{1ex}

% Department and University
{\large \@dept \par}
\vspace*{1ex}
{\large \@university \par}
\vspace{.2\PHD@titlepagespacing}

% Submission Text
{\large \submissiontext \par}
\vspace*{1ex}
{\large \textit {\@degree} \par} 


\end{center}
\vfill
\large
\begin{minipage}{0.49\textwidth}
\flushleft\hspace*{\oddsidemargin}\@college
\end{minipage}
\begin{minipage}{0.49\textwidth}
\flushright \@degreedate
\end{minipage}
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
\RequirePackage{nomencl}
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
\addcontentsline{toc}{chapter}{\nomname}
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


% ******************************** Line Spacing ********************************
% Set spacing as 1.5 line spacing for the PhD Thesis
\onehalfspace


% ******************** To compute empty space in title page ********************
% Boxes below are used to space differt contents on the title page
\newcommand{\computeTitlePageSpacing}{


% Title Box
\newsavebox{\PHD@Title}
\begin{lrbox}{\PHD@Title}
\begin{minipage}[c]{0.98\textwidth}
\centering \Huge \bfseries{\@title}
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
\vspace*{1ex}
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
\large \textit {\@degree} \par
\end{center}
\end{minipage}
\end{lrbox}

% College and Date Box
\newsavebox{\PHD@collegedate}
\begin{lrbox}{\PHD@collegedate}
\begin{minipage}[c]{\textwidth}
\large
\begin{minipage}{0.45\textwidth}
\flushleft\@college
\end{minipage}
\begin{minipage}{0.45\textwidth}
\flushright \@degreedate
\end{minipage}
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
