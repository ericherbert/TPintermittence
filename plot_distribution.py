import numpy as np
import matplotlib.pyplot as plt
import scipy.stats


trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Annuel-Definitif_2018"

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

periode = hours
queldata = data[ 1, :]
queldata = np.diff( queldata / np.mean(queldata))

# exemple de figure obtenue avec les données
figname = " temp "
plt.close(figname)
plt.figure(figname)
# bins = seuillage
# log = axes logarithmiques
# density = normalisation pdf telle que int (distribution) = 1
plt.hist( queldata , bins=100, log=1, density=1 )
#plt.xlabel('Temps [unités ?]')
#plt.ylabel('Puissance [unités ?]')

x_min = np.min(queldata)
x_max = np.max(queldata)

mean = np.mean(queldata)
std = np.std(queldata)

x = np.linspace(x_min, x_max, 100)
y = scipy.stats.norm.pdf( x, mean, std)
#plt.plot( x, y, color='coral')

yy = 1/(std * np.sqrt(2 * np.pi)) *np.exp( - (x - mean)**2 / (2 * std**2) )
plt.plot(x, yy / np.max(yy) , linewidth=2, color='r')


plt.show(block=False)

print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( np.mean(queldata))
print('ecart type')
print( np.std(queldata))
