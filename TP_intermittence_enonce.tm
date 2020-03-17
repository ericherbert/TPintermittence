<TeXmacs|1.99.12>

<style|<tuple|generic|french>>

<\body>
  <doc-data|<doc-title|TP intermittence>>

  <section|Avant de commencer>

  <\itemize>
    <item>La production de PV et eolien en France doit légalement être
    achetée par EDF, donc la puissance de ces sources injectées dans le
    réseau est toujours la maximale possible.

    <item>L'intermittence n'est pas

    <\itemize>
      <item>Variabilité

      <item>Prévisibilité

      <item>Fractionnabilité
    </itemize>

    \;
  </itemize>

  <section|Récupérer les données et les programmes>

  <subsection|Programmes>

  rendez vous sur la page <with|font-shape|italic|https://github.com/ericherbert/TPintermittence>,
  téléchargez l'ensemble du projet (bouton <with|font-shape|italic|clone or
  download>) et extraire les documents de l'archive. Vous y trouverez

  <\itemize>
    <item>Le dossier <with|font-shape|italic|data> contenant les données dont
    vous avez besoin si la phase de téléchargement des données sur le site de
    <with|font-shape|italic|RTE> n'a pas fonctionné

    <item>L'énoncé en pdf\ 

    <item>Des programmes <with|font-shape|italic|Python> permettant la
    réalisation de ce TP.
  </itemize>

  Après avoir ouvert un terminal, lancer la commande
  <with|font-shape|italic|ipython> dans le répertoire où se trouve vos
  fichiers.

  <subsection|Données>

  <\enumerate>
    <item>Se rendre sur le site de RTE à l'adresse
    <with|font-shape|italic|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique>

    <item>Identifier les différentes sources de puissance, comparer
    qualitativement sur différentes periodes leur série temporelle.

    <item>Choisir une periode spécifique et télécharger les données
    correspondantes. Noter la durée, la fréquence d'échantillonnage, les
    sources disponibles.

    <item>Après avec dézipper l'archive, utiliser le programme python
    <with|font-shape|italic|open_data.py> que vous aurez modifié pour votre
    usage, pour extraire les différentes données. Noter le nom et la colonne
    de chaque mesurable (Consommation, Fioul, Charbon etc).
  </enumerate>

  <section|Traitement>

  <subsubsection|Séries temporelles>

  <\enumerate>
    <item>Représenter la dynamique temporelle de la consommation journalière,
    mensuelle et annuelle. Ajoutez les unités et enregistrez ces figures de
    manière à pouvoir les retrouver simplement, et faites de même pour les
    trois sources les dynamiques temporelles journalière, mensuelle et
    annuelle. Ajoutez les unités et enregistrez ces figures de manière à
    pouvoir les retrouver simplement.

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

  <subsubsection|distribution des séries temporelles>

  <\enumerate>
    <item>Représenter la variation de la distribution de la consommation
    normalisée par sa moyenne temporelle <math|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>>,
    avec un pas de temps <math|\<tau\>> d'une heure puis de 24 heures. Faire
    de même pour les 3 sources. Représenter les
    <with|font-shape|italic|densités de probabilité> (pdf) de ces fonctions
    en vous appuyant sur le paramètre <with|font-shape|italic|density> de la
    fonction histogramme, puis comparer ces distributions avec une loi
    normale (Gaussienne) de même moyenne et écart type. Ajouter les unités,
    noms des axes et enregistrer les figures. Vous choisirez la
    représentation (logarithmique ou linéaire) qui vous paraitra la plus
    pertinente.\ 

    <item>Discussion de la comparaison avec une loi normale.

    <\enumerate>
      <item>

      <\itemize>
        <item>1h On remarque pour toutes les sources un pic pour les
        variations très faibles, suivi de branches exponentielles plus
        petites puis plus élvées que la gaussienne.\ 

        <item>24h\ 
      </itemize>

      <item>Consommation\ 

      <\itemize>
        <item>à 1h = globalement asymetrique, mais gaussien sur la fraction
        visible

        <item>à 24h = <math|\<sim\>>gaussien
      </itemize>

      <item>nucléaire

      <\itemize>
        <item>à 1h\ 

        <item>à 24h
      </itemize>

      <item>éolien

      <\itemize>
        <item>à 1h\ 

        <item>à 24h\ 
      </itemize>

      <item>PV

      <\itemize>
        <item>à 1h\ 

        <item>à 24h
      </itemize>
    </enumerate>
  </enumerate>

  <section|Aggrégation>

  L'aggrégation consiste à séparer les sources de puissances de même nature
  pour profiter de conditions climatiques le plus décorréle possible.

  <\enumerate>
    <item>À partir du programme <with|font-shape|italic|aggregation.py> qui
    utilise des données issues de <with|font-shape|italic|RTE> décrivant la
    production électrique en région Nord et Sud, représenter puis aditionner
    les sources électriques PV ou éolien.

    <item>
  </enumerate>

  <section|Foisonnement>

  Le foisonnement consiste à multiplier les sources de production de
  puissance à priori décoreler pour tendre vers une distribution. en vous
  appuyant sur le programme <with|font-shape|italic|plot_foisonnement.py>
  aditionner les sources éolien et PV et retpésenter la série temporelle
  correspondante.

  <\enumerate>
    <item>À partir du programme <with|font-shape|italic|foisonnement.py>,
    aditionner les sources de production de puissance électrique PV et
    éolien.

    <item>Refaire les <with|font-shape|italic|pdf> des séries temporelles.\ 

    <item>Que peut on observer ?\ 

    <\enumerate>
      <item>La perte de puissance nocturne est elle atténuée ?
    </enumerate>

    <item>Conclure sur l'effet du foisonnement.
  </enumerate>

  <section|Stockage>

  Estimer le dimensionnement du stockage nécessaire pour vous assure de
  l'approvisionnement en électricité.
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-10|<tuple|6|?>>
    <associate|auto-11|<tuple|7|?>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|2.1|1>>
    <associate|auto-4|<tuple|2.2|1>>
    <associate|auto-5|<tuple|3|1>>
    <associate|auto-6|<tuple|3.0.1|1>>
    <associate|auto-7|<tuple|3.0.2|?>>
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Données>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Questions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|2tab>|4.0.1<space|2spc>séries temporelles
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|4.0.2<space|2spc>distribution des séries
      temporelles <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Aggrégation
      ?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-8><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>foisonnement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-9><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|7<space|2spc>stockage>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-10><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>