import numpy as np
import matplotlib.pyplot as plt


# repertoire des données
trait_dir = "./DATA/" 
# repertoire de sauvegarde des plots
save_plot = "./plots/" 
# data utilisées
filename = "eCO2mix_RTE_Hauts-de-France_Annuel-Definitif_2018"

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

# quelle source représenter
# 0 :: consommation
# 1 :: 'Nucleaire'
# 2 :: 'Eolien'
# 3 :: 'Solaire'
# 4 :: 'Hydraulique'
source = 0
# histogramme
queldata = data[ source,:]
# calcul autocorrelation

mean = np.mean( queldata) # moyenne de la gaussienne
std = np.std( queldata) # écart type de la gaussienne

# exemple de figure obtenue avec les données
figname = ["Consommation", "Nucleaire", "Eolien", "Solaire", "Hydraulique"]
figname = " distribution_" + figname[source]

plt.close(figname)
plt.figure(figname)
# bins = seuillage
# log = axes logarithmiques
# density = normalisation pdf telle que int (distribution) = 1
#plt.hist( queldata , log=1, density=1 )
plt.hist( queldata  , log=1, density=1 )

# Tracé de la gaussienne
x = np.linspace(mean - 4*std, mean + 4*std, 1000)
y = (1 / (std * np.sqrt(2 * np.pi))) * np.exp(-0.5 * ((x - mean) / std) ** 2)
plt.plot(x, y, 'r', linewidth=1.5, label=f'Gaussienne\nmoyenne={round(mean,1)}\nécart type={round(std,1)}')
plt.xlabel('Abs [unités ?]')
plt.ylabel('Ord [unités ?]')
plt.legend()
# pour enregistrer la figure:
#plt.savefig(save_plot + filename + '_' + figname)

plt.show(block=False)

print('')
print(' fichier utilisé: ' + filename)
print(' source utilisée ' + str(source) + '\n')
print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( mean)
print('ecart type')
print( std )
