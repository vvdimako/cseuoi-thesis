\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cseuoi-thesis}[2015/09/11 v1.0.0 Official MSc and PhD (Xe)LaTeX thesis template for the CSE Department, University of Ioannina]

% Ελληνικά ή αγγλικά
\newif\ifgreek
\DeclareOption{English}{\greekfalse}
\DeclareOption{Greek}{\greektrue}

% Master ή PhD
\newif\ifPhD
\DeclareOption{Master}{\PhDfalse}
\DeclareOption{PhD}{\PhDtrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}

% Από default Ελληνικά και PhD
\ExecuteOptions{Greek,PhD}

\ProcessOptions\relax

\LoadClass[a4paper,oneside]{report}

% Περιθώρια σελίδας
\RequirePackage[nohead, top=2.5cm, bottom=3cm, left=2.5cm, right=2.5cm]{geometry}

% Πακέτα για Ελληνικά
\RequirePackage{fontspec}
\RequirePackage[noindentfirst]{xgreek}

% Αυτόματη αλλαγή ελληνικού αγγλικού hyphenation
% http://www.mechpedia.gr/wiki/Hyphenation_-_%CE%A5%CF%86%CE%B5%CE%BD%CF%8E%CF%83%CE%B5%CE%B9%CF%82#xgreek_3
\RequirePackage[Greek,Latin]{ucharclasses}
\setTransitionsForGreek{\setlanguage{monogreek}}{\setlanguage{english}}

% Packages for figures
\RequirePackage{caption}
\RequirePackage{subcaption}

% Use Latin numerals instead of Greek numerals
\nogreekalph

\ifgreek
	\newcommand{\cseafierwsi}{Αφιέρωση}
	\newcommand{\cseeuxaristies}{Ευχαριστίες}
	\newcommand{\csesymvolismoi}{Επεξηγήσεις Συμβολισμών}
	\newcommand{\csedimosieuseis}{Δημοσιεύσεις}
	\newcommand{\cseviografiko}{Βιογραφικό}
	\newcommand{\cseparartima}{Παράρτημα}

	% xgreek
	%\renewcommand{\chaptername}{Κεφάλαιο}
	%\renewcommand{\abstractname}{Περίληψη}
	\renewcommand{\listfigurename}{Ευρετήριο Σχημάτων}
	\renewcommand{\listtablename}{Ευρετήριο Πινάκων}
	%\renewcommand{\bibname}{Βιβλιογραφία}
	%\renewcommand{\figurename}{Σχήμα}
	%\renewcommand{\tablename}{Πίνακας}
	%\renewcommand{\indexname}{Ευρετήριο}
	%\renewcommand{\contentsname}{Περιεχόμενα}
	%\floatname{algorithm}{Αλγόριθμος}

	\iffalse
		% amsthm
		\theoremstyle{plain}   % definition, remark
		\newtheorem{theorem}{Θεώρημα}[chapter]

		\theoremstyle{plain}   % definition, remark
		\newtheorem{lemma}{Λήμμα}[chapter]

		\theoremstyle{plain}   % definition, remark
		\newtheorem{corollary}{Πόρισμα}[chapter]

		\theoremstyle{plain}   % definition, remark
		\newtheorem{fact}{Γεγονός}[chapter]

		\theoremstyle{definition}  % definition, remark
		\newtheorem{remark}{Σημείωση}[chapter]

		\theoremstyle{definition}  % definition, remark
		\newtheorem{definition}{Ορισμός}[chapter]

		\theoremstyle{plain}  % definition, remark
		\newtheorem{observation}{Παρατήρηση}[chapter]
	\fi
\else
	\newcommand{\cseafierwsi}{Dedication}
	\newcommand{\cseeuxaristies}{Acknowledgements}
	\newcommand{\csesymvolismoi}{Glossary}
	\newcommand{\csedimosieuseis}{Author's Publications}
	\newcommand{\cseviografiko}{Short Vita}
	\newcommand{\cseparartima}{Appendix}

	% xgreek
	\renewcommand{\chaptername}{Chapter}
	\renewcommand{\abstractname}{Abstract}
	\renewcommand{\listfigurename}{List of Figures}
	\renewcommand{\listtablename}{List of Tables}
	\renewcommand{\bibname}{Bibliography}
	\renewcommand{\figurename}{Figure}
	\renewcommand{\tablename}{Table}
	\renewcommand{\indexname}{Index}
	\renewcommand{\contentsname}{Table of Contents}
	%\floatname{algorithm}{Algorithm}

	\iffalse
		% amsthm
		\theoremstyle{plain}   % definition, remark
		\newtheorem{theorem}{Theorem}[chapter]

		\theoremstyle{plain}   % definition, remark
		\newtheorem{lemma}{Lemma}[chapter]

		\theoremstyle{plain}   % definition, remark
		\newtheorem{corollary}{Corollary}[chapter]


		\theoremstyle{plain}   % definition, remark
		\newtheorem{fact}{Fact}[chapter]

		\theoremstyle{definition}  % definition, remark
		\newtheorem{remark}{Note}[chapter]

		\theoremstyle{definition}  % definition, remark
		\newtheorem{definition}{Definition}[chapter]

		\theoremstyle{plain}  % definition, remark
		\newtheorem{observation}{Observation}[chapter]
	\fi
\fi

\ifPhD
	\newcommand{\csethesisTypeEl}{ΔΙΔΑΚΤΟΡΙΚΗ ΔΙΑΤΡΙΒΗ}
	\newcommand{\csediplwmaEl}{ΔΙΔΑΚΤΟΡΙΚΟΥ ΔΙΠΛΩΜΑΤΟΣ}
	\newcommand{\csethesisTypeEn}{PhD DISSERTATION}
	\newcommand{\csediplwmaEn}{PhD} % TODO
\else
	\newcommand{\csethesisTypeEl}{ΜΕΤΑΠΤΥΧΙΑΚΗ ΕΡΓΑΣΙΑ ΕΞΕΙΔΙΚΕΥΣΗΣ}
	\newcommand{\csediplwmaEl}{ΜΕΤΑΠΤΥΧΙΑΚΟΥ ΔΙΠΛΩΜΑΤΟΣ ΕΙΔΙΚΕΥΣΗΣ}
	\newcommand{\csethesisTypeEn}{MASTER THESIS}
	\newcommand{\csediplwmaEn}{MASTER OF SCIENCE}
\fi

% Διάστιχο 
\renewcommand{\baselinestretch}{1.3}

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
