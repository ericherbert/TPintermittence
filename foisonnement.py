import numpy as np
import matplotlib.pyplot as plt

trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018"


hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')


periode = hours
# Quelle serie temporelle utiliser ?
Wind = data[2,:]
PV = data[3,:]
plot_gaussienne = True


def plot_temporelle( queldata, hours):
    # exemple de figure obtenue avec les données
    figname = " série temporelle "
    plt.close(figname)
    plt.figure(figname)
    plt.plot( hours, queldata )

def relative_variation(queldata):
    # Quel décalage temporel utiliser ?
    # attention à vérifer l'incrément de temps sur le fichier horaire !
    dt = 2
    queldata = (queldata[ dt:: ] - queldata[ :-dt: ]) / np.mean(queldata)
    # ajouter une gaussienne de même moyenne et écart type que la distribution ?
    mean = np.mean( queldata) # moyenne de la gaussienne
    std = np.std( queldata) # écart type de la gaussienne
    if plot_gaussienne:
        # paramètres de la gaussienne
        A = 1 # Préfacteur 
        x_min = np.min( queldata)
        x_max = np.max( queldata)
        xx = np.linspace( x_min, x_max, 100)
        yy = A / (std * np.sqrt(2 * np.pi)) * np.exp( - (xx - mean)**2 / (2 * std**2) )
        plt.plot( xx, yy  , linewidth=2, color='r')

    print('')
    print('Sur la periode considérée, on releve la moyenne et l ecart type:')
    print('moyenne')
    print( mean)
    print('ecart type')
    print( std )
    print('')

    return queldata

def correlation( a, v):

    figname = " foisonnement_correlation "
    plt.close(figname)
    plt.figure(figname)
    plt.plot( np.correlate( a, v, "same")  )

    plt.xlabel('Abs [unités ?]')
    plt.ylabel('Ord [unités ?]')


# exemple de figures obtenue avec les données
figname = " foisonnement_temp "
plt.close(figname)
plt.figure(figname)
plt.plot( hours, Wind     , 'r')
plt.plot( hours, PV      , 'g')
plt.plot( hours, Wind + PV, 'b' )

plt.xlabel('Abs [unités ?]')
plt.ylabel('Ord [unités ?]')

figname = " foisonnement_dist "
plt.close(figname)
plt.figure(figname)
plt.hist( relative_variation( Wind )   , bins=100, log=1, density=1, color='r' )
plt.hist( relative_variation( PV )     , bins=100, log=1, density=1, color='g')
plt.hist( relative_variation( Wind + PV ), bins=100, log=1, density=1, color='b' )

plt.xlabel('Abs [unités ?]')
plt.ylabel('Ord [unités ?]')

correlation( Wind, PV)

plt.show(block=False)

