<TeXmacs|1.99.12>

<style|<tuple|generic|french>>

<\body>
  <doc-data|<doc-title|TP intermittence>>

  <section|Avant de commencer>

  <\itemize>
    <item>La production de PV et eolien en France doit l�galement �tre
    achet�e par EDF, donc la puissance de ces sources inject�es dans le
    r�seau est toujours la maximale possible.

    <item>L'intermittence n'est pas

    <\itemize>
      <item>Variabilit�

      <item>Pr�visibilit�

      <item>Fractionnabilit�
    </itemize>

    \;
  </itemize>

  <section|R�cup�rer les donn�es et les programmes>

  <subsection|Programmes>

  rendez vous sur la page <with|font-shape|italic|https://github.com/ericherbert/TPintermittence>,
  t�l�chargez l'ensemble du projet (bouton <with|font-shape|italic|clone or
  download>) et extraire les documents de l'archive. Vous y trouverez

  <\itemize>
    <item>Le dossier <with|font-shape|italic|data> contenant les donn�es dont
    vous avez besoin si la phase de t�l�chargement des donn�es sur le site de
    <with|font-shape|italic|RTE> n'a pas fonctionn�

    <item>L'�nonc� en pdf\ 

    <item>Des programmes <with|font-shape|italic|Python> permettant la
    r�alisation de ce TP.
  </itemize>

  Apr�s avoir ouvert un terminal, lancer la commande
  <with|font-shape|italic|ipython> dans le r�pertoire o� se trouve vos
  fichiers.

  <subsection|Donn�es>

  <\enumerate>
    <item>Se rendre sur le site de RTE � l'adresse
    <with|font-shape|italic|https://www.rte-france.com/fr/eco2mix/eco2mix-mix-energetique>

    <item>Identifier les diff�rentes sources de puissance, comparer
    qualitativement sur diff�rentes periodes leur s�rie temporelle.

    <item>Choisir une periode sp�cifique et t�l�charger les donn�es
    correspondantes. Noter la dur�e, la fr�quence d'�chantillonnage, les
    sources disponibles.

    <item>Apr�s avec d�zipper l'archive, utiliser le programme python
    <with|font-shape|italic|open_data.py> que vous aurez modifi� pour votre
    usage, pour extraire les diff�rentes donn�es. Noter le nom et la colonne
    de chaque mesurable (Consommation, Fioul, Charbon etc).
  </enumerate>

  <section|Traitement>

  <subsubsection|S�ries temporelles>

  <\enumerate>
    <item>Repr�senter la dynamique temporelle de la consommation journali�re,
    mensuelle et annuelle. Ajoutez les unit�s et enregistrez ces figures de
    mani�re � pouvoir les retrouver simplement, et faites de m�me pour les
    trois sources les dynamiques temporelles journali�re, mensuelle et
    annuelle. Ajoutez les unit�s et enregistrez ces figures de mani�re �
    pouvoir les retrouver simplement.

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

  <subsubsection|distribution des s�ries temporelles>

  <\enumerate>
    <item>Repr�senter la variation de la distribution de la consommation
    normalis�e par sa moyenne temporelle <math|<frac|C<around*|(|t|)>-C<around*|(|t+\<tau\>|)>|<around*|\<langle\>|C|\<rangle\>>>>,
    avec un pas de temps <math|\<tau\>> d'une heure puis de 24 heures. Faire
    de m�me pour les 3 sources. Repr�senter les
    <with|font-shape|italic|densit�s de probabilit�> (pdf) de ces fonctions
    en vous appuyant sur le param�tre <with|font-shape|italic|density> de la
    fonction histogramme, puis comparer ces distributions avec une loi
    normale (Gaussienne) de m�me moyenne et �cart type. Ajouter les unit�s,
    noms des axes et enregistrer les figures. Vous choisirez la
    repr�sentation (logarithmique ou lin�aire) qui vous paraitra la plus
    pertinente.\ 

    <item>Discussion de la comparaison avec une loi normale.

    <\enumerate>
      <item>

      <\itemize>
        <item>1h On remarque pour toutes les sources un pic pour les
        variations tr�s faibles, suivi de branches exponentielles plus
        petites puis plus �lv�es que la gaussienne.\ 

        <item>24h\ 
      </itemize>

      <item>Consommation\ 

      <\itemize>
        <item>� 1h = globalement asymetrique, mais gaussien sur la fraction
        visible

        <item>� 24h = <math|\<sim\>>gaussien
      </itemize>

      <item>nucl�aire

      <\itemize>
        <item>� 1h\ 

        <item>� 24h
      </itemize>

      <item>�olien

      <\itemize>
        <item>� 1h\ 

        <item>� 24h\ 
      </itemize>

      <item>PV

      <\itemize>
        <item>� 1h\ 

        <item>� 24h
      </itemize>
    </enumerate>
  </enumerate>

  <section|Aggr�gation>

  L'aggr�gation consiste � s�parer les sources de puissances de m�me nature
  pour profiter de conditions climatiques le plus d�corr�le possible.

  <\enumerate>
    <item>� partir du programme <with|font-shape|italic|aggregation.py> qui
    utilise des donn�es issues de <with|font-shape|italic|RTE> d�crivant la
    production �lectrique en r�gion Nord et Sud, repr�senter puis aditionner
    les sources �lectriques PV ou �olien.

    <item>
  </enumerate>

  <section|Foisonnement>

  Le foisonnement consiste � multiplier les sources de production de
  puissance � priori d�coreler pour tendre vers une distribution. en vous
  appuyant sur le programme <with|font-shape|italic|plot_foisonnement.py>
  aditionner les sources �olien et PV et retp�senter la s�rie temporelle
  correspondante.

  <\enumerate>
    <item>� partir du programme <with|font-shape|italic|foisonnement.py>,
    aditionner les sources de production de puissance �lectrique PV et
    �olien.

    <item>Refaire les <with|font-shape|italic|pdf> des s�ries temporelles.\ 

    <item>Que peut on observer ?\ 

    <\enumerate>
      <item>La perte de puissance nocturne est elle att�nu�e ?
    </enumerate>

    <item>Conclure sur l'effet du foisonnement.
  </enumerate>

  <section|Stockage>

  Estimer le dimensionnement du stockage n�cessaire pour vous assure de
  l'approvisionnement en �lectricit�.
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

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>R�cup�rer
      les donn�es et les programmes> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <with|par-left|<quote|1tab>|2.1<space|2spc>Programmes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Donn�es>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Questions>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <with|par-left|<quote|2tab>|4.0.1<space|2spc>s�ries temporelles
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6>>

      <with|par-left|<quote|2tab>|4.0.2<space|2spc>distribution des s�ries
      temporelles <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-7>>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>Aggr�gation
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