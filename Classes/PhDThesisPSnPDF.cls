%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                              %%
%% Class ``PhD Thesis PSnPDF''                                                  %%
%%                                                                              %%
%% Version: v1.0                                                                %%
%% Authors: Krishna Kumar                                                       %%
%% Date: 2013/11/16                                                             %%
%% Based on: King's LaTeX workshop by Krishna, CUED V1.1 Template by H. Banderi %%
%%           Compuer Lab PhD Template & Alex Rige's idea of an unified template %%
%% License: GPL V2.0 https://www.gnu.org/licenses/gpl-2.0.html                  %%
%% GitHub Repo: https://github.com/kks32/phd-thesis-template/                   %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ******************** Class Identification *********************
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesisPSnPDF}[2013/11/24 version 1.0Beta by Krishna Kumar]
\typeout{https://github.com/kks32/phd-thesis-template/}


% ***************************************************************
% ********************** Class Definition ***********************
% ***************************************************************

% ****************** Define a Print/Online Version **************
\newif\if@print\@printfalse
\DeclareOption{print}{\@printtrue}

% ************************** Define index ***********************
\newif\ifCU@index\CU@indexfalse
\DeclareOption{index}{\CU@indextrue}

% ************************** Font Option ************************
\newif\ifsetFont\setFontfalse % Font is not set 

\newif\ifCU@times\CU@timesfalse % Times with Math Support
\DeclareOption{times}{\CU@timestrue}

\newif\ifCU@palatino\CU@palatinofalse % Palatino with Math Support
\DeclareOption{palatino}{\CU@palatinotrue}

\newif\ifCU@customfont\CU@customfontfalse % Custom Font with Math Support
\DeclareOption{customfont}{\CU@customfonttrue}

% ************************** Bibliography ***********************
\newif\ifsetBib\setBibfalse % Using Custom Bibliography

\newif\ifCU@authoryear\CU@authoryearfalse % Author-Year citation
\DeclareOption{authoryear}{\CU@authoryeartrue}

\newif\ifCU@numbered\CU@numberedfalse % Numbered citiation
\DeclareOption{numbered}{\CU@numberedtrue}

\newif\ifCU@custombib\CU@custombibfalse % Custom Bibliography
\DeclareOption{custombib}{\CU@custombibtrue}

% ****************** Header / Footer Styling ********************
\newif\ifCU@pageStyleI\CU@pageStyleIfalse % Set Page StyleI
\DeclareOption{PageStyleI}{\CU@pageStyleItrue}

\newif\ifCU@pageStyleII\CU@pageStyleIIfalse % Set Page StyleI
\DeclareOption{PageStyleII}{\CU@pageStyleIItrue}

% ********************** Custom Margins  ************************
\newif\ifsetMargin\setMarginfalse % Margins are not set

\newif\ifCU@custommargin\CU@custommarginfalse % Custom margin
\DeclareOption{custommargin}{\CU@custommargintrue}

\ProcessOptions\relax%

% ********************* Pre-defined Options **********************

% Font Size
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}%

% Page Size
\DeclareOption{a4paper}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{a5paper}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{letter}{\PassOptionsToClass{\CurrentOption}{book}}%

% Column layout
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}%
\DeclareOption{twoside}{\PassOptionsToClass{\CurrentOption}{book}}%

% Draft Mode
\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}%

% Generates Warning for unknown options
\DeclareOption*{
  \ClassWarning{PhDThesisPSnPDF}{Unknown or non-standard option '\CurrentOption'. Will see if I can load it from the book class. If you get a warning unused global option(s): `\CurrentOption` then the option is not supported!}
  \PassOptionsToClass{\CurrentOption}{book}
}


\ProcessOptions\relax%

\ifx\pdfoutput\undefined%
      \LoadClass[dvips,fleqn,openright]{book}%
      \@ifundefined{pdfoutput}{
        \AtBeginDvi{\special{papersize=\paperwidth,\paperheight}}
      }

\else%
      \LoadClass[pdftex,fleqn,openright]{book}%
      \AtBeginDvi{\special{papersize=\paperwidth,\paperheight}}%
\fi%


% **************************** Print / Online ***************************
% Defines a print / online version to define page-layout and hyperrefering 

\if@print
	\RequirePackage{hyperref}
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
        \ifCU@custommargin
        \setMarginfalse
        \else
        % Odd and Even side Margin staggering for binding and set viewmode for PDF
        \RequirePackage[hmarginratio=3:2]{geometry}
        \setMargintrue
        \fi
	
        \if@twoside 
		\hypersetup{pdfpagelayout=TwoPageRight}
		\else 
    	\hypersetup{pdfpagelayout=OneColumn}
        \fi
\else
	\RequirePackage{hyperref}
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
          anchorcolor=green}

        \ifCU@custommargin
        \setMarginfalse
        \else
		% No Margin staggering on Odd and Even side 
		\RequirePackage[hmarginratio=1:1]{geometry} 
        \setMargintrue
        \fi

    	\hypersetup{pdfpagelayout=OneColumn}
