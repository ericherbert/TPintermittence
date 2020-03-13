
import numpy as np
import matplotlib.pyplot as plt


trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018"


hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

queldata = data[ 1, :]
periode = hours

# exemple de figure obtenue avec les données
figname = "Consommation"
plt.close(figname)
plt.figure(figname)
plt.plot( periode, queldata, '-')
plt.xlabel('Temps [unités ?]')
plt.ylabel('Puissance [unités ?]')

plt.show(block=False)

# pour enregistrer la figure:
# plt.savefig(figname)

print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( np.mean(queldata))
print('ecart type')
print( np.std(queldata))
