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
\ProvidesClass{PhDThesisPSnPDF}[2013/11/14 version 1.0 by Krishna Kumar]
\typeout{https://github.com/kks32/phd-thesis-template/}


% ***************************************************************
% ********************** Class Definition ***********************

\newif\ifCU@bookmode
\CU@bookmodetrue
\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}

% ****************** Define a print/online mode ******************
\newif\if@printmode\@printmodefalse
\DeclareOption{printmode}{\@printmodetrue}

% ************************** Define index ************************
\newif\ifCU@index\CU@indexfalse
\DeclareOption{index}{\CU@indextrue}

\ProcessOptions\relax%

\ifCU@bookmode
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
   \LoadClass[dvips,fleqn,openright]{book}%
\else%
   \LoadClass[pdftex,fleqn,openright]{book}%
\fi%
\else
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}%
\ProcessOptions\relax%
\ifx\pdfoutput\undefined%
  \LoadClass[dvips, a4paper]{report}%
\else%
   \LoadClass[pdftex, a4paper]{report}%
\fi%
\fi



% ************** Set pdfpage and dvips paper sizes ***************
% if \pdfoutput is undefined or equal to relax, output a dvips special
\@ifundefined{pdfoutput}{
  \AtBeginDvi{\special{papersize=\paperwidth,\paperheight}}
}
% pdfoutput is defined and not equal to \relax
% check for pdfpageheight existence just in case someone sets pdfoutput
% under non-pdflatex. If exists, set them regardless of value of \pdfoutput.
\@ifundefined{pdfpageheight}{\relax}{\global\pdfpagewidth\paperwidth
\global\pdfpageheight\paperheight}%
% if using \pdfoutput=0 under pdflatex, send dvips papersize special
\ifcase\pdfoutput
\AtBeginDvi{\special{papersize=\paperwidth,\paperheight}}%
\else
\fi



% Defines a print mode / online mode to define page-layout and hyperrefering 

\if@printmode
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

	\if@twoside 
        % Odd and Even side Margin staggering for binding and set viewmode for PDF
              \RequirePackage[hmarginratio=3:2]{geometry}
	      \hypersetup{pdfpagelayout=TwoPageRight}
	\else 
         % Single side print margin for binding and set view mode for PDF
              \RequirePackage[hmarginratio=3:2]{geometry}
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
        % No Margin staggering on Odd and Even side 
	\RequirePackage[hmarginratio=1:1]{geometry} 
    \hypersetup{pdfpagelayout=OneColumn}
\fi



% ******************************************************************************
% ******************************** Packages ************************************
% ******************************************************************************

% ******************** Layout, Formatting and Headers **************************

\def\pdfshellescape{1}
\RequirePackage{lscape}   % Supports Landscape Layout
\RequirePackage{setspace} % Define line spacing in para
\RequirePackage{fancyhdr} % Define custom header
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
\def\url@leostyle{%
 \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
\urlstyle{leo}


% *************************** To copy ligatures and Fonts ***********************
\RequirePackage{textcomp}
\RequirePackage[ansinew]{inputenc}
\RequirePackage[T1]{fontenc}
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



% ******************************* Header Formatting *****************************
% Custom Header with Chapter Number, Page Number and Section Numbering
\pagestyle{fancy}
% Style 1:
%\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1 }{}}
%\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
%\fancyhead[LO]{\bfseries\rightmark}
%\fancyhead[LE,RO]{\bfseries\thepage}
%\fancyhead[RE]{\bfseries\leftmark}
%\fancyfoot{}

% Style 2:
\renewcommand{\chaptermark}[1]{\markboth{Chapter \thechapter. #1}{}}
\renewcommand{\sectionmark}[1]{\markright{#1}}
\fancyhead[LO]{\rightmark}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\leftmark}
\fancyfoot{}


\setlength{\headheight}{14pt}
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

\begin{singlespace}
\begin{center}
% Title
{\Huge \bfseries{\@title} \par}
\vspace*{0.125\textheight}

% Crest
{\@crest \par}
\vspace*{0.1\textheight}

% Author
{\Large \bfseries{\@author} \par}
\vspace*{1ex}

% Department and University
{\large \@dept \par}
\vspace*{1ex}
{\large \@university \par}
\vspace*{0.1\textheight}

% Submission Text
{\large \submissiontext \par}
\vspace*{1ex}
{\large \it {\@degree} \par} 
%\vspace*{0.15\textheight}

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
\vspace*{0.02\textheight}
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
% "Declaration" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{declaration}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Declaration}
\thispagestyle{empty}
}



% ******************************* Acknowlegments *********************************
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}{
\cleardoublepage
\setsinglecolumn
\chapter*{\centering \Large Acknowlegements}
\thispagestyle{empty}
}


