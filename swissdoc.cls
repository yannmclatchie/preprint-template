% predoc.cls
% Preprint template class
% 21.03.2024 Yann McLatchie yann.mclatchie.23 (at) ucl.ac.uk
% --- Class structure: identification part
% ---
\ProvidesClass{swissdoc}[21.03.2024 version 1.00 Preprint template]
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
\usepackage[scaled]{helvet} % sans serif
\RequirePackage[varqu,varl]{inconsolata} % typewriter
\RequirePackage{amsmath,amsthm}
\RequirePackage[varg]{newtxmath}

% Finer resolution type
\RequirePackage{microtype}

% New line between paragraphs, no indent
\usepackage[parfill]{parskip}

% Section heads and title
\RequirePackage{titlesec}
\RequirePackage{eqparbox}
% Sections
\titleformat{\section}{\large\bfseries\sffamily}{\llap{\eqmakebox[S]{\thesection}}}{\marginparsep}{}
\titlespacing*{\section}{-\marginparsep}{*3.25}{*1.5}%
% Sub-sections
\titleformat{\subsection}{\large\sffamily}{\llap{\eqmakebox[S]{\thesubsection}}}{\marginparsep}{}
\titlespacing*{\subsection}{-\marginparsep}{*3.5}{*2.3}%
% Paragraphs
\titleformat*{\paragraph}{\bfseries\sffamily}

% make abstract title \sffamily
\RequirePackage{abstract}
\renewcommand\abstractnamefont{\mdseries\sffamily}
\abslabeldelim{.}
\setlength\absleftindent{0pt}
\setlength\absrightindent{0.25\linewidth}
\setlength{\absparindent}{0pt}
\setlength{\absparsep}{0pt}
\renewcommand{\absnamepos}{flushleft}

% Custom captions
\RequirePackage{caption}
\DeclareCaptionFormat{custom}
{%
    {\small\sffamily#1#2} {\small #3}
}
\DeclareCaptionLabelSeparator{custom}{.}
\captionsetup{format=custom, labelsep=custom}

% Page layout
\newlength\muellerwidth 
\setlength\muellerwidth{1.75cm}
\RequirePackage[
    a4paper,
    left=1\muellerwidth,
    right=2\muellerwidth,
    top=1.5\muellerwidth,
    bottom=3\muellerwidth,
    % showframe % for dev
    % includehead,
    % includefoot
]{geometry}

% Penalties
\widowpenalty=10000
\clubpenalty=10000

% Headers and footers
\RequirePackage{fancyhdr}
% \setlength{\headheight}{13.6pt}
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
\fancyfoot[LO,RE]{\sffamily \thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

%% Changeable parameters.
\newlength\aftertitskip   
\setlength\aftertitskip{0.3in plus 0.2in minus 0.2in}

% Author block
\RequirePackage{authblk}
\renewcommand{\Authfont}{\normalsize \sffamily}
\renewcommand{\Affilfont}{\small \mdseries \rmfamily}
\setlength{\affilsep}{2pt}

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
    \let\footnote\thanks %
    {\raggedright\sffamily\mdseries\bfseries\huge \@title %
      \if\@keywords\@empty\else
        \blankfootnote{\textit{Keywords:}\/ \@keywords}
      \fi %
      \par 
    }%
    {\large%
     \begin{flushleft}%
        \noindent \@author
     \end{flushleft}%
    }%
    \vspace*{0.2\textheight}%
    }
\makeatother

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
\renewcommand\UrlFont{\ttfamily}

% Mathematical environments
\newtheoremstyle{mathdoc}%                % Name
  {}%                                     % Space above
  {}%                                     % Space below
  {\itshape}%                             % Body font
  {}%                                     % Indent amount
  {\bfseries\sffamily}%                   % Theorem head font
  {.}%                                    % Punctuation after theorem head
  { }%                                    % Space after theorem head, ' ', or \newline
  {}%                                     % Theorem head spec (can be left empty, meaning `normal')
\theoremstyle{mathdoc}