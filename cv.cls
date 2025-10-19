\NeedsTeXFormat{LaTeX2e}
\newlength{\marginsize}
\newlength{\mainfontsize}
\newlength{\contentindent}
\newlength{\descrindent}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Variables to adjust
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\marginsize}{0.8in}

\setlength{\mainfontsize}{10pt}
\def\twocolumnratio{0.31}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Setup and load packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\LoadClass[a4paper,\mainfontsize]{article}
\RequirePackage[margin=\marginsize]{geometry}
\RequirePackage{url}
\RequirePackage{parskip}
\RequirePackage{paracol}
\RequirePackage{color}
\RequirePackage{graphicx}
\RequirePackage{titlesec}
\RequirePackage{multicol}
\RequirePackage{multirow}
\RequirePackage{supertabular}
\RequirePackage{tabularx}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage[inline]{enumitem}
\RequirePackage{changepage}
\RequirePackage{scrextend}
\RequirePackage[unicode, draft=false]{hyperref}
\RequirePackage{fontawesome5}

\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{colorlinks,breaklinks,urlcolor=linkcolour,linkcolor=linkcolour}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
    \vspace*{-0.8\marginsize}
}
\pagestyle{empty}
\columnratio{\twocolumnratio}

\DeclareEmphSequence{\bfseries}

% More variables
\setlength{\contentindent}{1.5em}
\setlength{\descrindent}{1.5em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Custom commands and environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand\vbar{\kern1pt\rule[-\dp\strutbox]{.6pt}{\baselineskip}\kern1pt}

\newenvironment{cvheader}[1]{
    \begin{center}
        {\Huge{#1}}
}{
    \end{center}
}

\newenvironment{contactdetails}{
    \begin{center}
    \begin{enumerate*}[label={},itemjoin={\enspace\vbar\enspace}]
}{
    \end{enumerate*}
    \end{center}
    \vspace{-0.25em}
}


% Contact details
\newcommand{\phone}[1]{\href{tel:#1}{\raisebox{-0.05\height}{\faIcon{mobile-alt}} \ #1}}
\newcommand{\email}[1]{\href{mailto:#1}{\raisebox{-0.05\height}{\faIcon[regular]{envelope}} \ #1}}
\newcommand{\address}[1]{\raisebox{-0.05\height}{\faIcon{map-marker-alt}} \ #1}
\newcommand{\linkedin}[1]{\href{https://www.linkedin.com/in/#1}{\raisebox{-0.05\height}{\faIcon{linkedin}} \ #1}}
\newcommand{\github}[1]{\href{https://github.com/#1}{\raisebox{-0.05\height}{\faIcon{github}} \ #1}}
\newcommand{\githubpages}[1]{\href{https://#1.github.io}{\raisebox{-0.05\height}{\faIcon{github-alt}} \ #1.github.io}}
\newcommand{\website}[2]{\href{#1}{\raisebox{-0.05\height}{\faIcon{globe}} \ #2}}
\newcommand{\nationality}[1]{\raisebox{-0.05\height}{\faIcon[regular]{flag}} \ #1}


% Document's section formatting
\titleformat{\section}
    {\large\scshape\raggedright}{}{0em}{}[\titlerule]
\titlespacing*{\section}{0pt}{12pt}{4pt}
% Subsection formatting: similar to section but without the horizontal rule
\titleformat{\subsection}
    {\large\bfseries\raggedright}{}{0em}{}
\titlespacing*{\subsection}{0pt}{8pt}{2pt}

% Horizontal divider between sections
\newcommand{\sectiondivider}{
  \par\vspace{8pt}
  \noindent\titlerule
  \vspace{2pt}
}

\newenvironment{cvsection}[1]{
    \section{#1}
    \vspace{0.25em}
    \begin{addmargin}[\contentindent]{0pt}
}{
    \end{addmargin}
}

\newenvironment{cvsubsection}[1]{
    \subsection{#1}
    \vspace{0.25em}
    \begin{addmargin}[\contentindent]{0pt}
}{
    \end{addmargin}
}

% Header for each 'experience' entry
\newcommand{\experience}[2] {
    \vspace{0.25em}
    \textbf{#1} \hfill #2
}

% Different forms of descriptions of 'experience' entries
\newenvironment{descrlist} {
    \vspace{-0.35em}
    \begin{addmargin}[\descrindent]{0pt}
    \begin{itemize}[parsep=0.0em, leftmargin=*,align=left]
} {
    \end{itemize}
    \end{addmargin}
}

\newenvironment{descr} {
    \vspace{-0.5em}
    \begin{addmargin}[\descrindent]{0pt}
}{
    \end{addmargin}
}

% Some not-yet-generalized environments
\newenvironment{languages}{
    \vspace{-0.35em}
    \begin{enumerate*}[label={},itemjoin={\enspace\vbar\enspace}]
}{
    \end{enumerate*}
}

\newenvironment{awards}{
    \begin{enumerate}[leftmargin=*,align=left]
}{
    \end{enumerate}
}
