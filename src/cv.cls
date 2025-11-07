\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv}[2025/11/07 Simple CV Class]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Class options
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Font size options
\DeclareOption{10pt}{\PassOptionsToClass{10pt}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{11pt}{article}}
\DeclareOption{12pt}{\PassOptionsToClass{12pt}{article}}

% Process options
\ExecuteOptions{10pt} % default
\ProcessOptions\relax

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Load required packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\LoadClass[a4paper]{article}

\RequirePackage[margin=0.75in]{geometry}
\RequirePackage{url}
\RequirePackage{parskip}
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
\RequirePackage{marginnote}
\RequirePackage{tcolorbox}
\RequirePackage[T1]{fontenc}
\RequirePackage[bitstream-charter]{mathdesign}
\RequirePackage{paracol}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Customization
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Colors
\definecolor{accentcolor}{RGB}{0, 68, 102}
\definecolor{secondarycolor}{RGB}{80, 80, 80}

% Hyperlink setup
\hypersetup{
    colorlinks,
    breaklinks,
    urlcolor=accentcolor,
    linkcolor=accentcolor
}

% Layout
\newlength{\contentindent}
\newlength{\descrindent}
\setlength{\contentindent}{2.0em}
\setlength{\descrindent}{2.0em}

% Two-column settings
\def\twocolumnratio{0.31}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Document setup
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{
    \vspace*{-0.6in}
    \columnratio{\twocolumnratio}
    \setlength\columnsep{30pt}
}

\pagestyle{empty}

\DeclareEmphSequence{\bfseries}

% List styling
\renewcommand\labelitemi{\ding{70}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Header
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Ensures consistent icon alignment
\newcommand{\iconbox}[1]{\makebox[1.2em][c]{\textcolor{accentcolor}{#1}}}

% Contact detail commands
\newcommand{\phone}[1]{\href{tel:#1}{\iconbox{\faIcon{mobile-alt}} #1}}
\newcommand{\email}[1]{\href{mailto:#1}{\iconbox{\faIcon[regular]{envelope}} #1}}
\newcommand{\address}[1]{\iconbox{\faIcon{map-marker-alt}} #1}
\newcommand{\linkedin}[1]{\href{https://www.linkedin.com/in/#1}{\iconbox{\faIcon{linkedin}} #1}}
\newcommand{\github}[1]{\href{https://github.com/#1}{\iconbox{\faIcon{github}} #1}}
\newcommand{\githubpages}[1]{\href{https://#1.github.io}{\iconbox{\faIcon{github-alt}} #1.github.io}}
\newcommand{\website}[2]{\href{#1}{\iconbox{\faIcon{globe}} #2}}
\newcommand{\nationality}[1]{\iconbox{\faIcon[regular]{flag}} #1}

% Separator bar
\renewcommand{\titlerule}{\vspace{-\baselineskip}\rule{\linewidth}{0.4pt}\vspace{-\parskip}}
\newcommand\vbar{\kern1pt\textcolor{secondarycolor}{\rule[-\dp\strutbox]{.6pt}{\baselineskip}}\kern1pt}

% Header environment
\newenvironment{cvheader}[1]{
    \begin{center}
        {\Huge\color{accentcolor}\textbf{#1}}\\[4pt]
        {\color{accentcolor}\rule{6cm}{1.2pt}}\\[8pt]
}{
    \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section formatting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Main section title with horizontal rule
\titleformat{\section}
    {\large\scshape\raggedright\color{accentcolor}}{}{0em}{}[\titlerule]
\titlespacing*{\section}{0pt}{12pt}{4pt}

% Subsection
\titleformat{\subsection}
    {\large\bfseries\raggedright}{}{0em}{\vspace{-1.0em}}[{\rule{8em}{0.4pt}}]
\titlespacing*{\subsection}{0pt}{10pt}{0pt}

% Horizontal divider between sections
\newcommand{\sectiondivider}{
  \par\vspace{8pt}
  \noindent\titlerule
  \vspace{2pt}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% List Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Horizontal list for skills, contact details etc.
\newenvironment{horizontallist}{
    \par
    \begin{enumerate*}[label={},itemjoin={\enspace\vbar\enspace}]
}{
    \end{enumerate*}
}

% Vertical list
\newenvironment{verticallist}{
    \par
    \begin{enumerate}[label={},itemsep=0.35em,parsep=0pt,topsep=0.2em,leftmargin=*,align=left]
}{
    \end{enumerate}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Section Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Standard CV section with indented content
\newenvironment{cvsection}[1]{
    \section{#1}
    \vspace{0.25em}
    \begin{addmargin}[\contentindent]{0pt}
}{
    \end{addmargin}
}

% CV subsection (for nested content)
\newenvironment{cvsubsection}[1]{
    \subsection{#1}
    \vspace{0.25em}
    \begin{addmargin}[\contentindent]{0pt}
}{
    \end{addmargin}
}

% Compact no-indent version useful for two column layout
\newenvironment{tightcvsubsection}[1]{
    \subsection{#1}
    \vspace{0.25em}
}{
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Experience Entry Commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Basic experience header: \experience{Title}{Date}
\newcommand{\experience}[2]{
    \vspace{0.25em}
    \textbf{#1} \hfill {\color{secondarycolor}\textit{#2}}
}

% Experience with organization: \experienceorg{Title}{Organization}{Date}
\newcommand{\experienceorg}[3]{
    \vspace{0.25em}
    \textbf{#1}, \textit{#2} \hfill {\color{secondarycolor}\textit{#3}}
}

% Metadata line (for references, additional info)
% Usage: \metaline{Reference: Dr. Name \hfill \email{...}}
\newcommand{\metaline}[1]{
    \par\vspace{-\parskip}\noindent{\small\color{secondarycolor}\textit{#1}}
}

% Specialized reference command (not integral to the template)
\newcommand{\reference}[2]{
    \metaline{Reference: #1\hfill#2}
}

% Tags/keywords line (separated by bars)
% Usage: \tags{Tag1}{Tag2}{Tag3}
\newcommand{\tags}[1]{
    \vspace{-\parskip}\noindent\par
    {\color{secondarycolor}\textit{#1}}
}

% Helper to format multiple tags with separators
% Usage: \taglist{Tag1, Tag2, Tag3}
\newcommand{\taglist}[1]{
    \tags{\def\sep{}\@for\tag:=#1\do{\sep\tag\def\sep{\enspace\vbar\enspace}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description Environments
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Description list (bulleted)
\newenvironment{descrlist} {
    \vspace{-0.35em}
    \begin{addmargin}[\descrindent]{0pt}
    \begin{itemize}[parsep=0.0em, leftmargin=*,align=left]
} {
    \end{itemize}
    \end{addmargin}
}

% Description paragraph (text)
\newenvironment{descr} {
    \vspace{-0.5em}
    \begin{addmargin}[\descrindent]{0pt}
}{
    \end{addmargin}
}