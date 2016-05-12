\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cseuoi-thesis}[2016/03/02 v2.0 Official MSc and PhD (Xe)LaTeX thesis template for the CSE Department, University of Ioannina]

% Ελληνικά ή Αγγλικά
\newif\ifgreek
\DeclareOption{en}{\greekfalse}
\DeclareOption{gr}{\greektrue}

% Διδακτορικό ή Μεταπτυχιακό
\newif\ifPhD
\DeclareOption{msc}{\PhDfalse}
\DeclareOption{phd}{\PhDtrue}

% Εξειδίκευση (μόνο για Μεταπτυχιακό)
\newcommand{\ekseidikseusiGr}{\colorbox{gray}{ΣΤΑ ΥΠΟΛΟΓΙΣΤΙΚΑ ΣΥΣΤΗΜΑΤΑ}}
\newcommand{\ekseidikseusiEn}{\colorbox{gray}{IN COMPUTER SYSTEMS}}

\DeclareOption{systems}{
	\renewcommand{\ekseidikseusiGr}{ΣΤΑ ΥΠΟΛΟΓΙΣΤΙΚΑ ΣΥΣΤΗΜΑΤΑ}
	\renewcommand{\ekseidikseusiEn}{IN COMPUTER SYSTEMS}
}
\DeclareOption{theory}{
	\renewcommand{\ekseidikseusiGr}{ΣΤΗ ΘΕΩΡΙΑ ΕΠΙΣΤΗΜΗΣ ΥΠΟΛΟΓΙΣΤΩΝ}
	\renewcommand{\ekseidikseusiEn}{IN COMPUTER SCIENCE THEORY}
}
\DeclareOption{software}{
	\renewcommand{\ekseidikseusiGr}{ΣΤΟ ΛΟΓΙΣΜΙΚΟ}
	\renewcommand{\ekseidikseusiEn}{IN SOFTWARE}
}
\DeclareOption{scicomp}{
	\renewcommand{\ekseidikseusiGr}{ΣΤΟΥΣ ΕΠΙΣΤΗΜΟΝΙΚΟΥΣ ΥΠΟΛΟΓΙΣΜΟΥΣ}
	\renewcommand{\ekseidikseusiEn}{IN SCIENTIFIC COMPUTING}
}
\DeclareOption{techapps}{
	\renewcommand{\ekseidikseusiGr}{ΣΤΙΣ ΤΕΧΝΟΛΟΓΙΕΣ - ΕΦΑΡΜΟΓΕΣ}
	\renewcommand{\ekseidikseusiEn}{IN TECHNOLOGIES - APPLICATIONS}
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% Ορίζουμε ως προεπιλογή Ελληνικά και Διδακτορικό
\ExecuteOptions{gr,phd}

\ProcessOptions\relax

\LoadClass[a4paper,oneside,12pt]{book}

% Διαμόρφωση της κεφαλίδας και του υποσέλιδου
\RequirePackage{fancyhdr}
\pagestyle{plain}
\fancyhf{}

% Περιθώρια σελίδας
\RequirePackage[nohead, top=2.5cm, bottom=3cm, left=2.5cm, right=2.5cm, marginparwidth=2.4cm, marginparsep=0.5mm]{geometry}

% Πακέτα για Ελληνικά
\RequirePackage{fontspec}
\RequirePackage[noindentfirst,nonumeralsign]{xgreek}

% Αυτόματη αλλαγή ελληνικού αγγλικού hyphenation
% http://www.mechpedia.gr/wiki/Hyphenation_-_%CE%A5%CF%86%CE%B5%CE%BD%CF%8E%CF%83%CE%B5%CE%B9%CF%82#xgreek_3
\RequirePackage[Greek,Latin]{ucharclasses}
\setTransitionsForGreek{\setlanguage{monogreek}}{\setlanguage{english}}

% Γραμματοσειρές
\setmainfont[Mapping=tex-text]{GFS Didot}
\setsansfont{DejaVuSans}
\setmonofont[Path = Font/,
	UprightFont    = *-R,
	BoldFont       = *-B,
	ItalicFont     = *-RI,
	BoldItalicFont = *-BI,
	Scale          = 0.95
]{UbuntuMono}

% Eλάχιστη απόσταση μεταξύ δύο γραμμών
\renewcommand{\baselinestretch}{1.4}

% Πακέτο για χρωματισμό
\RequirePackage[usenames]{xcolor}

% Πακέτα για σχήματα
\RequirePackage{caption}
\RequirePackage{subcaption}

% Πακέτα για ευρετήριο όρων
\RequirePackage[unbalanced]{idxlayout}
\RequirePackage[original]{imakeidx}
\makeindex[intoc]

% Πακέτα για Μαθηματικά
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{latexsym}
\RequirePackage{mathtools}

% Πακέτα για αλγορίθμους
\RequirePackage{algorithmic}
\RequirePackage[chapter]{algorithm}

% Πακέτο για τη δημιουργία hyperlinks
\RequirePackage{hyperref}

% Δημιουργία μίνι ευρετηρίου στην αρχή κάθε κεφάλαιου
\RequirePackage[nohints]{minitoc}
\setcounter{minitocdepth}{1}
\setlength{\mtcindent}{-10pt}
%\mtcsettitle{minitoc}{Description of contents}
\nomtcpagenumbers  % remove page numbers from minitocs
\newcommand{\addstarredchapterc}[1]{\cleardoublepage\phantomsection\addstarredchapter{#1}}
\renewcommand{\afterminitoc}{\hrule width\textwidth\@afterindentfalse\@afterheading} % fix identation of first paragraph
\nomtcrule
\let\origminitoc\minitoc
\renewcommand{\minitoc}{\hrule width\textwidth\origminitoc\vspace{2\baselineskip}}


\ifgreek
	\newcommand{\cseafierwsi}{Αφιέρωση}
	\newcommand{\cseeuxaristies}{Ευχαριστίες}
	\newcommand{\csedimosieuseis}{Δημοσιεύσεις Συγγραφέα}
	\newcommand{\cseviografiko}{Σύντομο Βιογραφικό}
	\newcommand{\cseparartima}{Παράρτημα}

	% Σελίδα περίληψης
	\newcommand{\cseabstractdpt}{Τμήμα Μηχανικών Η/Υ και Πληροφορικής, Πανεπιστήμιο Ιωαννίνων}
	\newcommand{\cseabstractsup}{Επιβλέπων}
	\newcommand{\cseabstractcs}{στην Πληροφορική}
	\ifPhD
		\newcommand{\cseabstracttype}{Δ.Δ.}
		\newcommand{\cseextabstracttype}{Ph.D.}
	\else
		\newcommand{\cseabstracttype}{Μ.Δ.Ε.}
		\newcommand{\cseextabstracttype}{M.Sc.}
	\fi
	\newcommand{\cseextabstract}{Extended Abstract}
	\newcommand{\cseextabstractcs}{in Computer Science}
	\newcommand{\cseextabstractsup}{Advisor}
	\newcommand{\cseextabstractdpt}{Department of Computer Science and Engineering, University of Ioannina, Greece}

	% xgreek
	%\renewcommand{\chaptername}{Κεφάλαιο}
	%\renewcommand{\abstractname}{Περίληψη}
	\renewcommand{\listfigurename}{Κατάλογος Σχημάτων}
	\renewcommand{\listtablename}{Κατάλογος Πινάκων}
	\renewcommand{\listalgorithmname}{Κατάλογος Αλγορίθμων}
	%\renewcommand{\glossaryname}{Επεξηγήσεις Συμβολισμών}
	%\renewcommand{\bibname}{Βιβλιογραφία}
	%\renewcommand{\figurename}{Σχήμα}
	%\renewcommand{\tablename}{Πίνακας}
	%\renewcommand{\indexname}{Ευρετήριο}
	%\renewcommand{\contentsname}{Περιεχόμενα}
	%\renewcommand{\appendixname}{Παράρτημα}
	\floatname{algorithm}{Αλγόριθμος}

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
\else
	% Αρχικοποίηση της γλώσσας του hyphenation
	\setlanguage{english}

	% Use Latin numerals instead of Greek numerals
	\nogreekalph

	\newcommand{\cseafierwsi}{Dedication}
	\newcommand{\cseeuxaristies}{Acknowledgements}
	\newcommand{\csedimosieuseis}{Author's Publications}
	\newcommand{\cseviografiko}{Short Biography}
	\newcommand{\cseparartima}{Appendix}

	% Σελίδα περίληψης
	\newcommand{\cseabstractdpt}{Department of Computer Science and Engineering, University of Ioannina, Greece}
	\newcommand{\cseabstractsup}{Advisor}
	\newcommand{\cseabstractcs}{in Computer Science}
	\ifPhD
		\newcommand{\cseabstracttype}{Ph.D.}
		\newcommand{\cseextabstracttype}{Δ.Δ.}
	\else
		\newcommand{\cseabstracttype}{M.Sc.}
		\newcommand{\cseextabstracttype}{Μ.Δ.Ε.}
	\fi
	\newcommand{\cseextabstract}{Εκτεταμένη Περίληψη}
	\newcommand{\cseextabstractcs}{στην Πληροφορική}
	\newcommand{\cseextabstractsup}{Επιβλέπων}
	\newcommand{\cseextabstractdpt}{Τμήμα Μηχανικών Η/Υ και Πληροφορικής, Πανεπιστήμιο Ιωαννίνων}

	% xgreek
	\renewcommand{\chaptername}{Chapter}
	\renewcommand{\abstractname}{Abstract}
	\renewcommand{\listfigurename}{List of Figures}
	\renewcommand{\listtablename}{List of Tables}
	\renewcommand{\listalgorithmname}{List of Algorithms}
	\renewcommand{\glossaryname}{Glossary}
	\renewcommand{\bibname}{Bibliography}
	\renewcommand{\figurename}{Figure}
	\renewcommand{\tablename}{Table}
	\renewcommand{\indexname}{Index}
	\renewcommand{\contentsname}{Table of Contents}
	\renewcommand{\appendixname}{Appendix}
	\floatname{algorithm}{Algorithm}

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

\ifPhD
	\newcommand{\csethesisTypeGr}{Διδακτορική Διατριβή}
	\newcommand{\csediplwmaGr}{Διδακτορικού Διπλώματος}
	\newcommand{\csethesisTypeEn}{Dissertation}
	\newcommand{\csediplwmaEn}{Doctor of Philosophy}
\else
	\newcommand{\csethesisTypeGr}{Μεταπτυχιακή Εργασία Εξειδίκευσης}
	\newcommand{\csediplwmaGr}{Μεταπτυχιακού Διπλώματος Ειδίκευσης}
	\newcommand{\csethesisTypeEn}{Thesis}
	\newcommand{\csediplwmaEn}{Master of Science}
\fi

\newcommand{\titleGr}[1]{\def\@titleGr{#1}}
\newcommand{\titleEn}[1]{\def\@titleEn{#1}}
\newcommand{\authorGr}[1]{\def\@authorGr{#1}}
\newcommand{\authorEn}[1]{\def\@authorEn{#1}}
\newcommand{\arthro}[1]{\def\@arthro{#1}}
\newcommand{\aitiatiki}[1]{\def\@aitiatiki{#1}}
\newcommand{\dateGr}[1]{\def\@dateGr{#1}}
\newcommand{\dateEn}[1]{\def\@dateEn{#1}}
\newcommand{\advisorGr}[1]{\def\@advisorGr{#1}}
\newcommand{\advisorEn}[1]{\def\@advisorEn{#1}}

\ifgreek
	\title{\@titleGr}
	\author{\@authorGr}
	\date{\@dateGr}
	\newcommand{\advisor}{\@advisorGr}
	\newcommand{\csethesisType}{\csethesisTypeGr}
	\newcommand{\ekseidikseusi}{\ekseidikseusiGr}
	\newcommand{\titleBilingual}{\@titleEn}
	\newcommand{\authorBilingual}{\@authorEn}
	\newcommand{\dateBilingual}{\@dateEn}
	\newcommand{\advisorBilingual}{\@advisorEn}
	\newcommand{\csethesisTypeBilingual}{\csethesisTypeEn}
	\newcommand{\ekseidikseusiBilingual}{\ekseidikseusiEn}
\else
	\title{\@titleEn}
	\author{\@authorEn}
	\date{\@dateEn}
	\newcommand{\advisor}{\@advisorEn}
	\newcommand{\csethesisType}{\csethesisTypeEn}
	\newcommand{\ekseidikseusi}{\ekseidikseusiEn}
	\newcommand{\titleBilingual}{\@titleGr}
	\newcommand{\authorBilingual}{\@authorGr}
	\newcommand{\dateBilingual}{\@dateGr}
	\newcommand{\advisorBilingual}{\@advisorGr}
	\newcommand{\csethesisTypeBilingual}{\csethesisTypeGr}
	\newcommand{\ekseidikseusiBilingual}{\ekseidikseusiGr}
\fi


% Δημιουργία της σελίδας τίτλου
\renewcommand{\maketitle}{
	% Ρύθμιση του πακέτου hyperref
	\hypersetup{
		pdftitle={\@title},
		pdfauthor={\@author},
		pdfsubject={\csethesisType},
		pdfborder={0 0 0.5},
		linkbordercolor={0.9 0.9 0.9},
		citebordercolor={0.9 0.9 0.9},
		urlbordercolor={0.9 0.9 0.9}
	}
	\begin{center}
		\ifgreek
			\makegreektitle
		\else
			\makeenglishtitle
		\fi
	\end{center}
}


% Δημιουργία της σελίδας τίτλου στα Ελληνικά
\newcommand{\makegreektitle}{
    \makeatletter

    {\LARGE \@titleGr}

    {\Large
        \vfill \vfill   Η \csethesisTypeGr

        \vfill          υποβάλλεται στην ορισθείσα

                        από τη Γενική Συνέλευση Ειδικής Σύνθεσης

                        του Τμήματος Μηχανικών Η/Υ και Πληροφορικής

                        Εξεταστική Επιτροπή

        \vfill          από \@arthro

        \vfill          {\LARGE \@aitiatiki}

        \vfill          ως μέρος των υποχρεώσεων για την απόκτηση του

        \vfill          \MakeUppercase{\csediplwmaGr}

        \ifPhD\else     ΣΤΗΝ ΠΛΗΡΟΦΟΡΙΚΗ

        \vspace{1em}    ΜΕ ΕΞΕΙΔΙΚΕΥΣΗ

                        \ekseidikseusiGr
        \fi

        \vfill \vfill   Πανεπιστήμιο Ιωαννίνων
       
                        \@dateGr\par
    }

    \makeatother
    \clearpage
}


% Δημιουργία της σελίδας τίτλου στα Αγγλικά
\newcommand{\makeenglishtitle}{
    \makeatletter

    {\LARGE \@titleEn}

    {\Large
        \vfill \vfill   A \csethesisTypeEn

        \vfill          submitted to the designated

                        by the General Assembly of Special Composition

                        of the Department of Computer Science and Engineering

                        Examination Committee

        \vfill          by

        \vfill          {\LARGE \@authorEn}

        \vfill          in partial fulfillment of the requirements for the degree of

        \vfill          \MakeUppercase{\csediplwmaEn}\ifPhD\else\ IN COMPUTER SCIENCE

        \vspace{1em}    WITH SPECIALIZATION

                        \ekseidikseusiEn
        \fi

        \vfill \vfill   University of Ioannina
        
                        \@dateEn\par
    }

    \makeatother
    \clearpage
}


% Δημιουργία της κεφαλίδας για την περίληψη
\newcommand{\makecseabstract}{
	\makeatletter
	\@author, \cseabstracttype\ifPhD\else\ \cseabstractcs\fi, \cseabstractdpt, \@date.\\
	\@title.\\
	\cseabstractsup: \advisor.
	\makeatother

	\bigskip
	\bigskip
}


% Δημιουργία της κεφαλίδας για την εκτεταμένη περίληψη
\newcommand{\makecseextabstract}{
	\makeatletter
	\authorBilingual, \cseextabstracttype\ifPhD\else\ \cseextabstractcs\fi, \cseextabstractdpt, \dateBilingual.\\
	\titleBilingual.\\
	\cseextabstractsup: \advisorBilingual.
	\makeatother

	\bigskip
	\bigskip
}




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
  }
  \minitoc
}

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