\fi



% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************

% ******************************* Custom Margin ********************************
% Add `custommargin' in the document class option to use this section
% Set {innerside margin / outerside margin / topmargin / bottom margin}  and many custom size for page layout
\ifsetMargin
\else
\RequirePackage[left=35mm,right=30mm,top=35mm,bottom=25mm]{geometry}  
\fi

% *********************** Layout and Formatting ********************************

\def\pdfshellescape{1}
\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in para
\RequirePackage{calc}     % To calculate vertical spacing

% *************************** Conditional Statements **************************
\RequirePackage{ifthen}   % Used in LaTeX Class files for conditional statements
\RequirePackage{ifpdf}    % Check for pdfLaTeX


% *********************** Table of Contents and Appendix************************
% add Bibliography, List of figures and tables to contents
\RequirePackage{tocbibind}
\RequirePackage{appendix}  % add appendix


% **************************** Graphics and Figures ****************************
\RequirePackage[usenames, dvipsnames]{color} 
% Convert eps figures to pdf
\RequirePackage{epstopdf} 
\ifpdf 
    \RequirePackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
    \pdfcompresslevel=9
\else
    \RequirePackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
\fi


% **************************** URL Package and Definition ***********************
\RequirePackage{url}
% Redefining urlstyle to use smaller fontsize in References with URLs
\newcommand{\url@leostyle}{%
 \@ifundefined{selectfont}{\renewcommand{\UrlFont}{\sf}}{\renewcommand{\UrlFont}{\small\ttfamily}}}
\urlstyle{leo}

% ********************************** Bibliography *******************************
\ifCU@authoryear
\RequirePackage[round, sort, numbers, authoryear]{natbib} %author year
\setBibtrue
\else
     \ifCU@numbered
     \RequirePackage[numbers,sort&compress]{natbib} % numbered citation
     \setBibtrue
     \else
         \ifCU@custombib
         \setBibfalse
         \else
         \RequirePackage[numbers,sort&compress]{natbib} % Default - numbered
         \setBibtrue
         \ClassWarning{PhDThesisPSnPDF}{No bibliography style was specified. Default numbered style is used. If you would like to use a different style, use `authoryear' or `numbered' in the options in documentclass or use `custombib` and define the natbibpackage with required style in the Preamble.tex file}
         % Generate a warning message here
         \fi
     \fi
\fi



% *************************** To copy ligatures and Fonts ***********************
\RequirePackage{textcomp}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

% Font Selection
\ifCU@times
\RequirePackage{mathptmx}  % times roman, including math (where possible)
\setFonttrue
\else
     \ifCU@palatino
     \RequirePackage[sc]{mathpazo} % Palatino
     \linespread{1.05} % Requires a longer line space
     \setFonttrue
     \else
          \ifCU@customfont
          \setFontfalse
          \else
          \ClassWarning{PhDThesisPSnPDf}{Using default font Latin Modern. If you would like to use other pre-defined fonts use `times' or `palatino' or load a custom font in preamble by specifying `customfont' in the class options}
          \RequirePackage{lmodern}
          \setFonttrue
          \fi
    \fi
\fi

\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_i}{FB01}
\pdfglyphtounicode{f_l}{FB02}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfgentounicode=1

% ********************************************************************************
% **************************** Pre-defined Settings ******************************
% ********************************************************************************

% ***************************** Setting PDF Meta-Data ****************************
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


% ***************************** TOC and Hide Sections ***************************
\newcommand{\nocontentsline}[3]{}
\newcommand{\tochide}[2]{\bgroup\let\addcontentsline=\nocontentsline#1{#2}\egroup}
% Removes pagenumber appearing from TOC
\addtocontents{toc}{\protect\thispagestyle{empty}}


% ******************************* Header Formatting *****************************
% Custom Header with Chapter Number, Page Number and Section Numbering

\RequirePackage{fancyhdr} % Define custom header

\pagestyle{fancy}

\ifCU@pageStyleI
% Style 1: Sets Page Number at the Top and Chapter/Section Name on LE/RO
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1\ }}
\fancyhf{}
\fancyhead[RO]{\nouppercase \rightmark\hspace{0.25em} | \hspace{0.25em}  \bfseries{\thepage} }
\fancyhead[LE]{{\bfseries\thepage} \hspace{0.25em} | \hspace{0.25em}  \nouppercase \leftmark }


