%
% Classe base para monografias, dissertações e teses usando parcialmente as regras da Associação Brasileira de Normas Técnicas (ABNT).
%
% Criado por Alvaro Costa Neto em 28 de junho de 2021.
% Para ser usado com os drivers XeLaTeX e Biber.
% Licença [CC BY-NC-SA](https://creativecommons.org/licenses/by-nc-sa/4.0/).
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{basicthesis}[2021/06/25 Basic ABNT thesis class]

\DeclareOption{draft}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{oneside}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{book}}
\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{book}}
% Usar somente fonte serifada.
\DeclareOption{sanstitles}{\def\sanstitles}
% Opções de fontes (configuradas adiante).
\DeclareOption{libertinus}{\def\libertinus}
\DeclareOption{termes}{\def\termes}
\DeclareOption{schola}{\def\schola}
\DeclareOption{pagella}{\def\pagella}
\DeclareOption{bonum}{\def\bonum}
\DeclareOption{dejavu}{\def\dejavu}
\DeclareOption{stix}{\def\stix}
\DeclareOption{garamond}{\def\garamond}
\DeclareOption{erewhon}{\def\erewhon}
\DeclareOption{source}{\def\source}
\DeclareOption{plex}{\def\plex}
% Suprime as demais opções.
\DeclareOption*{\OptionNotUsed}
\ProcessOptions\relax
\LoadClass[a4paper, onecolumn, titlepage, openright]{book}

\RequirePackage{unicode-math}
\RequirePackage{polyglossia}
\RequirePackage{titlesec}
\RequirePackage[labelfont={bf}, position=above]{caption}
\RequirePackage[style=portuguese, portuguese=brazilian]{csquotes}
\RequirePackage[backend=biber, style=abnt, sorting=nyt]{biblatex}
\RequirePackage{booktabs}

% Língua principal.
\setdefaultlanguage{brazil}
% Língua secundária (inglês, ao menos para o "abstract").
\setotherlanguages{english}

% Possibilidades de fontes sem serifa:
% - Bebas Neue;
% - Fira Sans;
% - IBM Plex Sans Condensed (sem versalete);
% - Inria Sans (sem versalete);
% - League Spartan (sem versalete);
% - Libertinus Sans;
% - Montserrat;
% - Noto Sans;
% - Open Sans (sem versalete, identidade visual do IFSP);
% - Overlock (versalete sem negrito);
% - PT Sans (sem versalete);
% - PT Sans Narrow (sem versalete);
% - QTEurotype (sem versalete);
% - QTHelvetCnd (sem versalete);
% - QTLetterGoth (sem versalete);
% - Roboto Condensed;
% - Source Sans Pro;
% - Taogu (sem versalete);
% - TeX Gyre Heros Cn;
% - Ubuntu (sem versalete);

\setmainfont{Latin Modern Roman}[SmallCapsFont={Latin Modern Roman Caps}]
\setmathfont{Latin Modern Math}
\setsansfont{Latin Modern Sans}
\setmonofont{Latin Modern Mono}[Scale=MatchLowercase]
\ifdefined\libertinus
    \setmainfont{Libertinus Serif}
    \setmathfont{Libertinus Math}
    \setsansfont{Libertinus Sans}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\termes
    \setmainfont{TeX Gyre Termes}
    \setmathfont{TeX Gyre Termes Math}
    \setsansfont{QTHelvetCnd}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\schola
    \setmainfont{TeX Gyre Schola}
    \setmathfont{TeX Gyre Schola Math}
    \setsansfont{Inria Sans}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\pagella
    \setmainfont{TeX Gyre Pagella}
    \setmathfont{TeX Gyre Pagella Math}
    \setsansfont{PT Sans}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\bonum
    \setmainfont{TeX Gyre Bonum}
    \setmathfont{TeX Gyre Bonum Math}
    \setsansfont{Roboto Condensed}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\dejavu
    \setmainfont{DejaVu Serif}
    \setmathfont{TeX Gyre DejaVu Math}
    \setsansfont{PT Sans Narrow}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\stix
    \setmainfont{STIX Two Text}
    \setmathfont{STIX Two Math}
    \setsansfont{PT Sans Narrow}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\garamond
    \setmainfont{EBGaramond-Regular}[
      BoldFont = EBGaramond-Bold,
      ItalicFont = EBGaramond-Italic,
      BoldItalicFont = EBGaramond-BoldItalic
    ]
    \setmathfont{Garamond-Math}[Scale=MatchUppercase]
    \setsansfont{Open Sans}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\erewhon
    \setmainfont{Heuristica}
    \setmathfont{Erewhon Math}
    \setsansfont{PT Sans Narrow}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