% ******************************** Abstract ***********************************
% The abstract environment puts a large, bold, centered "Abstract" label at
% the top of the page. The abstract itself appears in a quote environment,
% i.e. tabbed in at both sides, and on its own page.

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
\renewcommand\nomgroup[1]{%
  \ifthenelse{\equal{#1}{A}}{%
   \item[\textbf{Roman Symbols}] }{%             A - Roman
    \ifthenelse{\equal{#1}{G}}{%
     \item[\textbf{Greek Symbols}]}{%             G - Greek
      \ifthenelse{\equal{#1}{R}}{%
        \item[\textbf{Superscripts}]}{%              R - Superscripts
          \ifthenelse{\equal{#1}{S}}{%
           \item[\textbf{Subscripts}]}{{%             S - Subscripts
	    \ifthenelse{\equal{#1}{X}}{%
	     \item[\textbf{Other Symbols}]}{{%    X - Other Symbols
	    \ifthenelse{\equal{#1}{Z}}{%
	     \item[\textbf{Acronyms}]}%              Z - Acronyms
              			{{}}}}}}}}}}


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



% This Title page works but is too complicated!
% Boxes below are used to space differt contents on the title page
%\newcommand{\makephdtitle}{
%
%\pagestyle{empty}
%%%% Title Box
%\newsavebox{\CU@Title}
%\begin{lrbox}{\CU@Title}
%\begin{minipage}[c]{0.98\textwidth}
%\centering
%\Huge \bfseries{\@title}
%\end{minipage}
%\end{lrbox}
%%
%%% University Crest Box
%\newsavebox{\CU@crest}
%\begin{lrbox}{\CU@crest}
%\@crest
%\end{lrbox}
%
%%% Author Box
%\newsavebox{\CU@author}
%\begin{lrbox}{\CU@author}
%\begin{minipage}[c]{\textwidth}
%\centering
%\Large \bfseries{\@author}
%\end{minipage}
%\end{lrbox}
%
%%% Department Box
%\newsavebox{\CU@dept}
%\begin{lrbox}{\CU@dept}
%\begin{minipage}[c]{\textwidth}
%\centering
%{\large \@dept \par}
%\vspace*{1ex}
%{\large \@university \par}
%\end{minipage}
%\end{lrbox}
%
%%% Submission Box
%\newsavebox{\CU@submission}
%\begin{lrbox}{\CU@submission}
%\begin{minipage}[c]{\textwidth}
%\begin{center}
%\large \submissiontext \par
%\vspace*{1ex}
%\large \it {\@degree} \par
%\end{center}
%\end{minipage}
%\end{lrbox}
%
%%% College and Date Box
%\newsavebox{\CU@collegedate}
%\begin{lrbox}{\CU@collegedate}
%\begin{minipage}[c]{\textwidth}
%\large
%\begin{minipage}{0.45\textwidth}
%\flushleft\@college
%\end{minipage}
%\begin{minipage}{0.45\textwidth}
%\flushright \@degreedate
%\end{minipage}
%\end{minipage}
%\end{lrbox}
%
%%%  Now to compute the free vertical space
%\newlength{\CU@titlepagespacing}
%\setlength{\CU@titlepagespacing}{ \textheight %
%			- \totalheightof{\usebox{\CU@Title}}
%			- \totalheightof{\usebox{\CU@crest}}
%			- \totalheightof{\usebox{\CU@author}}
%			- \totalheightof{\usebox{\CU@dept}}
%			- \totalheightof{\usebox{\CU@submission}}
%			- \totalheightof{\usebox{\CU@collegedate}}
%}
%
%\begin{center}
%~\vspace{.02\CU@titlepagespacing}
%{\usebox{\CU@Title}}\par
%\vspace{.25\CU@titlepagespacing}
%{\usebox{\CU@crest}}\par
%\vspace{.2\CU@titlepagespacing}
%{\usebox{\CU@author}}\par
%\vspace{.05\CU@titlepagespacing}
%{\usebox{\CU@dept}}\par
%\vspace{.2\CU@titlepagespacing}
%{\usebox{\CU@submission}}\par
%\null \vfill
%%{\usebox{\cam@collegedate}}
%
%\end{center}
%}
