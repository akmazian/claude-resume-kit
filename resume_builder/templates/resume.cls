%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% RESUME CLASS FILE — Notion-style
%
% Clean, document-like look inspired by Notion pages:
%   - Inter sans-serif typeface
%   - Large bold name, muted gray contact line
%   - Big blue section headings, no horizontal rules
%   - Round bullets with relaxed spacing
%   - Gray footer: name on the left, page number on the right
%
% The environment/command API (rSection, rSection2, rSubsection, skillgroup,
% skilldash, subtheme, \name, \address) is unchanged from the original
% Trey Hunner / LaTeXTemplates.com class, so existing .tex files still compile.
%
% Styling (font, colors, geometry, hyperlinks, footer) lives HERE — generated
% .tex files should not load geometry/fancyhdr/hyperref themselves.
%
% Options: a4paper (default) or letterpaper.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2026/09/25 v2.0 Notion-style resume class]

\newcommand{\resume@paper}{a4paper}
\DeclareOption{a4paper}{\renewcommand{\resume@paper}{a4paper}}
\DeclareOption{letterpaper}{\renewcommand{\resume@paper}{letterpaper}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt, \resume@paper]{article}

%----------------------------------------------------------------------------------------
%	PACKAGES
%----------------------------------------------------------------------------------------

\RequirePackage[T1]{fontenc}
\RequirePackage[sfdefault,semibold]{inter} % Inter — the typeface Notion uses (600 weight for bold)
\RequirePackage[protrusion=true]{microtype}
\RequirePackage{lastpage}
\RequirePackage[parfill]{parskip}
\RequirePackage{array}
\RequirePackage{ifthen}
\RequirePackage{enumitem}
\RequirePackage{xcolor}
\RequirePackage[includefoot,left=0.55in,right=0.55in,top=0.55in,bottom=0.35in,footskip=0.3in]{geometry}
\RequirePackage{fancyhdr}
\RequirePackage[version=4,arrows=pgf-filled]{mhchem}
\RequirePackage{ragged2e}
\RequirePackage{hyperref}

%----------------------------------------------------------------------------------------
%	NOTION PALETTE
%----------------------------------------------------------------------------------------

\definecolor{notiontext}{HTML}{37352F}   % Default body text
\definecolor{notiongray}{HTML}{787774}   % Secondary / metadata text
\definecolor{notionlight}{HTML}{C7C6C4}  % Separators
\definecolor{notionblue}{HTML}{387DC9}   % Heading accent

%----------------------------------------------------------------------------------------
%	BODY TYPE: Inter at \resume@bodysize, ragged-right, no hyphenation (like Notion)
%----------------------------------------------------------------------------------------

\def\resume@bodysize{9.25}
\def\resume@bodylead{12}
\renewcommand\normalsize{\fontsize{\resume@bodysize}{\resume@bodylead}\selectfont
  \abovedisplayskip 8pt \belowdisplayskip 8pt}
\renewcommand\small{\fontsize{8.75}{11}\selectfont}
\renewcommand\footnotesize{\fontsize{7.5}{9}\selectfont}
\normalsize
\AtBeginDocument{\RaggedRight\color{notiontext}}
\hyphenpenalty=10000
\exhyphenpenalty=50
\setlength{\RaggedRightParindent}{0pt}

\hypersetup{
  colorlinks = true,
  urlcolor   = notiontext,
  linkcolor  = notiontext,
  citecolor  = notiongray,
  filecolor  = notiongray,
  pdfborder  = {0 0 0},
}

% Separator used between inline metadata (e.g. "Org │ Dates")
\newcommand{\notionsep}{\hspace{0.45em}{\color{notionlight}|}\hspace{0.45em}}

%----------------------------------------------------------------------------------------
%	FOOTER: name left, page number right (both muted)
%----------------------------------------------------------------------------------------

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
\fancyfoot[L]{\footnotesize\color{notiongray}\@name}
\fancyfoot[R]{\footnotesize\color{notiongray}\thepage}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {}

\def \addressSep {\notionsep}

% Up to four address lines can be specified
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax
\let \@addressfour \relax

\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
  \@ifundefined{@addressfour}{
  \def \@addressfour {#1}
  } {\def \@addressone {#1}
  }
  }
  }
}

% \printaddress: muted gray contact/tagline line
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep}
    {\small\color{notiongray}#1}
  \endgroup
  \par\vspace{-0.35em}
}

