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

  <section|Donn�es>

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
    usage, pour extraire les diff�rentes donn�es. Repr�senter la
    consommation, la production de nucl�aire, d'�olien et de PV sur
    diff�rentes periodes: un jour, une semaine, un mois et un an, � l'aide de
    <with|font-shape|italic|plot_data.py>
  </enumerate>

  <section|Questions>

  <subsubsection|s�ries temporelles>

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

  <section|Aggr�gation ?>

  �a parait compliqu� � moins d'avoir d'autres donn�es ? ou alors leur faire
  dire simplement qu'il faudrait un espace d'�change de la taille d'une demi
  plan�te pour que �a contionne ?\ 

  <section|foisonnement>

  en vous appuyant sur le programme <with|font-shape|italic|plot_foisonnement.py>
  aditionner les sources �olien et PV et retp�senter la s�rie temporelle
  correspondante.

  <\enumerate>
    <item>La perte de puissance nocturne est elle att�nu�e ?
  </enumerate>

  <section|stockage>

  <\enumerate>
    <item>stockage PV sur 24h
  </enumerate>
</body>

<initial|<\collection>
</collection>>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
    <associate|auto-2|<tuple|2|1>>
    <associate|auto-3|<tuple|3|1>>
    <associate|auto-4|<tuple|1|1>>
    <associate|auto-5|<tuple|2|1>>
    <associate|auto-6|<tuple|4|1>>
    <associate|auto-7|<tuple|5|?>>
    <associate|auto-8|<tuple|6|?>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|1<space|2spc>Avant
      de commencer> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|2<space|2spc>Donn�es>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|3<space|2spc>Traitement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4<space|2spc>Aggr�gation
      ?> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|5<space|2spc>foisonnement>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.5fn>

      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|6<space|2spc>stockage>
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-6><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>