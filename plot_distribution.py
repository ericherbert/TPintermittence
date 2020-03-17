import numpy as np
import matplotlib.pyplot as plt
#import scipy.stats

#hours = np.loadtxt('hours')
#data = np.loadtxt('data')

trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018"

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

periode = hours
# Quelle source utiliser ?
source = 3
queldata = data[ source,:]
# Quel décalage temporel utiliser ?
# attention à vérifer l'incrément de temps sur le fichier horaire !
dt = 2
queldata = (queldata[ dt:: ] - queldata[ :-dt: ]) / np.mean(queldata)
# ajouter une gaussienne de même moyenne et écart type que la distribution ?
plot_gaussienne = True
mean = np.mean( queldata) # moyenne de la gaussienne
std = np.std( queldata) # écart type de la gaussienne



# exemple de figure obtenue avec les données
figname = " distribution "
plt.close(figname)
plt.figure(figname)
# bins = seuillage
# log = axes logarithmiques
# density = normalisation pdf telle que int (distribution) = 1
plt.hist( queldata  , bins=100, log=1, density=1 )
plt.xlabel('Abs [unités ?]')
plt.ylabel('Ord [unités ?]')

if plot_gaussienne:
    # paramètres de la gaussienne
    x_min = np.min( queldata)
    x_max = np.max( queldata)
    xx = np.linspace( x_min, x_max, 100)
    yy = 1 / (std * np.sqrt(2 * np.pi)) * np.exp( - (xx - mean)**2 / (2 * std**2) )
    plt.plot( xx, yy  , linewidth=2, color='r')


plt.show(block=False)

print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( mean)
print('ecart type')
print( std )
