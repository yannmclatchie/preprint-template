# A collection of LaTeX preprint templates

We have three different flavours of template:

1. a one-column pre-print template resembling machine learning journals (`predoc.cls` and `predoc2.cls`, the latter of which is more activiely developed);
2. a two-column pre-print template resembling some conference (and journal) styles (`procdoc.cls` and `procdoc2.cls`, again the latter of which is more activiely developed); and,
3. a one-column, formatted more inline with traditional mathematics journals (`mathdoc.cls`).

The `*doc2.cls` templates were borne from a desire to make the titling ragged-right, which we found to be more modern. Following the realisation that this was nicer, development on `*doc.cls` templates was left behind. If you would like centred titling, please use `mathdoc.cls`.

## Features

### Loading the templates

Users should load the templates as follows:

```tex
\pdfoutput=1 % ensure pdflatex for arXiv
\documentclass[10pt,twoside]{predoc2}
```

However, it is easiest to simply copy and paste one of the `*-sample.tex` documents so that you are not starting from scratch.

### Automatically-imported packages

All three main class files (those being `predoc2.cls`, `procdoc2.cls`, and `mathdoc.cls`) use the `authblk` package for author and institutions, pre-load the `natbib`, `hyperref`, and `amsmath` and `amsthm` packages (in order to define custom theorem styles). 

### Front matter

Alongside authors and institutions, one can add keywords and thanks to their front matter. In `predoc2.cls` and `procdoc2.cls`, this is done through the `keywords` environment _after_ the `\begin{document}` command, e.g.

```tex
% imports etc. go before \begin{document} command

\begin{document}
\maketitle
\thispagestyle{empty}
%
\begin{abstract}
    This is my abstract
\end{abstract}
%
\begin{keywords}
    first topic; another keyword; and a third.
\end{keywords}
```

In `mathdoc.cls`, this is done _before_ the `\begin{document}` command alongside title and authors, e.g.

```tex
\title{Sample document}
\keywords{keyword 1; phrase 2.} % keywords are optional in all classes
\author[1]{First Author\thanks{This is a thanks footnote.}} % this is how you add a thanks footnote
\author[2]{Second Author}
\affil[1]{Department One, Institution One, Address One}
\affil[2]{Department Two, Institution Two, Address Two}
```

### Running title and authors

Across all classes, one can add running titles and authors with the following (placed _before_ the `\begin{document}` command) 

```tex
% authors and institutions go above

% set running title and authors
\makeatletter
\def\runauthor{F. Author and S. Author}
\def\runtitle{Running title}
\makeatother

% \begin{document} goes below
```

or if you would like to automatically use your full title as the running title, use

```tex
% authors and institutions go above

% set running title and authors
\makeatletter
\def\runauthor{F. Author and S. Author}
\let\inserttitle\@title
\def\runtitle{\inserttitle}
\makeatother

% \begin{document} goes below
```

### 