% \printname: large bold name, Notion page-title style
\def \printname {
  \begingroup
  {\namesize\bfseries\color{black}\@name}\par
  \nameskip
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document
  \printname
  \@ifundefined{@addressone}{}{\printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{\printaddress{\@addresstwo}}
  \@ifundefined{@addressthree}{}{\printaddress{\@addressthree}}
  \@ifundefined{@addressfour}{}{\printaddress{\@addressfour}}
  \vspace{0.2em}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Notion "Heading 1": big, bold, blue, no rule underneath
\newcommand{\notionheading}[1]{%
  \par\sectionskip
  {\sectionsize\bfseries\color{notionblue}#1}\par\nopagebreak
  \sectionlineskip
}

% Plain paragraph section (Summary, Education, Skills, Experience wrapper)
\newenvironment{rSection}[1]{
  \notionheading{#1}
  \begin{list}{}{\setlength{\leftmargin}{0em}\setlength{\topsep}{0pt}}
  \item[]
}{
  \end{list}
}

% Bulleted section (Publications, Awards)
\newenvironment{rSection2}[1]{
  \notionheading{#1}
  \begin{list}{\notionbullet}{\leftmargin=1.4em \labelsep=0.6em \itemsep=2pt \parsep=0pt \topsep=0pt \partopsep=0pt}
   \vspace{-0.1em}
}{
  \end{list}
 \vspace{0.3em}
}

% Numbered section
\newenvironment{rSection3}[1]{
  \notionheading{#1}
  \begin{enumerate}[leftmargin=1.4em, itemsep=2pt, parsep=0pt, topsep=0pt]
}{
  \end{enumerate}
 \vspace{0.3em}
}

%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newcommand{\notionbullet}{\raisebox{0.12ex}{\small$\bullet$}}

% {theme / org}{dates}{title}{location}
% Renders:  **Theme** │ dates
%           Title  Location   (muted)
%           • bullets
\newenvironment{rSubsection}[4]{
 {\bfseries\color{black}#1}\ifthenelse{\equal{#2}{}}{}{\notionsep{\color{notiongray}#2}}
 \ifthenelse{\equal{#3}{}}{}{%
  \\
  {\color{notiongray}#3\ifthenelse{\equal{#4}{}}{}{\notionsep#4}}%
  }
  \begin{list}{\notionbullet}{\leftmargin=1.4em \labelsep=0.6em \itemsep=2pt \parsep=0pt \topsep=2pt \partopsep=0pt}
  }{
  \end{list}
  \vspace{0.35em}
}

%----------------------------------------------------------------------------------------
%	FORMAT C SKILLS COMMANDS
%----------------------------------------------------------------------------------------

% Skills group environment: \begin{skillgroup}{Group Name} ... \end{skillgroup}
% Bold header + indented dash sub-items. Each \skilldash = exactly 1 rendered line.
\newenvironment{skillgroup}[1]{%
  {\bfseries\color{black}#1}\par\nopagebreak%
  \vspace{-\parskip}%
  \begin{list}{\color{notiongray}--}{\leftmargin=1.1em \labelsep=0.45em \itemsep=0pt \topsep=0.1em \parsep=0pt \partopsep=0pt}%
}{%
  \end{list}%
  \vspace{-\parskip}\vspace{0.45em}%
}

% Single dash sub-item within a skillgroup. Content must fit 1 rendered line.
% Char limit: 111 - (0.5 x bold_char_count) at 9.25pt Inter
\newcommand{\skilldash}[1]{\item #1}

%----------------------------------------------------------------------------------------
%	EXPERIENCE SUB-THEME COMMAND
%----------------------------------------------------------------------------------------

% Notion "Heading 3"-style sub-theme within rSubsection
\newcommand{\subtheme}[1]{\item[] {\bfseries\color{notiongray}#1}}

%----------------------------------------------------------------------------------------
%	SIZES & SPACING
%----------------------------------------------------------------------------------------

\def\namesize{\fontsize{24}{28}\selectfont}
\def\sectionsize{\fontsize{15}{18}\selectfont}
\def\addressskip{\smallskip}
\def\sectionlineskip{\vspace{0.1em}}
\def\nameskip{\vspace{0.45em}}
\def\sectionskip{\vspace{0.55em}}
