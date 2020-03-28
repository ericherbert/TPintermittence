
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

def relative_variation( queldata):
    # calcul de la variation temporelle sur dt pas de temps
    # Choisir le  décalage temporel dt à utiliser ?
    # attention à vérifer l'incrément de temps sur le fichier horaire !
    dt = 8
    queldata = (queldata[ dt:: ] - queldata[ :-dt: ]) / np.mean(queldata)
    return queldata

def correlation_simple( a, b):
    # fonction qui compare le signe de 2 vecteurs et associe un 1 s'il sont identiques, 0 autrement
    c = np.sign(a) == np.sign(b)
    print(" Nombre d'occurence où le signe de la dérivée de la consommation et celui de la production sont identiques : ")
    print( np.size(c) )
    return c


print('== \t nucléaire')
correlation_simple( relative_variation( Consommation ) , relative_variation( nucleaire ))

print('== \t Éolien')
correlation_simple( relative_variation( Consommation ) , relative_variation( Wind ))

print('== \t nucléaire')
correlation_simple( relative_variation( Consommation ) , relative_variation( PV ))

figname = " Séries temporelle normalisées"
plt.close(figname)
plt.figure(figname)
plt.plot( Consommation / np.mean(Consommation))
plt.plot( nucleaire / np.mean(nucleaire) )
plt.plot( Wind / np.mean(Wind) )

plt.show(block=False)

