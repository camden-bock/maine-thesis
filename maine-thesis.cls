%%
%% This is file `maine-thesis.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% maine-thesis.cls.tmp.dtx  (with options: `class')
%% 
%% IMPORTANT NOTICE:
%% 
%% For the copyright see the source file.
%% 
%% Any modified versions of this file must be renamed
%% with new filenames distinct from maine-thesis.cls.
%% 
%% For distribution of the original source see the terms
%% for copying and modification in the file maine-thesis.cls.tmp.dtx.
%% 
%% This generated file may be distributed as long as the
%% original source files, as listed above, are part of the
%% same distribution. (The sources need not necessarily be
%% in the same archive or directory.)

\ProvidesClass{maine-thesis}[2025/09/01 v2.1 Maine thesis class]

\NeedsTeXFormat{LaTeX2e}[1999/12/01]

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
\newif\ifdraft\draftfalse
\newif\iftwoside\twosidefalse
\newif\ifmt@official\mt@officialtrue
\newif\ifunbound\unboundfalse
\newif\ifmt@legacycaptions\mt@legacycaptionsfalse
\newif\ifmt@loftspace\mt@loftspacefalse
\newcommand\docsize{}
\newcommand\side{oneside}
\newcounter{secnumdefault}
\setcounter{secnumdefault}{3}
\newcounter{head} %Heading styles get numbered so that \ifcase can be used when determining which heading style is currently set instead of a nested set of \if and \else.
\setcounter{head}{1000} %The default value is set very large so that adding new styles shouldn't necessitate changing it.
\def\@margg{1.5in}
\def\mt@pagestyle{bottom}
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

\DeclareOption{10pt}{\renewcommand\docsize{10pt}\PassOptionsToClass{10pt}{report}}
\DeclareOption{11pt}{\renewcommand\docsize{11pt}\PassOptionsToClass{11pt}{report}}
\DeclareOption{12pt}{\renewcommand\docsize{12pt}\PassOptionsToClass{12pt}{report}}

\DeclareOption{draft}{\drafttrue
    % When in draft mode, it defaults to a 10pt font size for faster compilation.
    \ExecuteOptions{10pt}
    % The `draft` option is passed to the underlying `report` class to
    % show draft annotations (like black squares for overfull hboxes).
    %\PassOptionsToClass{draft}{report}
    % Defines a command to display a "DRAFT" watermark or text.
    \newcommand{\drafttext}{\sffamily\small{DRAFT}}
    % Sets a conditional to false, which might hide official marks.
    \mt@officialfalse
}

\DeclareOption{twoside}{\mt@officialfalse\unboundfalse\twosidetrue\renewcommand\side{twoside}\def\@margg{1.5in}\PassOptionsToClass{twoside}{report}}
\DeclareOption{oneside}{\mt@officialfalse\unboundfalse\renewcommand\side{oneside}\def\@margg{1.5in}\PassOptionsToClass{oneside}{report}}

\DeclareOption{unbound}{\mt@officialtrue\unboundtrue\def\@margg{1in}}

\def\HeadingStyle{} % Define an empty macro as a placeholder
\DeclareOption{apa}{
    \setcounter{secnumdefault}{3}
    \setcounter{head}{0}
    \def\HeadingStyle{apa}}
\DeclareOption{chicago}{
    \setcounter{secnumdefault}{3}
    \setcounter{head}{1}
    \def\HeadingStyle{chicago}}
\DeclareOption{headings}{
    \setcounter{secnumdefault}{3}
    \setcounter{head}{2}
    \def\HeadingStyle{mainethesis}}
\DeclareOption{idecimal}{
    \setcounter{secnumdefault}{3}
    \setcounter{head}{3}
    \def\HeadingStyle{idecimal}}
\DeclareOption{jdecimal}{
    \setcounter{secnumdefault}{3}
    \setcounter{head}{1000}
    \def\HeadingStyle{jdecimal}}

\DeclareOption{legacycaptions}{\mt@legacycaptionstrue}

\DeclareOption{pagenumberbottom}{\def\mt@pagestyle{bottom}}
\DeclareOption{pagenumbertop}{\def\mt@pagestyle{top}}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\DeclareOption{loftspacing}{\mt@loftspacetrue\mt@officialfalse}

\DeclareOption{table}{\PassOptionsToPackage{table}{xcolor}}
\DeclareOption{xcdraw}{\PassOptionsToPackage{xcdraw}{xcolor}}

