%
% Based on Krishna Kumar's template, CUEDthesis v1.1
% and Alex Ridge
% 
%-------------------------- identification ---------------------
%\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PhDThesisPSnPDF}[2013/11/14 version 1.0]
%-------------------------- initial code -----------------------
\newif\ifCU@bookmode
\CU@bookmodetrue

\DeclareOption{report}{\CU@bookmodefalse}
\DeclareOption{book}{\CU@bookmodetrue}
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

% Defines a print mode / online mode to define page-layout and hyperrefering 
\newif\if@printmode\@printmodefalse
\DeclareOption{printmode}{\@printmodetrue}
\ProcessOptions\relax
\if@printmode
	\usepackage{hyperref}
	% For Print version
	\hypersetup{plainpages=false, pdfstartview=FitV, unicode=true, pdftoolbar=true, pdfmenubar=true, pdfpagelayout=useoutlines, bookmarksopen=true, bookmarksnumbered=true, breaklinks=true, linktocpage, colorlinks=true, linkcolor=black, urlcolor=black, citecolor=black, anchorcolor=black}
	\if@twoside \usepackage[hmarginratio=3:2]{geometry} % Odd and Even side Margin staggering for binding
	\else \usepackage[hmarginratio=3:2]{geometry} % Single side print margin for binding
	\fi
\else
	\usepackage{hyperref}
	% For PDF Online version
	\hypersetup{plainpages=false, pdfstartview=FitV, unicode=true, pdftoolbar=true, pdfmenubar=true, pdfpagelayout=useoutlines, bookmarksopen=true, bookmarksnumbered=true, breaklinks=true, linktocpage, colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue, anchorcolor=green}
	\usepackage[hmarginratio=1:1]{geometry} % No Margin staggering on Odd and Even side 
\fi
%--------------------- packages -------------------------------

% Layout, Formatting and Headers

\def\pdfshellescape{1}
\usepackage{lscape} % Supports Landscape Layout
\usepackage{setspace} % Define line spacing in para
\usepackage{fancyhdr} % Define custom header
\usepackage[perpage]{footmisc} %Range of footnote options 


% Algorithms and Pseudocode
\usepackage{algpseudocode} % Algorithmicx package support for algorithms and pseudocode


% Conditional Statements
\usepackage{ifthen}   % Used in LaTeX Class files for conditional statements
\usepackage{ifpdf}    % Check for pdfLaTeX


% Table of Contents and Appendix
\usepackage{tocbibind} % add Bibliography, List of figures and tables to contents
\usepackage{appendix} % add appendix


% Graphics and Figures
\usepackage[usenames, dvipsnames]{color} 
\usepackage{epstopdf} % Convert eps figures to pdf
\ifpdf % Graphicx package for figures
    \usepackage[pdftex]{graphicx}
    \DeclareGraphicsExtensions{.png, .jpg, .pdf}
    \pdfcompresslevel=9
\else
    %\usepackage{epsfig}
    \usepackage{graphicx}
    \DeclareGraphicsExtensions{.eps, .ps}
\fi
\usepackage{rotating}
\usepackage{subfigure}
\usepackage{wrapfig}
\usepackage{float}


% Table
\usepackage{longtable}
\usepackage{multicol}
\usepackage{multirow}
\usepackage{tabularx}


% Captions and Hyperreferncing / URL
\usepackage[figurename=Fig.,labelsep=space,tableposition=top]{caption} % Caption styling
\usepackage{url}
\def\url@leostyle{%
  \@ifundefined{selectfont}{\def\UrlFont{\sf}}{\def\UrlFont{\small\ttfamily}}}
\urlstyle{leo}

% Bibliography and References
\usepackage{cleveref}
\usepackage[square, sort, numbers, authoryear]{natbib}


% Math and SI Units
\usepackage{amsfonts}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{siunitx}

%To copy ligatures and Fonts 
\usepackage{textcomp}
\usepackage[ansinew]{inputenc}
\usepackage[T1]{fontenc}
\usepackage{libertine}
\input{glyphtounicode}
\pdfglyphtounicode{f_f}{FB00}
\pdfglyphtounicode{f_f_i}{FB03}
\pdfglyphtounicode{f_f_l}{FB04}
\pdfglyphtounicode{f_i}{FB01}
\pdfgentounicode=1



%******************************************************* %

% Setting PDF Meta-Data
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

% Clear Header Style on the Last Empty Odd pages
\renewcommand{\cleardoublepage}{\clearpage\if@twoside \ifodd\c@page\else%
	\hbox{}%
	\thispagestyle{empty}  % Empty header styles
	\newpage%
	\if@twocolumn\hbox{}\newpage\fi\fi\fi}



% Nomenclature
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


\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
\fancypagestyle{plain}{
  \fancyhead{}
  \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\submittedtext}{{A thesis submitted for the degree of}}


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

%define title page layout
\renewcommand{\maketitle}{%
%Can use the line below to remove the blank page after the title page
%\setcounter{page}{0}  % Sasa Tomic
\begin{singlespace}
\begin{center}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{25mm} {{\@crest} \par} \vspace*{20mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@dept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par} 
\vspace*{2ex}
	{\@degreedate}}
\end{center}
%\large
%\begin{minipage}{0.5\textwidth}
%\flushleft \@college
%\end{minipage}
%\begin{minipage}{0.5\textwidth}
%\flushleft \@degreedate
%\end{minipage}
\end{singlespace}

}


% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\cleardoublepage
  \begin{alwayssingle}
  \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\LARGE }
  \end{center}
  \vspace{0.5cm}
  \begin{quote} \begin{center}}
{\end{center} \end{quote} \end{alwayssingle}}


% DECLARATION
%
% The declaration environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{declaration}
{\cleardoublepage
\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Declaration}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}



% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}
{\cleardoublepage
\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}
\begin{quote}}
{\end{quote}\end{alwayssingle}}

% The acknowledgementslong environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgement itself 
% does not appears in a quote environment so you can get more in.

\newenvironment{acknowledgementslong}
{\cleardoublepage
\pagestyle{empty}
\begin{alwayssingle}
\begin{center}
\vspace*{1.5cm}
{\Large \bfseries Acknowledgements}
\end{center}
\vspace{0.5cm}\begin{quote}}
{\end{quote}\end{alwayssingle}}



%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\newenvironment{abstracts} {\cleardoublepage \begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm}
   \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractlong environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself does not appears in a quote
%environment so you can get more in.

\newenvironment{abstractslong} {\cleardoublepage \begin{alwayssingle} \pagestyle{empty}
  \begin{center}
  \vspace*{1.5cm}
  {\Large \bfseries  Abstract}
  \end{center}
  \vspace{0.5cm} \begin{quote}}
{\end{quote}\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\begin{alwayssingle} \pagestyle{empty}
  \vspace*{-1in}
 \begin{center}
    { \Large {\bfseries {\@title}} \par}
    {{\large \vspace*{1ex} \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
    {{\@university} \par}
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}}
{\end{alwayssingle}}



%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).

\newenvironment{romanpages}
{\setcounter{page}{1}
  \renewcommand{\thepage}{\roman{page}}}
{\newpage\renewcommand{\thepage}{\arabic{page}}}
%{\newpage\renewcommand{\thepage}{\arabic{page}}\setcounter{page}{1}}
