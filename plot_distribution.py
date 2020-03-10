import numpy as np
import matplotlib.pyplot as plt
import scipy.stats

hours = np.loadtxt('hours')
data = np.loadtxt('data')


periode = hours
queldata = data[4,:]
queldata = np.diff(queldata)


# exemple de figure obtenue avec les données
figname = "wind"
plt.close(figname)
plt.figure(figname)
plt.hist( queldata / np.mean(queldata) , bins=100, log=1 )
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
plt.plot(x, yy / np.max(yy) * 4000, linewidth=2, color='r')


plt.show(block=False)

print('Sur la periode considérée, on releve la moyenne et l ecart type:')
print('moyenne')
print( np.mean(queldata))
print('ecart type')
print( np.std(queldata))
