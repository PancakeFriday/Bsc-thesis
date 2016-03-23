\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bsc}[2015/07/22 Style for my bachelor thesis]

\newif\if@print
\DeclareOption{print}{\@printtrue}
\DeclareOption{digital}{\@printfalse}

\ProcessOptions\relax


% General
\LoadClassWithOptions{scrreprt}

% Language
\usepackage[ngerman,english]{babel} % all languages being used, with main language last in list

% Todo lists
\usepackage{todonotes}

% Geometry
\usepackage[onehalfspacing]{setspace}
\usepackage[a4paper,width=150mm,top=30mm,bottom=30mm]{geometry}

% Links
\usepackage{color,xcolor}
\usepackage{hyperref}
\hypersetup{colorlinks=false}
\hypersetup{linkbordercolor = {white}}
\AtBeginDocument{
	\hypersetup{ % set pdf metadata
	    pdfauthor={\@author},
		pdftitle={\@title}
	}
}

% Fonts
\usepackage{fontspec,xunicode}
\usepackage{libertine}
%\setmainfont{palatino}
%\setsansfont{Optima}
%\setmonofont[Scale=MatchLowercase]{Menlo}

\if@print
\else
\usepackage{xcolor}
\definecolor{easygrey}{rgb}{.137,.137,.137}
\makeatletter
\newcommand{\globalcolor}[1]{%
	\color{#1}\global\let\default@color\current@color
}
\makeatother

\AtBeginDocument{\globalcolor{easygrey}}
\fi

% Units
\usepackage[separate-uncertainty, binary-units = true]{siunitx}
\DeclareSIUnit\px{px}

% BraKets
\usepackage{braket}

% Tables
\usepackage{array} % for math mode in tables
\usepackage{booktabs} % for hline rules

% Quotations
\usepackage{epigraph}
\setlength{\epigraphwidth}{.8\textwidth}
\setlength{\epigraphrule}{0pt}

% Page Layout
\usepackage{fancyhdr}
\pagestyle{fancy}
\fancyhf{}
\if@print
	\fancyhead[LE]{
	    \textit{\nouppercase{\leftmark}}
	}
	\fancyhead[RO]{
		\textit{\nouppercase{\rightmark}}
	}
	\fancyfoot[RO,LE]{
		\thepage
	}
\else
	\fancyhead[L]{
	    \textit{\nouppercase{\leftmark}}
	}
	\fancyfoot[C]{
		\thepage
	}
\fi
\renewcommand{\headrulewidth}{0.2pt}
\renewcommand{\footrulewidth}{0pt}
\fancypagestyle{plain}{%
	\fancyhf{}
	\if@print
		\fancyfoot[RO,LE]{
			\thepage
		}
	\else
		\fancyfoot[C]{
			\thepage
		}
	\fi
	\renewcommand{\headrulewidth}{0pt}
	\renewcommand{\footrulewidth}{0pt}
}


% Bibliography
\usepackage{cite}
%\nocite{*} % print all references, even those not used

% Appendix
\usepackage[toc,page]{appendix}


\endinput
