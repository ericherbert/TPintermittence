<TeXmacs|1.99.12>

<style|<tuple|generic|french>>

<\body>
  <doc-data|<doc-title|TP intermittence>>

  Le compte rendu de ce TP devra être rendu sous forme numérique, en pdf, à
  l'aide d'un outil tel qu'un latex ou LibreOffice. Les figures seront
  commentées et choisies selon leur pertinence.

  <section|Avant de commencer>

  <\itemize>
    <item>On s'intéresse à la production de puissance électrique en France.
    Légalement EDF doit acheter toutes la production PV et eolien, donc la
    puissance de ces sources injectées dans le réseau est toujours la
    maximale possible. Inversement, les source fossiles étant pilotables,
    elles s'adaptent à la variation de la consommation.

    <item>L'intermittence n'est pas réductible à la\ 

    <\itemize>
      <item>Variabilité, pilotable ou non, prévisible ou non de la production
      de puissance

      <item>Prévisibilité,\ 

      <item>Fractionnabilité, c'est à dire la possibilité de n'utiliser une
      partie de sa\ 
    </itemize>
  </itemize>

  L'intermittence ne se défini pas simplement.

  <section|Récupérer les données et les programmes>

  <subsection|Programmes>

  rendez vous sur la page <hlink|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique|>,
  téléchargez l'ensemble du projet (bouton <with|font-shape|italic|clone or
  download>) et extraire les documents de l'archive. Vous y trouverez

  <\itemize>
    <item>Le dossier <with|font-shape|italic|DATA> contenant les données dont
    vous avez besoin si la phase de téléchargement des données sur le site de
    <with|font-shape|italic|RTE> n'a pas fonctionné

    <item>L'énoncé en pdf\ 

    <item>Des programmes <with|font-shape|italic|Python> permettant la
    réalisation de ce TP.
  </itemize>

  Ce TP doit normalement être effectué sur l'application
  <with|font-shape|italic|JupyterHub> de l'UFR. Vous le trouverez à l'adresse
  suivante <hlink|https://jupy.physique.univ-paris-diderot.fr/|https://jupy.physique.univ-paris-diderot.fr/>.\ 

  <subsection|Données>

  <\enumerate>
    <item>Se rendre sur le site de RTE à l'adresse
    <hlink|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique|>

    <item>Identifier les différentes sources de puissance, comparer
    qualitativement sur différentes periodes leur série temporelle.

    <item>Choisir une periode spécifique et télécharger les données
    correspondantes. Noter la durée, la fréquence d'échantillonnage, les
    sources disponibles.

    <item>Après avec dézippé l'archive et enregistré le tableau au format
    csv, utiliser le programme <with|font-shape|italic|open_data.py> que vous
    aurez modifié pour votre usage, pour extraire les différentes données.
    Noter le nom et la colonne de chaque mesurable (Consommation, nucléaire
    etc). Si besoin dans le repertoire <with|font-shape|italic|DATA>, des
    données provenant de RTE sont disponibles.
  </enumerate>

  <section|Traitement>

  Dans la suite on s'interesera uniquement aux sources de production
  nucléaire, éolien et solaire. L'expression <with|font-shape|italic|les 3
  sources> s'y réfère\ 

  <subsection|Séries temporelles>

  <\enumerate>
    <item>À l'aide du programme <with|font-shape|italic|plot_data.py>,
    représenter la dynamique temporelle de la
    <with|font-series|bold|consommation> journalière, mensuelle et annuelle.
    Ajoutez les unités et enregistrez ces figures de manière à pouvoir les
    retrouver simplement, et faites de même pour les trois sources. Ajoutez
    les unités et enregistrez ces figures de manière à pouvoir les retrouver
    simplement.

    <\enumerate>
      <item>Sur les diagrammes annuels, repérez les différentes saisons

      <item>Sur les diagrammes journaliers, repérez les différentes parties
      de la journée
    </enumerate>

    <item>Extraire les moyennes temporelles
    <math|<around*|\<langle\>|x|\<rangle\>>> et écart type
    <math|\<sigma\><rsub|x>> de chacune des sources sur chacune des periodes
    considérées. Pouvez vous utiliser les quantités
    <math|\<sigma\><rsub|x>/<around*|\<langle\>|x|\<rangle\>>>, pour
    caractériser chacune des sources ?
  </enumerate>

  <subsection|Distribution des séries temporelles>

  <\enumerate>
    <item>À l'aide du programme <with|font-shape|italic|plot_distribution.py>,
    représenter la variation de la distribution de la
    <with|font-series|bold|consommation> normalisée par sa moyenne temporelle
    <math|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>>,
    avec un pas de temps <math|\<tau\>> d'une heure puis de 24 heures. Faire
    de même pour les 3 sources. Représenter les
    <with|font-shape|italic|densités de probabilité> (pdf) de ces fonctions
    en vous appuyant sur le paramètre <with|font-shape|italic|density> de la
    fonction histogramme, puis comparer ces distributions avec une loi
    normale (Gaussienne) de même moyenne et écart type. Ajouter les unités,
    noms des axes et enregistrer les figures. Vous choisirez la
    représentation (logarithmique ou linéaire) qui vous paraitra la plus
    pertinente.\ 

    <item>Discuter à 1h et 24h les écarts à la loi normale.
  </enumerate>

  <section|Agrégation>

  L'agrégation consiste à séparer les sources de puissances de même nature
  pour profiter de conditions climatiques le plus décorrélées possible.

  <\enumerate>
    <item>À partir du programme <with|font-shape|italic|agregation.py> qui
    utilise des données issues de <with|font-shape|italic|RTE> décrivant la
    production électrique issues de deux régions, représenter puis aditionner
    les sources électriques PV ou éolien.

    <item>Commenter la correlation des productions éléctriques dans ce cas
  </enumerate>

  <section|Foisonnement>

  Le foisonnement consiste à multiplier les sources de production de
  puissance à priori décoreler pour tendre vers une distribution. en vous
  appuyant sur le programme <with|font-shape|italic|foisonnement.py>
  aditionner les sources éolien et PV et retpésenter la série temporelle
  correspondante.

  <\enumerate>
    <item>À partir du programme <with|font-shape|italic|foisonnement.py>,
    aditionner les sources de production de puissance électrique PV et
    éolien.

    <item>Refaire les <with|font-shape|italic|pdf> des séries temporelles.\ 

    <item>Que peut on observer ? La perte de puissance nocturne est elle
    atténuée ?

    <item>Commenter la correlation des productions éléctriques dans ce cas
  </enumerate>

  <section|Intermittence>

  Dans une première approche de l'intermittence, nous pouvons l'évaluer comme
  la capacité à s'adapter à la variation de la consommation. Pour cela en
  vous appuyant sur le programme <with|font-shape|italic|correlation_simple.py>,
  vous allez calculer la probabilité que le signe de la variation de la
  consommation, déterminée par le signe de
  <math|<around*|(|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>|)>>
  et celui des sources respectivement nucléaire, éolien et solaire soient les
  mêmes.\ 

  Commentez les valeurs obtenues, en faisant également varier <math|\<tau\>>

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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Récupérer
      les données et les programmes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Programmes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <with|par-left|<quote|1tab>|2.2<space|2spc>Données
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Traitement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|1tab>|3.1<space|2spc>Séries temporelles
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|1tab>|3.2<space|2spc>Distribution des séries
      temporelles <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Agrégation>
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