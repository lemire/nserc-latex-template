%% --------------------------------------
%% NSERC Appendix class
%% (C) 2011-2014 Sylvain Hallé
%% (C) 2016 Daniel Lemire
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%% http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%%
%% Usage notes
%% -----------
%% For instructions on how to use this class, see the file example.tex
%% provided with this package. Most of its content is self-explanatory.
%% --------------------------------------

%% ------------------------
%% Declarations
%% ------------------------
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{nserc-appendix}
              [2015/03/03 v1.32 Classe annexe CRSNG par Sylvain Hallé]

%% ------------------------
%% Definition of the language parameters
%% ------------------------
\def\@langdemande{english}
\def\@inlinerefs{false}

\DeclareOption{french}{\def\@langdemande{french}}
\DeclareOption{english}{\def\@langdemande{english}}
\DeclareOption{inlinerefs}{\def\@inlinerefs{true}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions
\ifx\pdfoutput\undefined
  \LoadClass[12pt,singlespace,letterpaper,onecolumn,dvips]{article} %All text must be in 12 pt
\else
  \LoadClass[12pt,singlespace,letterpaper,onecolumn,pdftex]{article} %All text must be in 12 pt
\fi
\RequirePackage[utf8]{inputenc}
\RequirePackage{lastpage}
\RequirePackage[T1]{fontenc}     %% Type-1 font encoding
\RequirePackage{microtype}       %% Better handling of typo
\RequirePackage{fourier}
\RequirePackage{berasans}
\RequirePackage{fancyhdr}
\RequirePackage{geometry}        %% Change page margins
\RequirePackage{ifthen}          %% Required to evaluate conditions
\RequirePackage[normalem]{ulem}  %% For non-ugly underlining

%% Prevents heading and single lines to be split across pages
\widowpenalty=1000
\clubpenalty=1000
\setlength{\topskip}{0.0in}
\setlength{\abovecaptionskip}{0cm}
\setlength{\belowcaptionskip}{0cm}
\setlength{\intextsep}{0.4cm}

%%% For grants, you want densely packed 
\usepackage[small,compact]{titlesec}
\titleformat{\section}[block]{\vspace{-0.0em}\bfseries}{\thesection.}{ 0em }{  }[ %
\nopagebreak\nopagebreak\vspace{0.0em}\nopagebreak ]
%%%

%% Get parameters passed at package instantiation
\newcommand{\nsercname}[1]{\def\@nname{#1}}
\newcommand{\nsercpin}[1]{\def\@npin{#1}}

%% Get commands to space section titles
\def\@sectspacing{10pt}
\newcommand{\setsectionspacing}[1]{\def\@sectspacing{#1}}

\ifthenelse{\equal{\@langdemande}{french}}{%
  \setlength{\parskip}{8pt}
  \setlength{\parindent}{0pt}
  \RequirePackage[french]{babel}
}{%
  \setlength{\parskip}{0pt}
  \RequirePackage[english]{babel}
}

\usepackage{times}%All text must be in 12 pt Times New Roman font;

\usepackage{xspace}
\usepackage{amsmath}
\usepackage{wrapfig}

%% Set page dimensions
\geometry{hmargin=.75in,vmargin=.75in}

%% Set interligne
\usepackage{setspace}
\singlespacing
%\setstretch{0.7}


\fancyhf{} % sets both header and footer to nothing
\renewcommand{\headrulewidth}{0pt}
\lhead{\footnotesize Page \thepage} 
\rhead{\footnotesize \@nname~$\bullet$~\@npin}
\pagestyle{fancyplain}

\usepackage[sort,square,numbers]{natbib}
\bibsep=\skip0


%% Hack to have list items displayed in a more compact way
\usepackage{paralist}
\setlength{\pltopsep}{4pt}
\setlength{\plitemsep}{4pt}

\usepackage{hyperref}
\hypersetup{%
  pdfauthor = {\nsercname{}},
  pdfsubject = {NSERC}
}
\usepackage{microtype}
\usepackage{url}
\usepackage[x11names]{xcolor}
\usepackage[]{todonotes}
\usepackage{comment}

%% Documents are not dated
\date{}


