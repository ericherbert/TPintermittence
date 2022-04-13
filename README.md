## notes pour l'année prochaine
1. faire calculer un facteur de charge pour le foisonnement et l'agrégation
2. enlever les refs au random après la première question

## contenu de ce Dépot
Ce dépot contient tout le materiel pour effectuer le TP intermittence. Vous devez:

1. télécharger le dépot à l'aide du bouton vert *Clone or Download*
1. Récupérer l'énoncé en pdf
1. vous connecter à JupyterHub grace à vos identifiants ENT.
1. Pour prétraiter des données *xls* issues de RTE:
    1. exporter les données en *csv*. Utiliser des "**,**" comme séparateurs
    1. ouvrir le fichier et enlever les caractères accentués (*é*, *è* etc) et éventuellement les remplacer par des lettres sans accentuation.
    1. trouver le délimiteur des dates (- ou / etc)
    1. vérifier si la date est écrite en jour mois année ou années mois jour 
    1. ouvrir *open_data.py*
    1. mettre à jour le chemin
    1. **si besoin**  mettre à jour les délimiteurs de la date lignes 31 et 32, 37 et 38
    1. **si besoin**  mettre à jour l'ordre de la date date lignes 33 et 39
    1. Un exemple de fichier *xls*, exporté en *csv* et le fichier *open_data.py* modifié correspondant sont disponibles dans */Data/preparationDATA/*

