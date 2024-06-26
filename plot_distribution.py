import numpy as np
import matplotlib.pyplot as plt


trait_dir = "./DATA/" # repertoire de traitement
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018"

def covariance(x,y):
    # covariance sans décalage temporel
    mean_x = np.mean(x)
    mean_y = np.mean(y)
    cov = np.mean( (x-mean_x) * (y-mean_y) )
    return cov
    
    
def correlation( a, v):
    cor = np.correlate( a, v, "same")
    return cor
    
    
def derivee(hours, a):
    dt = 2
    d = (a[ dt:: ] - a[ :-dt: ]) / dt / (hours[1]-hours[0])
    return d

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

periode = hours
# Quelle source utiliser ?
source = 3
queldata = data[ source,:]
queldata = queldata 
queldata = derivee(hours,queldata) 

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

print('')
print(' fichier utilisé: ' + filename)
print(' source utilisée ' + str(source) + '\n')
print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( mean)
print('ecart type')
print( std )
