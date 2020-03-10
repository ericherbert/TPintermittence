
import numpy as np
import matplotlib.pyplot as plt

hours = np.loadtxt('hours')
data = np.loadtxt('data')

queldata = data[3,:]
periode = hours

# exemple de figure obtenue avec les données
figname = "Consommation"
plt.close(figname)
plt.figure(figname)
plt.plot( periode, queldata,'o')
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
