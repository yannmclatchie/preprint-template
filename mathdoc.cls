% mathdoc.cls
% Mathematical article template class
% 01.09.2022 Yann McLatchie yann.mclatchie (at) aalto.fi
% --- Class structure: identification part
% ---
\ProvidesClass{mathdoc}[01.09.2022 version 1.00 Mathematics template]
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
\LoadClass{article}

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
\titleformat{\section}[block]%
  {\large\sffamily\scshape\centering}
  {\thesection.}
  {\baselineskip}
  {}
\titleformat{\subsection}[runin]%
  {\bfseries\sffamily\scshape}
  {\thesubsection.}
  {1em}
  {}
\titleformat{\subsubsection}[runin]%
  {\sffamily\scshape\mdseries}
  {\thesubsubsection.}
  {1em}
  {}
\titleformat*{\paragraph}{\itshape\sffamily}

% Custom abstract
\RequirePackage[runin]{abstract}
\renewcommand\abstractnamefont{\bfseries\sffamily\scshape}
\renewcommand{\abstractname}{Abstract.}

% Blank footnotes for the keywords
\let\svthefootnote\thefootnote
\newcommand\blankfootnote[1]{%
  \let\thefootnote\relax\footnotetext{#1}%
  \let\thefootnote\svthefootnote%
}
\newcommand\keywords[1]{\renewcommand\@keywords{#1}}
\newcommand\@keywords{}

% Custom title section
\makeatletter
\def\@maketitle{%
\newpage%
\null%
\begin{center}%
    \vspace*{-5em} %
    \let\footnote\thanks %
    {\sffamily\scshape\bfseries\Large \@title %
      \if\@keywords\@empty\else
        \blankfootnote{\textit{Keywords:}\/ \@keywords}
      \fi %
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
    {\small\sffamily#1#2} \small #3
}
\DeclareCaptionLabelSeparator{custom}{.}
\captionsetup{format=custom, labelsep=custom}

% Page layout
\RequirePackage[
    a4paper,
    inner=1.5in,
    outer=1.5in,
    top=1in,
    bottom=1in,
    includehead,
    includefoot
]{geometry}

% Penalties
\widowpenalty=10000
\clubpenalty=10000

% Author block
\RequirePackage{authblk}
\renewcommand{\Authfont}{\normalsize \mdseries}
\renewcommand{\Affilfont}{\small \itshape}
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
\fancyhead[CO]{{\sffamily \scshape \runauthor}}
\fancyhead[CE]{{\sffamily \scshape \runtitle}}
\fancyfoot[CE,CO]{\sffamily \thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

% References
\RequirePackage[sort]{natbib}
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

% Hyperrefs
\RequirePackage[
    colorlinks=true,
    linkcolor=red,
    filecolor=black,
    citecolor=black,      
    urlcolor=black,
]{hyperref}
\RequirePackage{url}
\renewcommand\UrlFont{\ttfamily}

% Appendices
\RequirePackage[title]{appendix}

% Mathematical environments
\newtheoremstyle{mathdoc}%                % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {\itshape}%                             % Body font
  {}%                                     % Indent amount
  {\bfseries\sffamily\scshape}%                   % Theorem head font
  {.}%                                    % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {}%                                     % Theorem head spec (can be left empty, meaning `normal')
\theoremstyle{mathdoc}