\fi
\ifdefined\source
    \setmainfont{Source Serif Pro}
    \setmathfont{Erewhon Math}
    \setsansfont{Source Sans Pro}
    \setmonofont{Source Code Pro}[Scale=MatchLowercase]
    \RequirePackage[basic,italic,symbolgreek]{mathastext}
    \makeatletter
    \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,s,t,u,v,w,x\do{%
    \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}%
    \makeatother
    \MTsetmathskips{f}{2.5mu}{0.5mu}
    \MTsetmathskips{g}{1.5mu}{0.5mu}
    \MTsetmathskips{j}{2.5mu}{0.5mu}
    \MTsetmathskips{p}{1.5mu}{0mu}
    \MTsetmathskips{y}{1.5mu}{0.5mu}
    \MTsetmathskips{z}{1mu}{0.5mu}
\fi
\ifdefined\plex
    \setmainfont{IBM Plex Serif}
    \setmathfont{Erewhon Math}
    \setsansfont{IBM Plex Sans}
    \setmonofont{IBM Plex Mono}[Scale=MatchLowercase]
    \RequirePackage[basic,italic,symbolgreek]{mathastext}
    \makeatletter
    \@for\@tempa:=a,b,c,d,e,h,i,k,l,m,n,o,q,r,s,t,u,v,w,x\do{%
    \MTsetmathskips{\@tempa}{0.5mu}{0.5mu}}%
    \makeatother
    \MTsetmathskips{f}{2.5mu}{0.5mu}
    \MTsetmathskips{g}{1.5mu}{0.5mu}
    \MTsetmathskips{j}{2.5mu}{0.5mu}
    \MTsetmathskips{p}{1.5mu}{0mu}
    \MTsetmathskips{y}{1.5mu}{0.5mu}
    \MTsetmathskips{z}{1mu}{0.5mu}
\fi

% Espaçamento padrão entre linhas.
\renewcommand{\baselinestretch}{1.2}

