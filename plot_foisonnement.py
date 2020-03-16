import numpy as np
import matplotlib.pyplot as plt
import scipy.stats



def plot_temporelle( queldata, hours):
    # exemple de figure obtenue avec les données
    figname = " série temporelle "
    plt.close(figname)
    plt.figure(figname)
    plt.plot( hours, queldata )


def plot_hist( queldata, draw_normal):
    # exemple de figure obtenue avec les données
    figname = " distribution "
    plt.close(figname)
    plt.figure(figname)
    # bins = seuillage
    # log = axes logarithmiques
    # density = normalisation pdf telle que int (distribution) = 1
    plt.hist( queldata , bins=100, log=1, density=1 )

    if draw_normal:
        x_min = np.min(queldata)
        x_max = np.max(queldata)

        mean = np.mean(queldata)
        std = np.std(queldata)

        x = np.linspace(x_min, x_max, 100)
        y = scipy.stats.norm.pdf( x, mean, std)
        #plt.plot( x, y, color='coral')
        
        yy = 1/(std * np.sqrt(2 * np.pi)) *np.exp( - (x - mean)**2 / (2 * std**2) )
        plt.plot(x, yy , linewidth=2, color='r')

    return


# incrément de temps pour de la variation 
dt = 48

trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Annuel-Definitif_2018"

hours = np.loadtxt(trait_dir + filename + '.hours')
data = np.loadtxt(trait_dir + filename + '.data')

periode = hours

trait_dir = "./TRAITEMENTS/" # repertoire
filename = "eCO2mix_RTE_Annuel-Definitif_2018"

# choisir la source  à représenter
source = 3
queldata2 = data[ source, :]
source = 3
queldata3 = data[ source, :]

queldata = queldata2 + queldata3
plot_temporelle( queldata, hours)

# écart type que la distribution considérée
draw_normal = True

# choisir l'intervale temporel de temps pour évaluation
# de la variation de production de puissance 
dt = 48
queldata = ( queldata[dt:
                      :] - queldata[0:-dt:] ) / np.mean(queldata)

plot_hist( queldata, draw_normal)


#plt.xlabel('Temps [unités ?]')
#plt.ylabel('Puissance [unités ?]')

plt.show(block=False)
