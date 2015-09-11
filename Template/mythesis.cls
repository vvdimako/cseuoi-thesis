% This is an example of how to modify the style of your
% thesis.  Check the guidelines for your school/university
% on the required format for a PhD thesis.

% First identify the class:

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mythesis}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

\ProcessOptions

\LoadClass[12pt,a4paper,oneside]{report}

\RequirePackage[nohead, top=2.5cm, bottom=3cm, left=2.5cm, right=2.5cm]{geometry}
\RequirePackage[cm-default]{fontspec}
\RequirePackage{xunicode}
\RequirePackage{xltxtra}
\RequirePackage[noindentfirst]{xgreek}

\setmainfont[Mapping=tex-text]{GFS Didot}
\setsansfont[Mapping=tex-text]{DejaVuSans}
\setmonofont[Mapping=tex-text]{FreeMono}

%\newcommand{\ps@mythesis}{
%    \renewcommand{\@oddhead}{\hfill \chaptername \thechapter}
%    \renewcommand{\@evenhead}{\chaptername \thechapter \hfill}
%    \renewcommand{\@oddfoot}{\hfill - \thepage\ - \hfill}
%    \renewcommand{\@evenfoot}{\hfill - \thepage\ - \hfill}
%}





% Redefining the \section command:

\renewcommand{\section}{\@startsection
{section}%                   % the name
{1}%                         % the level
{0mm}%                       % the indent
{-2\baselineskip}%            % the before skip
{0.5\baselineskip}%          % the after skip
{\normalfont\large\bf}} % the style

% Redefining the chapter heading styles

% Numbered chapter heading style:

\renewcommand{\@makechapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    %\hrule                                           % horizontal line
    \vspace{5pt}%                                    % add some vertical space
    \ifnum \c@secnumdepth >\m@ne
        \huge\scshape \leftline{\@chapapp\space \thechapter}    % Chapter followed by number
        \par\nobreak
        \vskip 20\p@
    \fi
    \interlinepenalty\@M
    \Huge \scshape \begin{flushright}#1\end{flushright}\par                            % chapter title
    \vspace{5pt}%                                    % add some vertical space
    %\hrule                                           % horizontal rule
    \nobreak
    \vskip 40\p@
  }}

% Unnumbered chapter heading style:

\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    %\hrule                                           % horizontal line
    \vspace{5pt}%                                    % add some vertical space
    \interlinepenalty\@M
    \Huge \scshape #1\par                            % chapter title
    \vspace{5pt}%                                    % add some vertical space
    \hrule                                           % horizontal line
    \nobreak
    \vskip 40\p@
  }}

% end of file:
\endinput
