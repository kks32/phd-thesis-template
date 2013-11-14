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

%--------------------- packages -------------------------------

% Layout, Formatting and Headers

\def\pdfshellescape{1}
\usepackage{a4wide} % A4 Wide paper
\usepackage{lscape} % Supports Landscape Layout
\if@twoside \usepackage[hmarginratio=3:2]{geometry} %Two sided margin 
\else \usepackage[hmarginratio=1:1]{geometry} % Single side margin
\fi
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


% Captions and Hyperreferncing / URL
\usepackage[figurename=Fig.,labelsep=space,tableposition=top]{caption} % Caption styling
\newcommand{\PrintVersion}{}
\ifx\PrintVersion\undefined
% For PDF Online version
\usepackage[pdftex, plainpages=false, pdfpagelabels, pdfpagelayout=useoutlines, bookmarks, bookmarksopen=true, bookmarksnumbered=true, breaklinks=true, linktocpage, pagebackref=false, colorlinks=true, linkcolor=blue, urlcolor=blue, citecolor=blue, anchorcolor=green, hyperindex=false, hyperfigures]{hyperref}
\else
% For Print version
\usepackage[pdftex, plainpages=false, pdfpagelabels, pdfpagelayout=useoutlines, bookmarks, bookmarksopen=true, bookmarksnumbered=true, breaklinks=true, linktocpage, pagebackref=false, colorlinks=true, linkcolor=black, urlcolor=black, citecolor=black, anchorcolor=black, hyperindex=false, hyperfigures]{hyperref}
\fi
\usepackage{url}


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


% Bibliography and References
\usepackage{cleveref}
\usepackage[square, sort, numbers, authoryear]{natbib}


% Math and SI Units
\usepackage{amsfonts}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{siunitx}


%***************** To copy ligatures and Fonts ********************* %
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
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1 }{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}
\fancyhead[LO]{\bfseries\rightmark}
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[RE]{\bfseries\leftmark}
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
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your college or department(eg. Trinity, Pembroke, Maths, Physics)
\def\collegeordept#1{\gdef\@collegeordept{#1}}
% The name of your University
\def\university#1{\gdef\@university{#1}}
% Defining the crest
\def\crest#1{\gdef\@crest{#1}}


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
\begin{center}
\begin{singlespace}
    { \Huge {\bfseries {\@title}} \par}
{\large \vspace*{25mm} {{\@crest} \par} \vspace*{20mm}}
    {{\Large \@author} \par}
{\large \vspace*{1ex}
    {{\@collegeordept} \par}
\vspace*{1ex}
    {{\@university} \par}
\vspace*{25mm}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate}}
\end{singlespace}
\end{center}
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