% Formatação de citações de bloco.
\newlength{\quotemargin}
\setlength{\quotemargin}{2.5cm}
\newenvironment*{innerquote}{%
    \setlength{\leftmargini}{0cm}%
    \quote%
    \hfill\begin{minipage}{\dimexpr\textwidth-\quotemargin\relax}%
    \linespread{1.0}\small%
}{%
    \end{minipage}%
    \endquote%
}
\SetBlockEnvironment{innerquote}
\renewcommand{\mkbegdispquote}[2]{\textooquote}
\renewcommand{\mkenddispquote}[2]{\textcoquote#1#2}
% Remove os parênteses do autor para que a citação via ABNT fique correta.
\renewcommand{\mkcitation}[1]{ #1}

% Tipo de fonte para os títulos, subtítulos etc.
\newcommand{\titlefont}{\rmfamily\bfseries\scshape}%
\ifdefined\sanstitles%
    \renewcommand*{\titlefont}{\sffamily\bfseries\scshape}%
\fi%

% Formata o pré-texto.
\makeatletter
\g@addto@macro\frontmatter{%
    \addtocontents{toc}{\setcounter{tocdepth}{-1}}%
    \pagenumbering{gobble}%
    \pagestyle{empty}%
    \titleformat{\chapter}[display]{\centering\titlefont\Huge}{}{0pt}{}%
    \titlespacing*{\chapter}{0pt}{0pt}{40pt}%
}
\makeatother

% Separação do número de um capítulo, seção etc. do nome em si.
\newlength{\numbernamesep}
\setlength{\numbernamesep}{16pt}

% Formata o texto principal.
\makeatletter
\g@addto@macro\mainmatter{%
    \addtocontents{toc}{\setcounter{tocdepth}{2}}%
    \pagestyle{headings}%
    \titleformat{\chapter}[display]{\titlefont\Huge}{}{0pt}{\thechapter\hspace{\numbernamesep}}%
    \titleformat{\section}{\titlefont\Large}{\thesection}{\numbernamesep}{}%
    \titleformat{\subsection}{\titlefont\large}{\thesubsection}{\numbernamesep}{}%
    \titleformat{\subsubsection}{\titlefont\normalsize}{\thesubsubsection}{\numbernamesep}{}%
    \titleformat{\paragraph}[runin]{\titlefont\normalsize}{\theparagraph}{\numbernamesep}{}%
    \titleformat{\subparagraph}[runin]{\titlefont\normalsize}{\thesubparagraph}{\numbernamesep}{}%
    \titlespacing*{\chapter}{0pt}{50pt}{40pt}%
    \titlespacing*{\section}{0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}%
    \titlespacing*{\subsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}%
    \titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}%
    \titlespacing*{\paragraph}{0pt}{3.25ex plus 1ex minus .2ex}{1em}%
    \titlespacing*{\subparagraph}{\parindent}{3.25ex plus 1ex minus .2ex}{1em}%
}
\makeatother

% Formata o pós-texto.
\makeatletter
\g@addto@macro\backmatter{%
    \addtocontents{toc}{\setcounter{tocdepth}{0}}%
    \pagestyle{plain}%
    \titleformat{\chapter}[display]{\centering\titlefont\Huge}{}{0pt}{}%
    \titleformat{\section}{\titlefont\Large}{}{0pt}{}%
    \titleformat{\subsection}{\titlefont\large}{}{0pt}{}%
    \titleformat{\subsubsection}{\titlefont\normalsize}{}{0pt}{}%
    \titlespacing*{\chapter}{0pt}{0pt}{40pt}%
}
\makeatother

% Campo de assinatura com data.
\newcommand{\signaturefield}[1]{{%
    \par\vspace{24pt}\linespread{1.0}\footnotesize%
    \noindent\makebox[0.7\textwidth]{\hrulefill}\hfill\makebox[0.2\textwidth]{\hrulefill} \\[-6pt]%
    \parbox[t]{0.7\textwidth}{#1}\hfill\makebox[0.2\textwidth][c]{Data}%
}}

% Listagem de palavras-chave em português e inglês.
\newcommand{\portuguesekeywords}[1]{\par\vspace{12pt}\noindent\textbf{\textsc{Palavras-Chave:}} #1}
\newcommand{\englishkeywords}[1]{\par\vspace{12pt}\noindent\textbf{\textsc{Keywords:}} #1}

% Versão antiga.
% \newenvironment{definition}[1][2cm]{%
%     \renewcommand{\descriptionlabel}[1]{\makebox[#1][r]{\hspace\labelsep\normalfont\bfseries\hfill##1}}%
%     \begin{description}%
% }{%
%     \end{description}%
% }

% Ambiente para definições diversas, como abreviaturas, símbolos etc.
\newenvironment{definition}[1][Pirulita]{%
    \begin{list}{}{%
        \renewcommand\makelabel[1]{\hfill\textbf{##1}}%
        \settowidth\labelwidth{\makelabel{#1}}%
        \setlength\leftmargin{\labelwidth}%
        \addtolength\leftmargin{\labelsep}%
    }%
}{%
    \end{list}%
}

% Figuras com rótulo e fonte.
\newcommand{\figuresource}{}
\newenvironment{standardfigure}[3][Próprio autor.]{%
    \begin{figure}%
    \centering%
    \caption{#2}\label{#3}%
    \renewcommand{\figuresource}{#1}%
}{%
    \par\vspace{6pt}\noindent%
    \textbf{Fonte:} \figuresource%
    \end{figure}%
}

% Tabelas com rótulo e fonte.
\newcommand{\tablesource}{}
\newenvironment{standardtable}[3][Próprio autor.]{%
    \begin{table}%
    \centering%
    \caption{#2}\label{#3}%
    \renewcommand{\tablesource}{#1}%
}{%
    \par\vspace{12pt}\noindent%
    \textbf{Fonte:} \tablesource%
    \end{table}%
}

% Campos de configuração de metadados.
\renewcommand{\author}[1]{\newcommand{\theauthor}{#1}}
\renewcommand{\title}[1]{\newcommand{\thetitle}{#1}}
\renewcommand{\date}[1]{\newcommand{\thedate}{#1}}

\newcommand{\firstauthor}[2]{%
    \newcommand{\thefirstauthor}{#1}\author{#1}%
    \newcommand{\thefirstauthorreference}{#2}%
}
\newcommand{\secondauthor}[2]{%
    \newcommand{\thesecondauthor}{#1}%
    \newcommand{\thesecondauthorreference}{#2}%
}
\newcommand{\subtitle}[1]{\newcommand{\thesubtitle}{#1}}
\newcommand{\numberofpages}[1]{\newcommand{\thenumberofpages}{#1}}
\newcommand{\type}[1]{\newcommand{\thetype}{#1}}
\newcommand{\program}[1]{\newcommand{\theprogram}{#1}}
\newcommand{\institution}[1]{\newcommand{\theinstitution}{#1}}
\newcommand{\degree}[2]{%
    \newcommand{\thedegree}{#1}%
    \newcommand{\thefulldegree}{#2}%
}
\newcommand{\focusarea}[1]{\newcommand{\thefocusarea}{#1}}
\newcommand{\supervisor}[2]{%
    \newcommand{\thesupervisor}{#1}%
    \newcommand{\thesupervisorinstitution}{#2}%
}
\newcommand{\cosupervisor}[2]{%
    \newcommand{\thecosupervisor}{#1}%
    \newcommand{\thecosupervisorinstitution}{#2}%
}
\newcommand{\city}[1]{\newcommand{\thecity}{#1}}
\newcommand{\deposityear}[1]{\newcommand{\thedeposityear}{#1}}
\newcommand{\catalogcomments}[1]{\newcommand{\thecatalogcomments}{#1}}
\newcommand{\catalogkeywords}[1]{\newcommand{\thecatalogkeywords}{#1}}

\newcommand{\firstcommiteemember}[3]{%
    \newcommand{\thefirstcommiteemember}{#1}%
    \newcommand{\thefirstcommiteememberinstitution}{#2}%
    \newcommand{\thefirstcommiteememberdecision}{#3}%
}
\newcommand{\secondcommiteemember}[3]{%
    \newcommand{\thesecondcommiteemember}{#1}%
    \newcommand{\thesecondcommiteememberinstitution}{#2}%
    \newcommand{\thesecondcommiteememberdecision}{#3}%
}
\newcommand{\thirdcommiteemember}[3]{%
    \newcommand{\thethirdcommiteemember}{#1}%
    \newcommand{\thethirdcommiteememberinstitution}{#2}%
    \newcommand{\thethirdcommiteememberdecision}{#3}%
}
\newcommand{\fourthcommiteemember}[3]{%
    \newcommand{\thefourthcommiteemember}{#1}%
    \newcommand{\thefourthcommiteememberinstitution}{#2}%
    \newcommand{\thefourthcommiteememberdecision}{#3}%
}
\newcommand{\fifthcommiteemember}[3]{%
    \newcommand{\thefifthcommiteemember}{#1}%
    \newcommand{\thefifthcommiteememberinstitution}{#2}%
    \newcommand{\thefifthcommiteememberdecision}{#3}%
}

%
% Folhas e capítulos específicos.
%

% Contra-capa.
\newcommand{\centerrule}[2][0.6pt]{$\vcenter{\hbox{\rule{#2}{#1}}}$}
\newcommand{\authorseparator}{{\small\centerrule{1cm} \textit{\&} \centerrule{1cm}\par}}
\newcommand{\backcover}{{\centering\sc%
    {% Autores.
    \linespread{1.0}\large\thefirstauthor\par%
    \ifdefined\thesecondauthor%
        {\authorseparator\thesecondauthor}\par%
    \fi%
    }%
    \vspace{2.5cm}%
    {\huge\thetitle}\par%
    \ifdefined\thesubtitle{\large\thesubtitle\par}\fi\vfill%
    \hfill\parbox{0.60\textwidth}{%
    \normalfont\small \thetype\ apresentada ao \emph{\theprogram} da \theinstitution\ para obtenção do título de \emph{\thefulldegree}.\par\vspace{12pt}%
    Área de Concentração: \thefocusarea\par\vspace{12pt}%
    Orientador: \thesupervisor%
    \ifdefined\thecosupervisor%
        {\\ Coorientador: \thecosupervisor}\par%
    \fi%
    }\par\vfill%
    \centering\normalfont\thecity\\\thedeposityear\par%
}}

% Errata.
\newcommand{\corrections}[1]{{%
    \chapter{Errata}%
    \begin{center}%
        \begin{tabular}{cccc}%
            \toprule%
            \bf Página & \bf Linha & \bf Onde se lê & \bf Leia-se \\%
            \midrule%
            #1%
            \bottomrule%
        \end{tabular}%
    \end{center}%
}}

% Ficha catalográfica.
\newcommand{\catalogframe}{{%
    \setlength{\fboxsep}{6pt}%
    \begin{center}%
    \fbox{\parbox{10cm}{\setlength{\parindent}{12pt}\footnotesize%
        \noindent\thefirstauthorreference%
        \ifdefined\thesecondauthorreference%
            ; \thesecondauthorreference%
        \fi%
        \par%
        \thetitle%
        \ifdefined\thesubtitle%
            : \thesubtitle%
        \fi%
        \ / \thefirstauthor%
        \ifdefined\thesecondauthor%
            , \thesecondauthor%
        \fi%
        \ --- \thecity, \thedeposityear. \par%
        \thenumberofpages p. \thecatalogcomments. \par \vspace{12pt}%
        \thetype\ (\thedegree). \theinstitution. \par \vspace{12pt}%
        Orientador: \thesupervisor.%
        \ifdefined\thecosupervisor%
            \\ \indent Coorientador: \thecosupervisor.%
        \fi%
        \par\vspace{12pt}%
        \thecatalogkeywords%
    }}%
    \end{center}%
}}

% Autorização e catalogação.
\newcommand{\authorization}{{%
    \chapter{Autorização}%
    Autorizo a reprodução total ou parcial deste trabalho, por qualquer meio convencional ou eletrônico, para fins de estudo e pesquisa, desde que citada a fonte.%
    \signaturefield{\theauthor}%
    \ifdefined\thesecondauthor%
        \signaturefield{\thesecondauthor}%
    \fi%
    \vfill%
    \catalogframe%
}}

% Aprovação.
\newcommand{\approval}{{%
    \chapter{Aprovação}%
    \thetype\ apresentada ao \emph{\theprogram} da \theinstitution\ para obtenção do título de \emph{\thefulldegree}.\par%
    Aprovada em \thedate\ pela banca examinadora:%
    \signaturefield{\thesupervisor\ (Orientador) \\ \thesupervisorinstitution}%
    \ifdefined\thecosupervisor%
        \signaturefield{\thecosupervisor\ (Coorientador) \\ \thecosupervisorinstitution}%
    \fi%
    \ifdefined\thefirstcommiteemember%
        \signaturefield{\thefirstcommiteemember \\ \thefirstcommiteememberinstitution. \textit{\thefirstcommiteememberdecision.}}%
    \fi%
    \ifdefined\thesecondcommiteemember%
        \signaturefield{\thesecondcommiteemember \\ \thesecondcommiteememberinstitution. \textit{\thesecondcommiteememberdecision.}}%
    \fi%
    \ifdefined\thethirdcommiteemember%
        \signaturefield{\thethirdcommiteemember \\ \thethirdcommiteememberinstitution. \textit{\thethirdcommiteememberdecision.}}%
    \fi%
    \ifdefined\thefourthcommiteemember%
        \signaturefield{\thefourthcommiteemember \\ \thefourthcommiteememberinstitution. \textit{\thefourthcommiteememberdecision.}}%
    \fi%
    \ifdefined\thefifthcommiteemember%
        \signaturefield{\thefifthcommiteemember \\ \thefifthcommiteememberinstitution. \textit{\thefifthcommiteememberdecision.}}%
    \fi%
}}

% Dedicatória.
\newcommand{\inscription}[1]{{%
    \chapter{Dedicatória}%
    #1%
}}

% Agradecimentos.
\newcommand{\acknowledgement}[1]{{%
    \chapter{Agradecimentos}%
    #1%
}}

% Epígrafe.
\newcommand{\epigraphchapter}[1]{{%
    \chapter{}%
    \vfill%
    #1%
}}

% Resumo.
\newcommand{\portugueseabstract}[2]{{%
    \chapter{Resumo}%
    #1%

    \portuguesekeywords{#2}%
}}

% Abstract.
\newcommand{\englishabstract}[2]{{%
    \chapter{Abstract}%
    \begin{english}
    #1%
    \end{english}
    \englishkeywords{\textenglish{#2}}%
}}

% Glossário.
\newcommand{\backglossary}[2][Glossário]{{%
    \chapter{#1}%
    #2%
}}

% Appêndices.
\newcommand{\appendices}{%
    \setcounter{chapter}{1}%
    \titleformat{\chapter}[display]{\centering\titlefont\Huge}{}{0pt}{Apêndice \Alph{chapter} \\ \LARGE\mdseries}[\addtocounter{chapter}{1}]%
}
\renewcommand{\appendix}[2]{{%
    \chapter[Apêndice \Alph{chapter} --- #1]{#1}%
    #2%
}}

% Anexos.
\newcommand{\annexes}{%
    \setcounter{chapter}{1}%
    \titleformat{\chapter}[display]{\centering\titlefont\Huge}{}{0pt}{Anexo \thechapter \\ \LARGE\mdseries}[\addtocounter{chapter}{1}]%
}
\newcommand{\annex}[2]{{%
    \chapter[Anexo \thechapter\ --- #1]{#1}%
    #2%
}}

% Índice.
\newcommand{\remissiveindex}[2][Índice]{{%
    \titleformat{\chapter}[display]{\centering\titlefont\Huge}{}{0pt}{}%
    \linespread{1.0}\normalfont\renewcommand\labelitemi{}\renewcommand\labelitemii{}%
    \chapter{#1}%
    #2%
}}