\newcommand*{\@citestyle}{authoryear}

\DeclareOption{citestyle}{%
  \renewcommand*{\@citestyle}{#1}%
}

\ExecuteOptions{citestyle=authoryear}

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
\ExecuteOptions{12pt,unbound}
\ProcessOptions
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

\LoadClass[\docsize,\side]{report}[2022/07/02 v1.4n Standard LaTeX document class]

\RequirePackage[T1]{fontenc}[2024/06/01 v2.0h Standard LaTeX package]

\RequirePackage{fontspec}[2022/01/15 v2.8a Font selection for XeLaTeX and LuaLaTeX]

\RequirePackage{microtype}[2023/03/13 v3.1a Micro-typographical refinements (RS)]

\RequirePackage{lscape}[2020/05/28 v3.02]

\RequirePackage{pdflscape}[2022-10-27 v0.13 Display of landscape pages in PDF]

\RequirePackage[titles]{tocloft}[2017/08/31 v2.3i parameterised ToC, etc., typesetting]

\RequirePackage{newunicodechar}[2018/04/08 v1.2 Defining Unicode characters]

\RequirePackage{textcomp}[2020/02/02 v2.0n Standard LaTeX package]

\RequirePackage[super]{nth}[2002/02/27]

\RequirePackage[colorinlistoftodos]{todonotes}[2023/01/31]

\RequirePackage[version=4]{mhchem}[2021/12/31 v4.09 for typesetting chemical formulae]

\RequirePackage{textgreek}[2011/10/09 v0.7 Greek symbols in text]

\RequirePackage{siunitx}[2023-03-14 v3.2.3 A comprehensive (SI) units package]

\RequirePackage{geometry}[2020/01/02 v5.9 Page Geometry]

\RequirePackage{tabularx}[2023/12/11 v2.12a]

\RequirePackage{hyperref}[2023-02-07 v7.00v Hypertext links for LaTeX]

\RequirePackage{csquotes}[2022-09-14 v5.2n context-sensitive quotations (JAW)]

\RequirePackage[backend=biber, style=\@citestyle, doi = true, autopunct = true, date=year]{biblatex}[2024/03/05 v3.19]

\RequirePackage{graphicx}[2021/09/16 v1.2d Enhanced LaTeX Graphics (DPC,SPQR)]

\RequirePackage{rotating}[2016/08/11 v2.16d rotated objects in LaTeX]

\RequirePackage[margin=10pt,font=small,labelfont=bf,labelsep=endash]{caption}[2023/03/12 v3.6j Customizing captions (AR)]

\RequirePackage{float}[2001/11/08 v1.3d Float enhancements (AL)]

\RequirePackage{booktabs}[2020/01/12 v1.61803398 Publication quality tables]

\RequirePackage{xcolor}[2022/06/12 v2.14 LaTeX color extensions (UK)]

\RequirePackage{multirow}[2021/03/15 v2.8 Span multiple rows of a table]

\RequirePackage{longtable}[2021-09-01 v4.17 Multi-page Table package (DPC)]

\RequirePackage[none]{hyphenat}[2009/09/02 v2.3c]

\RequirePackage{iftex}[2022/02/03 v1.0f TeX engine tests]

\RequirePackage{lineno}[2023/01/19 line numbers on paragraphs v5.1]

\RequirePackage{etoolbox}[2020/10/05 v2.5k e-TeX tools for LaTeX (JAW)]

\RequirePackage{soul}[2003/11/17 v2.4]

\RequirePackage{tocbibind}[2010/10/13 v1.5k extra ToC listings]

\RequirePackage{titlesec}[2021/07/05 v2.14 Sectioning titles]

\RequirePackage{textcase}[2022/07/10 v1.03 Text only upper/lower case changing (DPC)]

\RequirePackage{titling}[2004/08/17 v2.1d]

\RequirePackage{setspace}[2022/12/04 v6.7b set line spacing]

\RequirePackage{xstring}[2013/10/13 v1.7c]

\RequirePackage{afterpackage}[2006/01/17 v1.1]

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

\def\@title{}
\def\@author{}
\def\@authorpronoun{}
\def\@degreesheld{}
\def\@degree{}
\def\@program{}
\def\@submitdate{}
\def\@principaladvisor{}
\def\@secondadvisor{}
\def\@principalshort{}
\def\@firstreader{}
\def\@secondreader{}
\def\@thirdreader{}
\def\@fourthreader{}
\def\@fifthreader{}
\def\@bibfiles{}
\def\@type{Dissertation}
\def\@LastLevel{0}

\newif\ifmultipleappendices\multipleappendicesfalse
\newif\ifcopyrightpage\copyrightpagefalse
\newif\ifbigtitlepage\bigtitlepagefalse
\newif\ifverybigtitlepage\verybigtitlepagefalse
\newif\ifapp\appfalse

\newcount\numcomm \numcomm=4
\newcount\numadv \numadv=1

\renewcommand*\contentsname{Table of Contents}
\renewcommand*\bibname{References}
\renewcommand*\indexname{INDEX}
\renewcommand*\chaptername{Chapter}
\renewcommand*\appendixname{Appendix}
\newcommand*\listname{List of}
\newcommand*\chapternamep{\chaptername s}
\newcommand*\prefacename{Preface}
\newcommand*\acknowledgename{Acknowledgments}
\newcommand*\landacknowledgename{Land Acknowledgments}
\newcommand*\dedicationname{Dedication}
\newcommand*\bioname{Biography of the Author}

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\author}[1]{%
    \ifx\empty#1\empty\else\gdef\@author{#1}\fi}
\newcommand{\authorpronoun}[1]{%
    \ifx\empty#1\empty\else\gdef\@authorpronoun{#1}\fi}
\renewcommand{\title}[1]{%
    \ifx\empty#1\empty\else\gdef\@title{#1}\fi}
\newcommand{\degreesheld}[1]{%
    \ifx\empty#1\empty\else\gdef\@degreesheld{#1}\fi}
\newcommand{\degree}[1]{%
    \ifx\empty#1\empty\else\gdef\@degree{#1}\fi}
\newcommand{\program}[1]{%
    \ifx\empty#1\empty\else\gdef\@program{#1}\fi}
\newcommand{\submitdate}[1]{%
    \ifx\empty#1\empty\else\gdef\@submitdate{#1}\fi}
\newcommand{\principaladvisor}[2][\empty]{%
    \ifx\empty#1\empty\else\gdef\@principalshort{\sloppy#1}\fi%
    \ifx\empty#2\empty\else\gdef\@principaladvisor{\sloppy#2}\fi%
    }
\newcommand{\secondadvisor}[1]{%
    \ifx\empty#1\empty\else\gdef\@secondadvisor{\sloppy#1}\fi
    \twoadvisors}
\newcommand{\principalshort}[1]{%
    \ifx\empty#1\empty\else\gdef\@principalshort{#1}\fi}
\newcommand{\firstreader}[1]{%
    \ifx\empty#1\empty\else\gdef\@firstreader{\sloppy#1}\fi
    \members{1}}
\newcommand{\secondreader}[1]{%
    \ifx\empty#1\empty\else\gdef\@secondreader{\sloppy#1}\fi
    \members{2}}
\newcommand{\thirdreader}[1]{%
    \ifx\empty#1\empty\else\gdef\@thirdreader{\sloppy#1}\fi
    \members{3}}
\newcommand{\fourthreader}[1]{%
    \ifx\empty#1\empty\else\gdef\@fourthreader{\sloppy#1}\fi
    \members{4}}
\newcommand{\fifthreader}[1]{%
    \ifx\empty#1\empty\else\gdef\@fifthreader{\sloppy#1}\fi
    \members{5}}
\newcommand{\bibfiles}[1]{%
    \ifx\empty#1\empty\else\gdef\@bibfiles{#1}\fi}
\newcommand{\members}[1]{\numcomm=#1}
\newcommand{\twoadvisors}{\numadv=2}
\newcommand{\oneadvisor}{\numadv=1}
\newcommand{\thesis}{
    \gdef\@type{Thesis}}
\newcommand{\project}{
    \gdef\@type{Project}}
\newcommand{\compresstitlepage}[1][1]{
    \ifcase#1
        \relax
    \or
        \bigtitlepagetrue
    \or
        \bigtitlepagetrue
        \verybigtitlepagetrue
    \fi
}
\renewcommand{\bibname}{References}

%%% ------------------------------------------------------------------
%%% ------------------------------------------------------------------

\newcommand{\comment}[1]{
    \ifdraft
    \marginpar{
        \color{red}\flushleft\scriptsize\setlength{\baselineskip}{7pt}
        {\MakeTextUppercase{Note}: #1}}
    \fi
}

\newcommand{\ignore}[1]{}

\newcommand{\highlight}[1]{%
    \ifdraft%
        \hl{#1}%
    \else%
        #1%
    \fi%
}
%%% ------------------------------------------------------------------
%%% -------------------------------------------------------------------

\ifdraft{\linenumbers}\fi

\setmainfont{EB Garamond}

\geometry{
    letterpaper,
    margin=1in,
    left=\@margg,
    headsep=0.4in,
    headheight=14pt,
    footskip=30pt,
    marginparwidth=40pt,
    marginparsep=10pt}

\setcounter{secnumdepth}{\value{secnumdefault}}
\setcounter{tocdepth}{\value{secnumdefault}}
\raggedbottom
\raggedright
\parindent=1.5em\relax
\markboth{}{}
\clubpenalty=10000
\widowpenalty=10000

\def\verbatim@font{\rmfamily}

\newcommand*\loftspacing{10}

%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

\def\adddot#1{#1.\thinspace}
\def\addul#1{\underline{#1}}
\def\adddotul#1{\underline{#1}.\thinspace}

\newcommand{\apaheadings}{%
    \typeout{applying apa headings}
    %--- APA 7 Style Headings ---
    \titleformat{\chapter}[display]{\normalfont\centering\bfseries}{\chaptertitlename\ \thechapter}{-3pt}{\MakeTextUppercase}
    \titlespacing{\chapter}{0pt}{50pt}{15pt}
    \titleformat{\section}{\normalfont\bfseries}{\thesection}{0em}{}
    \titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
    \titleformat{\subsection}{\normalfont\bfseries\itshape}{\thesubsection}{0em}{}
    \titlespacing{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .1ex}
    \titleformat{\subsubsection}[runin]{\normalfont\bfseries}{\thesubsubsection}{1em}{\adddot}
    \titlespacing{\subsubsection}{\parindent}{3.25ex plus 1ex minus .2ex}{0pt}[1em]
    \titleformat{\paragraph}[runin]{\normalfont\bfseries\itshape}{\theparagraph}{1em}{\adddot}
    \titlespacing{\paragraph}{\parindent}{3.25ex plus 1ex minus .2ex}{0pt}[1em]
}

\newcommand{\chicagoheadings}{%
    % Level 1: Centered, Boldface, Headline-style
    \titleformat{\chapter}[display]{\normalfont\centering\bfseries}{\chaptertitlename\ \thechapter}{-3pt}{\MakeTextUppercase}
    \titlespacing{\chapter}{0pt}{50pt}{15pt}

    % Level 2: Centered, Regular, Headline-style
    \titleformat{\section}{\normalfont\centering\normalsize}{\thesection}{1.5ex}{\MakeTextUppercase}
    \titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

    % Level 3: Flush Left, Bold Italic, Headline-style
    \titleformat{\subsection}{\normalfont\bfseries\itshape\normalsize}{\thesubsection}{0em}{\MakeTextUppercase}
    \titlespacing{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .1ex}

    % Level 4: Flush left, Roman type, Sentence-style
    \titleformat{\subsubsection}{\normalfont\normalsize}{\thesubsubsection}{0em}{}
    \titlespacing{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{0pt plus .1ex}

    % Level 5: Run in, Bold Italic, Sentence-style, with period
    \titleformat{\paragraph}[runin]{\normalfont\bfseries\itshape}{\theparagraph}{1em}{\adddot}
    \titlespacing{\paragraph}{\parindent}{3.25ex plus 1ex minus .2ex}{0pt}[1em]
}

\newcommand{\mainethesisheadings}{%
    %--- Sample Headings from Guidelines ---
    % Chapter Titles
    \titleformat{\chapter}[display]{\normalfont\centering\bfseries}{\chaptertitlename\ \thechapter}{-3pt}{\MakeTextUppercase}
    \titlespacing{\chapter}{0pt}{50pt}{15pt}

    % First Level Headings
    \titleformat{\section}{\normalfont\bfseries}{}{0pt}{\addul}
    \titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

    % Second Level Headings
    \titleformat{\subsection}{\normalfont\bfseries}{}{0pt}{}
    \titlespacing{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .1ex}

    % Third Level Headings
    \titleformat{\subsubsection}[runin]{\normalfont\bfseries}{}{0pt}{\adddotul}
    \titlespacing{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{0pt}

    % Fourth Level Headings
    \titleformat{\paragraph}[runin]{\normalfont}{}{0pt}{\adddotul}
    \titlespacing{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{0pt}
}

\newcommand{\idecimalheadings}{%
    \setcounter{tocdepth}{4}
    % Chapter Titles: Centered and bold
    \titleformat{\chapter}[display]{\normalfont\centering\bfseries}{\thechapter}{1em}{}
    \titlespacing{\chapter}{0pt}{50pt}{15pt}

    % Level 1 Headings: Bold, followed by a line break
    \titleformat{\section}{\normalfont\bfseries}{\thesection}{1em}{}
    \titlespacing{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}

    % Level 2 Headings: Bold, followed by a line break
    \titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{1em}{}
    \titlespacing{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .1ex}

    % Level 3 Headings: Bold, run-in with a period, with 1em spacing between number and title
    \titleformat{\subsubsection}[runin]{\normalfont\bfseries}{\thesubsubsection}{1em}{\adddot}
    \titlespacing{\subsubsection}{\parindent}{3.25ex plus 1ex minus .2ex}{0pt}[1em]

    % Level 4 Headings: Bold, run-in with a period, with 1em spacing
    \titleformat{\paragraph}[runin]{\normalfont\bfseries}{\theparagraph}{1em}{\adddot}
    \titlespacing{\paragraph}{\parindent}{3.25ex plus 1ex minus .2ex}{0pt}[1em]
}

\newcommand{\jdecimalheadings}{%
    %--- Justified Decimal System (Default) ---
    \titleformat{\chapter}[display]{\normalfont\centering\bfseries\normalsize}{\chaptername\ \thechapter}{-3pt}{\MakeUppercase}
    \titlespacing{\chapter}{0pt}{0pt}{15pt}
    \titleformat{\section}{\normalfont\bfseries}{\thesection}{1.5ex}{\MakeTextUppercase}
    \titlespacing{\section}{0pt}{1.5ex plus .2ex minus 0pt}{.3ex plus .2ex}
    \titleformat{\subsection}{\normalfont\bfseries}{\thesubsection}{0.3ex}{}
    \titlespacing{\subsection}{1.5em}{0.3ex plus .2ex minus 0pt}{.2ex plus .1ex}
    \titleformat{\subsubsection}{\normalfont\bfseries}{\thesubsubsection}{0.2ex}{}
    \titlespacing{\subsubsection}{3.8em}{0.2ex plus .1ex minus 0pt}{0.2ex plus .1ex}
    \titleformat{\paragraph}{\normalfont\bfseries}{\theparagraph}{0pt}{}
    \titlespacing{\paragraph}{7.0em}{3.25ex plus 1ex minus .2ex}{3.25ex plus 1ex minus .2ex}
    \titleformat{\subparagraph}{\normalfont\hspace{1.5em}}{\thesubparagraph}{0pt}{\addul}
    \titlespacing{\subparagraph}{7.0em}{3.25ex plus 1ex minus .2ex}{3.25ex plus 1ex minus .2ex}
}

%%% ------------------------------------------------------------------
%%% -------------------------------------------------------------------

\typeout{=== Checking HeadingStyle Flag ===}

\ifdefined\HeadingStyle
  \typeout{--- Using \string\csname to execute style \HeadingStyle ---}
  \csname\HeadingStyle headings\endcsname
\else
  \typeout{--- No HeadingStyle option was selected. ---}
\fi

\typeout{=== Finished HeadingStyle Check ===}
%%% ------------------------------------------------------------------
%%% -------------------------------------------------------------------

%%% -------------------------------------------------------------------

\renewcommand{\cftchapfont}{\normalfont\bfseries}
\renewcommand{\cftchappagefont}{\normalfont}
\renewcommand{\cftloftitlefont}{\normalfont\bfseries}

\newenvironment{thesislist}[1]{%
    \chapter*{\listname\ #1}
    \addcontentsline{toc}{chapter}{{\texorpdfstring{\MakeTextUppercase{\listname\ #1}}{\listname\ #1}}}
    \begingroup
}{\par\endgroup}

%% Define Leader Dots
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftsubsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftfigleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cfttableader}{\cftdotfill{\cftdotsep}}
\renewcommand{\contentsname}{Table of Contents}

\setlength{\cftsecindent}{1.5em}
\setlength{\cftsecnumwidth}{2em}

%% TODO: what is bibalign??
\newcommand{\bibalign}{}

%%% ------------------------------------------------------------------
%%% -------------------------------------------------------------------

\pretitle{
    \begin{center}

    \bfseries\MakeTextUppercase
}
\posttitle{
    \end{center}
}

\preauthor{
    \begin{center}
    By \\
    \MakeUppercase
}
\postauthor{
    \\
    \@degreesheld
    \end{center}
}

\renewcommand{\maketitlehooka}{
    \thispagestyle{empty}
    \ifverybigtitlepage
        \onehalfspacing
    \else
        \doublespacing
    \fi
}
\renewcommand{\maketitlehookd}{
    \begin{center}
        A \MakeTextUppercase{\@type}\\[4pt]
        Submitted in Partial Fulfillment of the\\
        Requirements for the Degree of\\
        \expandafter{\@degree}\\
        (in \expandafter{\@program})\\
        \vskip 0.5in
        The Graduate School\\
        The University of Maine\\
        \expandafter{\@submitdate}
        \vfill
    \end{center}
    \ifbigtitlepage
        \singlespacing
    \fi
    \begin{flushleft}
    Advisory Committee:
    \begin{list}{}{%
        \setlength{\itemsep}{0pt}%
        \setlength{\topsep}{0in}%
        \setlength{\partopsep}{0pt}%
        \setlength{\itemindent}{-\parindent}%
        \setlength{\leftmargin}{1cm}%
    }
        % Check if the principal advisor is defined before printing
        \ifx\@principaladvisor\empty\else
            \item{\@principaladvisor, %
                \ifnum\numadv=2%
                    Co-%
                \fi%
                Advisor}
        \fi
        % Check for second advisor before printing
        \ifx\@secondadvisor\empty\else
            \item{\@secondadvisor, Co-Advisor}
        \fi
        % Check for each reader before printing
        \ifx\@firstreader\empty\else
            \item{\@firstreader}
        \fi
        \ifx\@secondreader\empty\else
            \item{\@secondreader}
        \fi
        \ifx\@thirdreader\empty\else
            \item{\@thirdreader}
        \fi
        \ifx\@fourthreader\empty\else
            \item{\@fourthreader}
        \fi
        \ifx\@fifthreader\empty\else
            \item{\@fifthreader}
        \fi
    \end{list}
    \end{flushleft}
    \clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abstract             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcounter{mt@page}
\renewenvironment{abstract}{%
    \doublespacing
    \begin{center}
        {\bfseries\MakeTextUppercase{\@title}}\\
        By\space\@author\\[4pt]
        \@type\ %
        \ifnum\numadv=2%
            Co-Advisors: \@principalshort and \@secondadvisor
        \else
            Advisor: \@principalshort
        \fi
        \vskip 0.33in
        \singlespacing
        An Abstract of the \@type\ Presented\\
        in Partial Fulfillment of the Requirements for the\\
        Degree of \@degree\\
        (in \@program)\\
        \@submitdate
        \vskip 36pt plus 2pt minus 12pt
    \end{center}
    \doublespacing
    \begingroup\par
    \pagestyle{empty}
}
{\cleardoublepage
    \par\endgroup
}

\newenvironment{layabstract}[1]{%
    \doublespacing
    \begin{center}
        {\bfseries\MakeTextUppercase{\@title}}\\
        By\space\@author\\[4pt]
        \@type\ %
        \ifnum\numadv=2%
            Co-%
        \fi%
        Advisor%
        \ifnum\numadv=2%
            s%
        \fi%
        : \@principalshort
        \vskip 0.33in
        \singlespacing
        A Lay Abstract of the \@type\ Presented\\
        in Partial Fulfillment of the Requirements for the\\
        Degree of \@degree\\
        (in \@program)\\
        \@submitdate
        \vskip 26pt plus 2pt minus 12pt
    \end{center}
    Keywords: \MakeLowercase{#1}
    \vskip 26pt plus 2pt minus 12pt
    \doublespacing
    \begingroup\par
    \pagestyle{empty}
}
{\cleardoublepage
    \par\endgroup
}%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Acknowledgements     %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{acknowledgements}{%
    \chapter*{\acknowledgename}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\acknowledgename}}{\acknowledgename}}
    \doublespacing
    \begingroup
}{\par\endgroup}

\newenvironment{landacknowledgements}{%
    \chapter*{\landacknowledgename}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\landacknowledgename}}{\landacknowledgename}}
    \doublespacing
    \begingroup
}{\par\endgroup}

\newcommand{\glsa}{%
     \chapter*{UNIVERSITY OF MAINE GRADUATE SCHOOL LAND ACKNOWLEDGMENT}
     The University of Maine recognizes that it is located on Marsh Island in the homeland of Penobscot people, where issues of water and territorial rights, and encroachment upon sacred sites, are ongoing. Penobscot homeland is connected to the other Wabanaki Tribal Nations— the Passamaquoddy, Maliseet, and Micmac—through kinship, alliances, and diplomacy. The University also recognizes that the Penobscot Nation and the other Wabanaki Tribal Nations are distinct, sovereign, legal and political entities with their own powers of self-governance and self-determination.
     \vfill
     \clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Appendix             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\appendix}{%
    \cleardoublepage
    \doublespacing
    \setcounter{tocdepth}{1} % Sets the ToC depth to chapters and above
    \setcounter{secnumdepth}{1} % Sets the section numbering depth to chapters and above
    \setcounter{chapter}{0}
    \apptrue
    \gdef\chaptername{Appendix} % This changes the name globally
    \gdef\thechapter{\@Alph\c@chapter}% Changes the numbering globally
    \ifmultipleappendices%
        \cftaddtitleline{toc}{chapter}{\texorpdfstring{\MakeUppercase{Appendices}}{Appendices}}
    \fi
}

\pretocmd{\chapter}{\ifapp\renewcommand*\chaptername{Appendix}\fi}{}{}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Biography             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{biography}{%
    \chapter*{\bioname}
    \addtocontents{toc}{\protect\nopagebreak}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\bioname}}{\bioname}}
    \begingroup
    \doublespacing
    \thispagestyle{plain}
}{%
    \par
    \ifx\@authorpronoun\empty
        \@author
    \else
        \@authorpronoun
    \fi%
    \ is a candidate for the \@degree\ degree in \@program\ from the University of Maine in \@submitdate.\par\endgroup
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Copyrgiht             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\copyrightpage}{%
    \setcounter{page}{3} % we must manually set the copyright page because of the runtime call of preliminary.
    \copyrightpagetrue
    \onehalfspacing
    \thispagestyle{plain}
    \hbox{ }
    \vfill
    \begin{center}
    \copyright \the\year{} \space \@author\\
    All Rights Reserved
    \end{center}
    \vfill
    \clearpage
}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedication             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{dedication}{%
    \chapter*{\dedicationname}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\dedicationname}}{\dedicationname}}
    \vskip 0.5in
    \doublespacing
    \begingroup
    \begin{center}
}{\end{center}\par\endgroup}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Preface             %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newenvironment{preface}{%
    \chapter*{\prefacename}
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\prefacename}}{\prefacename}}
    \doublespacing
    \begingroup\setcounter{secnumdepth}{0}
}{\setcounter{secnumdepth}{\value{secnumdefault}}\par\endgroup}
%%%%%%%%%%%%%%%%%%%%%%%%%%
%% References           %%
%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\references}{%
    \cleardoublepage
    \singlespacing
    \phantomsection
    \addcontentsline{toc}{chapter}{\texorpdfstring{\MakeTextUppercase{\bibname}}{\bibname}}
    \printbibliography
}
%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%

\newcommand{\preliminary}{%
    \pagenumbering{roman}
    \setcounter{tocdepth}{1} % Sets the ToC depth to chapters and above
    \setcounter{secnumdepth}{1} % Sets the section numbering depth to chapters and above
}

\newcommand{\mainmatter}{%
    \cleardoublepage
    \doublespacing
    \pagenumbering{arabic}
    \setcounter{tocdepth}{\value{secnumdefault}}
    \setcounter{secnumdepth}{\value{secnumdefault}}
}

%%% ------------------------------------------------------------------
%%% -------------------------------------------------------------------

\newcommand{\libraryrights}{%
    \ClassError{maine-thesis}{The Graduate School no longer requires\MessageBreak a Library Rights Statement page}{Please remove \protect\libraryrights\space from your thesis.}%
  }

\newcommand{\dissacceptance}{%
    \ClassError{maine-thesis}{The Graduate School no longer requires\MessageBreak a Dissertation Acceptance page}{Please remove \protect\dissacceptance\space from your thesis.}%
}

\endinput
%%
%% End of file `maine-thesis.cls'.
