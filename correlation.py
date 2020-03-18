import numpy as np
import matplotlib.pyplot as plt

trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Annuel-Definitif_2018"

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

periode = hours
# Quelle serie temporelle utiliser ?
Consommation = data[0,:]
nucleaire = data[1,:]
Wind = data[2,:]
PV = data[3,:]

def correlation( a, v):

    plt.figure(figname)
    plt.plot( np.correlate( a, v, "full")  )

    plt.xlabel('Abs [unités ?]')
    plt.ylabel('Ord [unités ?]')

def relative_variation( queldata):
    # Quel décalage temporel utiliser ?
    # attention à vérifer l'incrément de temps sur le fichier horaire !
    dt = 2
    queldata = (queldata[ dt:: ] - queldata[ :-dt: ]) / np.mean(queldata)
    # ajouter une gaussienne de même moyenne et écart type que la distribution ?
    mean = np.mean( queldata) # moyenne de la gaussienne
    std = np.std( queldata) # écart type de la gaussienne
    print('')
    print('Sur la periode considérée, on releve la moyenne et l ecart type:')
    print('moyenne')
    print( mean)
    print('ecart type')
    print( std )
    print('')
    return queldata


figname = " intermittence "
plt.close(figname)
#correlation( Consommation / np.mean(Consommation), nucleaire / np.mean(nucleaire) )
#correlation( Consommation / np.mean(Consommation), PV / np.mean(PV) )
#correlation( Consommation / np.mean(Consommation), Wind / np.mean(Wind) )

correlation( relative_variation( Consommation / np.mean(Consommation)), relative_variation( nucleaire / np.mean(nucleaire)) )
correlation( relative_variation( Consommation / np.mean(Consommation)), relative_variation( PV / np.mean(PV)) )
correlation( relative_variation( Consommation / np.mean(Consommation)), relative_variation( Wind / np.mean(Wind)) )


figname = " temp "
plt.close(figname)
plt.figure(figname)
plt.plot( Consommation / np.mean(Consommation))
plt.plot( nucleaire / np.mean(nucleaire) )
plt.plot( Wind / np.mean(Wind) )


plt.show(block=False)

