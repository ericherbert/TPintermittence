
import numpy as np
import matplotlib.pyplot as plt


# repertoire des données
trait_dir = "./DATA/" 
# repertoire de sauvegarde des plots
save_plot = "./plots/" 
# data utilisées
filename = "eCO2mix_RTE_Hauts-de-France_Annuel-Definitif_2018"

# timestamp
hours = np.loadtxt(trait_dir + filename + '.hours')
# puissance
data = np.loadtxt(trait_dir + filename + '.data')

# intervalle de temps à représenter
# mettre dt = [ 0 ] pour avoir l'ensemble de la série
t0 = 24*30 # en heure, jour 30 = 34*30
tend = 24*35 # en heure, jour 31 = 34*31
dt = [t0,tend]

# quelle source représenter
# 0 :: consommation
# 1 :: 'Nucleaire'
# 2 :: 'Eolien'
# 3 :: 'Solaire'
# 4 :: 'Hydraulique'
source = 3

if len(dt) == 1:
    queldata = data[ source, : ]
    periode = hours[ : ]

elif  len(dt) == 2:
    queldata = data[ source,  (hours > dt[0]) &  (hours < dt[1]) ]
    periode = hours[ (hours > dt[0]) &  (hours < dt[1]) ]

# exemple de figure obtenue avec les données
figname = ["Consommation", "Nucleaire", "Eolien", "Solaire", "Hydraulique"]
figname = figname[source]
plt.close(figname)
plt.figure(figname)
plt.plot( periode, queldata, '-')
plt.xlabel('Temps [unités ?]')
plt.ylabel('Puissance [unités ?]')

plt.show(block=False)

# pour enregistrer la figure:
#plt.savefig(save_plot + filename + '_' + figname)

print('')
print(' fichier utilisé: ' + filename)
print(' source utilisée ' + str(source) + '\n')
print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne : ' + str(np.mean(queldata)))
print('ecart type : ' + str( np.std(queldata)))