\else
\ifCU@pageStyleII
% Style 2: Sets Page Number at the Bottom with Chapter/Section Name on LO/RE
\renewcommand{\chaptermark}[1]{\markboth{#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[RO]{\bfseries\nouppercase \rightmark}
\fancyhead[LE]{\bfseries \nouppercase \leftmark}
\fancyfoot[C]{\thepage}


\else
% Default Style: Sets Page Number at the Top (LE/RO) with Chapter/Section Name on LO/RE
\renewcommand{\chaptermark}[1]{\markboth {#1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhf{}
\fancyhead[LO]{\nouppercase \rightmark}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\nouppercase \leftmark}
\fi

\fi



\setlength{\headheight}{14.5pt}
%\renewcommand{\headrulewidth}{0.5pt}
%\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


% **************** Clear Header Style on the Last Empty Odd pages ***************
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}


% ********************************* Roman Pages *********************************
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}{
  \setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}


% *******************************************************************************
% **************************** Macro Definitions ********************************
% *******************************************************************************
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
\newcommand{\submissiontext}{{A thesis submitted for the degree of}}


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


% ********************************************************************************
% ***************************** Front Matter Layout ******************************
% ********************************************************************************

% ********************************** Title Page *********************************
\renewcommand{\maketitle}{
%%Can use the line below to remove the blank page after the title page
%%\setcounter{page}{0}  % Sasa Tomic

% To compute the free vertical space in Title page
\computeTitlePageSpacing


\begin{singlespace}
\begin{center}
% Title
{\Huge \bfseries{\@title} \par}
\vspace{.25\CU@titlepagespacing}

% Crest
{\@crest \par}
\vspace{.2\CU@titlepagespacing}

% Author
{\Large \bfseries{\@author} \par}
\vspace*{1ex}

% Department and University
{\large \@dept \par}
\vspace*{1ex}
{\large \@university \par}
\vspace{.2\CU@titlepagespacing}

% Submission Text
{\large \submissiontext \par}
\vspace*{1ex}
{\large \it {\@degree} \par} 


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


% ********************************* Dedication **********************************
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.3

\newenvironment{dedication}
{
\cleardoublepage
\setsinglecolumn
\vspace*{0.2\textheight}
\thispagestyle{empty}
\centering
}


% ******************************** Declaration **********************************
% The declaration environment puts a large, bold, centered 
% "Declaration" label at the top of the page.

\newenvironment{declaration}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Declaration}
\thispagestyle{empty}
}



% ******************************* Acknowlegments *********************************
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page.

\newenvironment{acknowledgements}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Acknowlegements}
\thispagestyle{empty}
}


% ******************************** Abstract ***********************************
% The abstract environment puts a large, bold, centered "Abstract" label at
% the top of the page. 

\newenvironment{abstract} {
\cleardoublepage
\setsinglecolumn 
\chapter*{\centering \Large Abstract}
\thispagestyle{empty}
}


%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
%  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@dept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submissiontext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}



% ******************************** Nomenclature *********************************
\usepackage{nomencl}
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

% Add nomenclature to contents and print out nomenclature
\newcommand{\printnomencl}{
\printnomenclature 
\addcontentsline{toc}{chapter}{\nomname}
}


% ******************************* Create the index ******************************
\ifCU@index
    \RequirePackage{makeidx}
    \makeindex
    \newcommand{\printthesisindex}{
        \cleardoublepage
        \phantomsection
        \printindex}
\else
    \newcommand{\printthesisindex}{}
\fi



% ********************* To compute empty space in title page *********************
% Boxes below are used to space differt contents on the title page
\newcommand{\computeTitlePageSpacing}{


% Title Box
\newsavebox{\CU@Title}
\begin{lrbox}{\CU@Title}
\begin{minipage}[c]{0.98\textwidth}
\centering \Huge \bfseries{\@title}
\end{minipage}
\end{lrbox}

% University Crest Box
\newsavebox{\CU@crest}
\begin{lrbox}{\CU@crest}
\@crest
\end{lrbox}

% Author Box
\newsavebox{\CU@author}
\begin{lrbox}{\CU@author}
\begin{minipage}[c]{\textwidth}
\centering \Large \bfseries{\@author}
\end{minipage}
\end{lrbox}

% Department Box
\newsavebox{\CU@dept}
\begin{lrbox}{\CU@dept}
\begin{minipage}[c]{\textwidth}
\centering {\large \@dept \par}
\vspace*{1ex}
{\large \@university \par}
\end{minipage}
\end{lrbox}

% Submission Box
\newsavebox{\CU@submission}
\begin{lrbox}{\CU@submission}
\begin{minipage}[c]{\textwidth}
\begin{center}
\large \submissiontext \par
\vspace*{1ex}
\large \it {\@degree} \par
\end{center}
\end{minipage}
\end{lrbox}

% College and Date Box
\newsavebox{\CU@collegedate}
\begin{lrbox}{\CU@collegedate}
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
\newlength{\CU@titlepagespacing}
\setlength{\CU@titlepagespacing}{ \textheight %
			- \totalheightof{\usebox{\CU@Title}}
			- \totalheightof{\usebox{\CU@crest}}
			- \totalheightof{\usebox{\CU@author}}
			- \totalheightof{\usebox{\CU@dept}}
			- \totalheightof{\usebox{\CU@submission}}
			- \totalheightof{\usebox{\CU@collegedate}}
}
}
