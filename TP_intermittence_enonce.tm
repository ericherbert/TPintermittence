<TeXmacs|1.99.12>

<style|<tuple|generic|french>>

<\body>
  <doc-data|<doc-title|TP intermittence>>

  Le compte rendu de ce TP devra �tre rendu sous forme num�rique, en pdf, �
  l'aide d'un outil tel qu'un latex ou LibreOffice. Les figures seront
  comment�es et choisies selon leur pertinence.

  <section|Avant de commencer>

  <\itemize>
    <item>On s'int�resse � la production de puissance �lectrique en France.
    L�galement EDF doit acheter toutes la production PV et eolien, donc la
    puissance de ces sources inject�es dans le r�seau est toujours la
    maximale possible. Inversement, les source fossiles �tant pilotables,
    elles s'adaptent � la variation de la consommation.

    <item>L'intermittence n'est pas r�ductible � la\ 

    <\itemize>
      <item>Variabilit�, pilotable ou non, pr�visible ou non de la production
      de puissance

      <item>Pr�visibilit�,\ 

      <item>Fractionnabilit�, c'est � dire la possibilit� de n'utiliser une
      partie de sa\ 
    </itemize>
  </itemize>

  L'intermittence ne se d�fini pas simplement.

  <section|R�cup�rer les donn�es et les programmes>

  <subsection|Programmes>

  rendez vous sur la page <hlink|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique|>,
  t�l�chargez l'ensemble du projet (bouton <with|font-shape|italic|clone or
  download>) et extraire les documents de l'archive. Vous y trouverez

  <\itemize>
    <item>Le dossier <with|font-shape|italic|DATA> contenant les donn�es dont
    vous avez besoin si la phase de t�l�chargement des donn�es sur le site de
    <with|font-shape|italic|RTE> n'a pas fonctionn�

    <item>L'�nonc� en pdf\ 

    <item>Des programmes <with|font-shape|italic|Python> permettant la
    r�alisation de ce TP.
  </itemize>

  Ce TP doit normalement �tre effectu� sur l'application
  <with|font-shape|italic|JupyterHub> de l'UFR. Vous le trouverez � l'adresse
  suivante <hlink|https://jupy.physique.univ-paris-diderot.fr/|https://jupy.physique.univ-paris-diderot.fr/>.\ 

  <subsection|Donn�es>

  <\enumerate>
    <item>Se rendre sur le site de RTE � l'adresse
    <hlink|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique|>

    <item>Identifier les diff�rentes sources de puissance, comparer
    qualitativement sur diff�rentes periodes leur s�rie temporelle.

    <item>Choisir une periode sp�cifique et t�l�charger les donn�es
    correspondantes. Noter la dur�e, la fr�quence d'�chantillonnage, les
    sources disponibles.

    <item>Apr�s avec d�zipp� l'archive et enregistr� le tableau au format
    csv, utiliser le programme <with|font-shape|italic|open_data.py> que vous
    aurez modifi� pour votre usage, pour extraire les diff�rentes donn�es.
    Noter le nom et la colonne de chaque mesurable (Consommation, nucl�aire
    etc). Si besoin dans le repertoire <with|font-shape|italic|DATA>, des
    donn�es provenant de RTE sont disponibles.
  </enumerate>

  <section|Traitement>

  Dans la suite on s'interesera uniquement aux sources de production
  nucl�aire, �olien et solaire. L'expression <with|font-shape|italic|les 3
  sources> s'y r�f�re\ 

  <subsection|S�ries temporelles>

  <\enumerate>
    <item>� l'aide du programme <with|font-shape|italic|plot_data.py>,
    repr�senter la dynamique temporelle de la
    <with|font-series|bold|consommation> journali�re, mensuelle et annuelle.
    Ajoutez les unit�s et enregistrez ces figures de mani�re � pouvoir les
    retrouver simplement, et faites de m�me pour les trois sources. Ajoutez
    les unit�s et enregistrez ces figures de mani�re � pouvoir les retrouver
    simplement.

    <\enumerate>
      <item>Sur les diagrammes annuels, rep�rez les diff�rentes saisons

      <item>Sur les diagrammes journaliers, rep�rez les diff�rentes parties
      de la journ�e
    </enumerate>

    <item>Extraire les moyennes temporelles
    <math|<around*|\<langle\>|x|\<rangle\>>> et �cart type
    <math|\<sigma\><rsub|x>> de chacune des sources sur chacune des periodes
    consid�r�es. Pouvez vous utiliser les quantit�s
    <math|\<sigma\><rsub|x>/<around*|\<langle\>|x|\<rangle\>>>, pour
    caract�riser chacune des sources ?
  </enumerate>

  <subsection|Distribution des s�ries temporelles>

  <\enumerate>
    <item>� l'aide du programme <with|font-shape|italic|plot_distribution.py>,
    repr�senter la variation de la distribution de la
    <with|font-series|bold|consommation> normalis�e par sa moyenne temporelle
    <math|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>>,
    avec un pas de temps <math|\<tau\>> d'une heure puis de 24 heures. Faire
    de m�me pour les 3 sources. Repr�senter les
    <with|font-shape|italic|densit�s de probabilit�> (pdf) de ces fonctions
    en vous appuyant sur le param�tre <with|font-shape|italic|density> de la
    fonction histogramme, puis comparer ces distributions avec une loi
    normale (Gaussienne) de m�me moyenne et �cart type. Ajouter les unit�s,
    noms des axes et enregistrer les figures. Vous choisirez la
    repr�sentation (logarithmique ou lin�aire) qui vous paraitra la plus
    pertinente.\ 

    <item>Discuter � 1h et 24h les �carts � la loi normale.
  </enumerate>

  <section|Agr�gation>

  L'agr�gation consiste � s�parer les sources de puissances de m�me nature
  pour profiter de conditions climatiques le plus d�corr�l�es possible.

  <\enumerate>
    <item>� partir du programme <with|font-shape|italic|agregation.py> qui
    utilise des donn�es issues de <with|font-shape|italic|RTE> d�crivant la
    production �lectrique issues de deux r�gions, repr�senter puis aditionner
    les sources �lectriques PV ou �olien.

    <item>Commenter la correlation des productions �l�ctriques dans ce cas
  </enumerate>

  <section|Foisonnement>

  Le foisonnement consiste � multiplier les sources de production de
  puissance � priori d�coreler pour tendre vers une distribution. en vous
  appuyant sur le programme <with|font-shape|italic|foisonnement.py>
  aditionner les sources �olien et PV et retp�senter la s�rie temporelle
  correspondante.

  <\enumerate>
    <item>� partir du programme <with|font-shape|italic|foisonnement.py>,
    aditionner les sources de production de puissance �lectrique PV et
    �olien.

    <item>Refaire les <with|font-shape|italic|pdf> des s�ries temporelles.\ 

    <item>Que peut on observer ? La perte de puissance nocturne est elle
    att�nu�e ?

    <item>Commenter la correlation des productions �l�ctriques dans ce cas
  </enumerate>

  <section|Intermittence>

  Dans une premi�re approche de l'intermittence, nous pouvons l'�valuer comme
  la capacit� � s'adapter � la variation de la consommation. Pour cela en
  vous appuyant sur le programme <with|font-shape|italic|correlation_simple.py>,
  vous allez calculer la probabilit� que le signe de la variation de la
  consommation, d�termin�e par le signe de
  <math|<around*|(|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>|)>>
  et celui des sources respectivement nucl�aire, �olien et solaire soient les
  m�mes.\ 

  Commentez les valeurs obtenues, en faisant �galement varier <math|\<tau\>>

  \;
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|6|?>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|1>>
    <associate|auto-5|<tuple|3|1>>
    <associate|auto-6|<tuple|3.1|1>>
    <associate|auto-7|<tuple|3.2|?>>
    <associate|auto-8|<tuple|4|?>>
    <associate|auto-9|<tuple|5|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Avant
      de commencer> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>R�cup�rer
      les donn�es et les programmes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Programmes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Donn�es
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Traitement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>S�ries temporelles
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Distribution des s�ries
      temporelles <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Agr�gation>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Foisonnement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>Intermittence>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>