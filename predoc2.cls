% predoc.cls
% Preprint template class
% 01.09.2022 Yann McLatchie yann.mclatchie (at) aalto.fi
% --- Class structure: identification part
% ---
\ProvidesClass{predoc2}[01.09.2022 version 1.00 Preprint template]
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
\titleformat*{\section}{\Large\bfseries\sffamily}
\titleformat*{\subsection}{\large\bfseries\sffamily}
\titleformat*{\subsubsection}{\itshape\sffamily}
\titleformat*{\paragraph}{\bfseries\sffamily}

% make abstract title \sffamily
\RequirePackage[runin]{abstract}
\renewcommand\abstractnamefont{\mdseries\sffamily}
\abslabeldelim{.\,\,}

% Add keywords
\newenvironment{keywords}
{%
  \makeatletter
  \renewcommand\abstractnamefont{\itshape\mdseries\sffamily}
  \renewcommand\abstractname{Keywords}
  \abslabeldelim{:\,\,}
  \makeatother
  \abstract
}{%
  \endabstract\par
}

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
    margin=1in,
    includehead,
    includefoot
]{geometry}

% Penalties
\widowpenalty=10000
\clubpenalty=10000

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

%% Changeable parameters.
\newlength\aftertitskip   
\setlength\aftertitskip{0.3in plus 0.2in minus 0.2in}

% Author block
\RequirePackage{authblk}
\renewcommand{\Authfont}{\normalsize \sffamily}
\renewcommand{\Affilfont}{\small \itshape \rmfamily}
\setlength{\affilsep}{2pt}

% Title
\def\@maketitle{\vspace*{-0.5in}%
\vbox{\hsize\textwidth
% \linewidth\hsize \vskip 0.1in \toptitlebar \centering
\noindent{\raggedright\huge\bf\sffamily \@title\par}\vskip \aftertitskip
% \bottomtitlebar % \vskip 0.1in %  minus
{\large%
 \begin{flushleft}%
    \noindent \@author
 \end{flushleft}%
 \par}}}

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