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
\RequirePackage{pifont}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Colors
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\definecolor{accentcolor}{RGB}{0, 68, 102} % Deep blue
\definecolor{secondarycolor}{RGB}{80, 80, 80} % Dark gray
\definecolor{linkcolour}{rgb}{0,0.2,0.6}
\hypersetup{colorlinks,breaklinks,urlcolor=accentcolor,linkcolor=accentcolor}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fonts
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[bitstream-charter]{mathdesign}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\AtBeginDocument{
    \vspace*{-0.8\marginsize}
}
\pagestyle{empty}
\columnratio{\twocolumnratio}
\setlength\columnsep{30pt}

\DeclareEmphSequence{\bfseries}

% More variables
\setlength{\contentindent}{2.0em}
\setlength{\descrindent}{2.0em}
%\setlength{\columnseprule}{0.4pt}

\renewcommand{\titlerule}{\vspace{-\baselineskip}\rule{\linewidth}{0.4pt}\vspace{-\parskip}}
\renewcommand\labelitemi{\ding{70}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Clean contact details formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\iconbox}[1]{\makebox[1.2em][c]{\textcolor{accentcolor}{#1}}}

\newcommand{\phone}[1]{\href{tel:#1}{\iconbox{\faIcon{mobile-alt}} #1}}
\newcommand{\email}[1]{\href{mailto:#1}{\iconbox{\faIcon[regular]{envelope}} #1}}
\newcommand{\address}[1]{\iconbox{\faIcon{map-marker-alt}} #1}
\newcommand{\linkedin}[1]{\href{https://www.linkedin.com/in/#1}{\iconbox{\faIcon{linkedin}} #1}}
\newcommand{\github}[1]{\href{https://github.com/#1}{\iconbox{\faIcon{github}} #1}}
\newcommand{\githubpages}[1]{\href{https://#1.github.io}{\iconbox{\faIcon{github-alt}} #1.github.io}}
\newcommand{\website}[2]{\href{#1}{\iconbox{\faIcon{globe}} #2}}
\newcommand{\nationality}[1]{\iconbox{\faIcon[regular]{flag}} #1}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Headers and sections formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand\vbar{\kern1pt\textcolor{secondarycolor}{\rule[-\dp\strutbox]{.6pt}{\baselineskip}}\kern1pt}

\newenvironment{cvheader}[1]{
    \begin{center}
        {\Huge\color{accentcolor}\textbf{#1}}\\[4pt]
        {\color{accentcolor}\rule{6cm}{1.2pt}}\\[8pt]
}{
    \end{center}
}

\newenvironment{horizontallist}{
    \par
    \begin{enumerate*}[label={},itemjoin={\enspace\vbar\enspace}]
}{
    \end{enumerate*}
}

\newenvironment{verticallist}{
    \par
    \begin{enumerate}[label={},itemsep=0.35em,parsep=0pt,topsep=0.2em,leftmargin=*,align=left]
}{
    \end{enumerate}
}

% Document's section formatting
\titleformat{\section}
    {\large\scshape\raggedright\color{accentcolor}}{}{0em}{}[\titlerule]
\titlespacing*{\section}{0pt}{12pt}{4pt}
% Subsection formatting: similar to section but without the horizontal rule
\titleformat{\subsection}
    {\large\bfseries\raggedright}{}{0em}{\vspace{-1.0em}}[{\rule{8em}{0.4pt}}]
\titlespacing*{\subsection}{0pt}{10pt}{0pt}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sections content formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Header for each 'experience' entry
\newcommand{\experience}[2]{
    \vspace{0.25em}
    \textbf{#1} \hfill {\color{secondarycolor}\textit{#2}}
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Two column specific settings
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{tightverticallist}{
    \par
    \begin{enumerate}[label={},itemsep=0.35em,parsep=0pt,topsep=0.2em,leftmargin=*,align=left]
}{
    \end{enumerate}
}

\newenvironment{tightcvsubsection}[1]{
    \subsection{#1}
    \vspace{0.25em}
}{
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Sections content formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Different forms of descriptions of 'experience' entries
\newenvironment{tightdescrlist} {
    \vspace{-0.35em}
    \begin{itemize}[parsep=0.0em, leftmargin=*,align=left]
} {
    \end{itemize}
}

\newenvironment{tightdescr} {
    \vspace{-0.5em}
}{
}
