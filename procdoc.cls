% procdoc.cls
% Proceedings template class
% 01.09.2022 Yann McLatchie yann.mclatchie (at) aalto.fi
% --- Class structure: identification part
% ---
\ProvidesClass{procdoc}[01.09.2022 version 1.00 proceedings template]
\NeedsTeXFormat{LaTeX2e}

% --- Class structure: declaration of options part
% ---
% This class extends the article class
% Read all the documentclass options; pass them to article,
% unless the file "<currentoption>.min" exists, then it is loaded
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions*

% --- Class structure: execution of options part
% ---
\ProcessOptions \relax

% --- Class structure: declaration of options part
% ---
\LoadClass[twocolumn]{article}

% Use custom fonts
\RequirePackage[utf8]{inputenc}
\RequirePackage{newtxtext} % times
\RequirePackage[scaled=.95]{cabin} % sans serif
\RequirePackage[varqu,varl]{inconsolata} % typewriter
\RequirePackage{amsmath,amsthm}
\RequirePackage[varg]{newtxmath}

% Finer resolution type
\RequirePackage{microtype}

% Section heads and title
\RequirePackage{titlesec}
\titleformat*{\section}{\Large\bfseries\sffamily}
\titleformat*{\subsection}{\large\bfseries\sffamily}
\titleformat*{\subsubsection}{\bfseries\sffamily}
\titleformat*{\paragraph}{\bfseries\sffamily}

% Redefine abstract
\renewenvironment{abstract}
    {\list{}{%
        \setlength{\leftmargin}{0.15\textwidth}%
        \setlength{\rightmargin}{\leftmargin}%
    }%
    \item[\hspace{7mm} \sffamily\bfseries \abstractname.]\relax}
{\endlist}

% Wide equation environment
\newenvironment{wideeqn}[1][!ht]% 
{% begin code
    \begin{figure*}[#1]%
    \par\noindent\rule{\dimexpr(0.5\textwidth-0.5\columnsep-0.4pt)}{0.4pt}%
    \rule{0.4pt}{6pt}%
    \begin{equation}%
}%
{% end code
    \end{equation}%
    \vspace{\belowdisplayskip}\hfill\rule[-6pt]{0.4pt}{6.4pt}%
    \rule{\dimexpr(0.5\textwidth-0.5\columnsep-1pt)}{0.4pt}%
    \end{figure*}%
}%

% Custom title layout
\makeatletter
\def\@maketitle{%
\newpage%
\null%
\begin{center}%
    \vspace*{-5em} %
    \let\footnote\thanks %
    {\sffamily\bfseries\LARGE \@title %
      \par 
    }
    {\large
     \lineskip .5em
     \begin{tabular}[t]{c}
        \baselineskip=12pt
        \@author
     \end{tabular}
    }
\end{center}
}
\makeatother

% Custom captions
\RequirePackage{caption}
\DeclareCaptionFormat{custom}
{%
    {\small\sffamily#1#2} {\small #3}
}
\DeclareCaptionLabelSeparator{custom}{.}
\captionsetup{format=custom, labelsep=custom}

% Page layout
\RequirePackage[
    a4paper,
    margin=15mm,
    includehead,
    includefoot
]{geometry}

% Margin distance
\makeatletter
\setlength{\columnsep}{10mm}
\makeatother

% Author block
\RequirePackage{authblk}
\renewcommand{\Authfont}{\normalsize \mdseries}
\renewcommand{\Affilfont}{\small \mdseries}
\setlength{\affilsep}{2pt}

% Headers and footers
\RequirePackage{fancyhdr}
\setlength{\headheight}{13.6pt}
% fancy head
\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields
\fancyhead[CO]{{\sffamily \mdseries \runauthor}}
\fancyhead[CE]{{\sffamily \mdseries \runtitle}}
\fancyfoot[CE,CO]{\sffamily \thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

% References
\RequirePackage[sort&compress,square,comma,numbers]{natbib}
% robust citation style
\setlength{\bibsep}{0.0pt}
\DeclareRobustCommand{\citeext}[1]{\citeauthor{#1}~\cite{#1}}
% remove space between bibliography entries
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
  \oldbibliography{#1}%
  \setlength{\itemsep}{0pt}%
}
%
\RequirePackage{etoolbox}
\bibliographystyle{apalike}
% 
% Patch natbib cittation hyperlinks
\makeatletter
% Patch case where name and year are separated by aysep
\patchcmd{\NAT@citex}
  {\@citea\NAT@hyper@{%
     \NAT@nmfmt{\NAT@nm}%
     \hyper@natlinkbreak{\NAT@aysep\NAT@spacechar}{\@citeb\@extra@b@citeb}%
     \NAT@date}}
  {\@citea\NAT@nmfmt{\NAT@nm}%
   \NAT@aysep\NAT@spacechar\NAT@hyper@{\NAT@date}}{}{}

% Patch case where name and year are separated by opening bracket
\patchcmd{\NAT@citex}
  {\@citea\NAT@hyper@{%
     \NAT@nmfmt{\NAT@nm}%
     \hyper@natlinkbreak{\NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi}%
       {\@citeb\@extra@b@citeb}%
     \NAT@date}}
  {\@citea\NAT@nmfmt{\NAT@nm}%
   \NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi\NAT@hyper@{\NAT@date}}
  {}{}
\makeatother

% Hyper-references
\RequirePackage[
    colorlinks=true,
    linkcolor=red,
    filecolor=black,
    citecolor=black,      
    urlcolor=black,
]{hyperref}
\urlstyle{same}
