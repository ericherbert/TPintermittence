
import numpy as np
import matplotlib.pyplot as plt


trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018"


hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

# intervalle de temps à représenter
# mettre dt = [ 0 ] pour avoir l'ensemble de la série
# mettre dt = [ 100, 200] pour avoir l'intervalle 100->200
dt = [24*30,24*2*30]

# quelle source représenter
source = 1

if len(dt) == 1:
    queldata = data[ source, : ]
    periode = hours[ : ]

elif  len(dt) == 2:
    queldata = data[ source,  (hours > dt[0]) &  (hours < dt[1]) ]
    periode = hours[ (hours > dt[0]) &  (hours < dt[1]) ]

# exemple de figure obtenue avec les données
figname = "Consommation"
plt.close(figname)
plt.figure(figname)
plt.plot( periode, queldata, '-')
plt.xlabel('Temps [unités ?]')
plt.ylabel('Puissance [unités ?]')

plt.show(block=False)

# pour enregistrer la figure:
#plt.savefig(trait_dir + figname)

print('')
print(' fichier utilisé: ' + filename)
print(' source utilisée ' + str(source) + '\n')
print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne : ' + str(np.mean(queldata)))
print('ecart type : ' + str( np.std(queldata)))
