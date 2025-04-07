import numpy as np
import matplotlib.pyplot as plt


# repertoire des données
trait_dir = "./DATA/" 
# repertoire de sauvegarde des plots
save_plot = "./plots/" 
# data utilisées
filename = "eCO2mix_RTE_Hauts-de-France_Annuel-Definitif_2018"

def covariance(x,y):
    # covariance sans décalage temporel
    mean_x = np.mean(x)
    mean_y = np.mean(y)
    cov = np.mean( (x-mean_x) * (y-mean_y) )
    return cov
    
    
def correlation( a, v):
    # pour faire le calcule de l'autocorrelation 
    # du vecteur a: autocor = np.correlation( a, a, "same")
    cor = np.correlate( a, v, "full")
    return cor
    
    
def derivee(hours, a):
    dt = 2
    d = (a[ dt:: ] - a[ :-dt: ]) / dt / (hours[1]-hours[0])
    return d

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

# quelle source représenter
# 0 :: consommation
# 1 :: 'Nucleaire'
# 2 :: 'Eolien'
# 3 :: 'Solaire'
# 4 :: 'Hydraulique'
source = 2
# histogramme
queldata = data[ source,:]
# calcul autocorrelation
queldata = correlation( queldata, queldata) 
queldata = queldata[queldata.size // 2:]

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
plt.plot( queldata  )
plt.xlabel('Abs [unités ?]')
plt.ylabel('Ord [unités ?]')

# pour enregistrer la figure:
plt.savefig(save_plot + filename + '_' + figname)

#plt.show(block=False)

print('')
print(' fichier utilisé: ' + filename)
print(' source utilisée ' + str(source) + '\n')
print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( mean)
print('ecart type')
print( std )
