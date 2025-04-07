
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
import os



# ---- PARAMS ---- 
data_dir = "./DATA/" # repertoire des donnees
trait_dir =  data_dir # repertoire des sorties

#filename = "eCO2mix_RTE_Annuel-Definitif_2018.csv"
#filename = "eCO2mix_RTE_Hauts-de-France_Annuel-Definitif_2018.csv"
#filename = "eCO2mix_RTE_Annuel-Definitif_2020.csv"
filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018.csv"

hours_delimiter = ':'
date_delimiter = '-'




data = np.genfromtxt( data_dir + filename,
                         delimiter=',', 
                         deletechars='�', 
                         skip_footer=1,
                         names=True )
#data = data[0::2,:]
Horaire = np.loadtxt( data_dir + filename, dtype=str, usecols=(2,3), delimiter=',' )

print('')
print('Le programme open_data.py charge des données d"un fichier .csv\npour enregistrer deux fichiers, contenant le temps et\nles puissances associées à la consommation, à l"éolien, au solaire\net à l"hydraulique.\nLe programme est adapté aux fichiers tels que vous les trouverez\nsur le site de RTE. Cependant les paramètres sont peuvent être à ajuster  ')


print('')
print('PARAMETRES :')
print( filename)
print('2 fichiers sont sauvegardés:')
print('-- le temps dans *hours*')

def yyyymmddhhmm_hours( yyyymmdd, hhmm):
    # récupération données
    inc = 0
    h = np.array(hhmm[inc].split( hours_delimiter ), dtype=np.int32)
    d = np.array(yyyymmdd[inc].split( date_delimiter ), dtype=np.int32)
    t0 = datetime(year=d[0], month=d[1], day=d[2], hour=h[0], minute=h[1])

    hours = np.array([])
    for inc in range(len(hhmm)) :
        h = np.array(hhmm[inc].split( hours_delimiter ), dtype=np.int32)
        d = np.array(yyyymmdd[inc].split( date_delimiter ), dtype=np.int32)
        t = datetime(year=d[0], month=d[1], day=d[2], hour=h[0], minute=h[1])
        td = (t - t0) / timedelta(days=1) * 24
        hours = np.append( hours, td)

    return hours

def nettoyage_donnees(hours,data):
    print('-- les données sont dans *data* qui contient:')
    ref = ~np.isnan(data['Consommation'])
    hours = hours[ref]
    inc = 0
    do = ['Consommation','Nucleaire','Eolien','Solaire','Hydraulique']
    data2 = np.zeros(( len(do), np.sum(ref) ))
    for key in data.dtype.names:
        if key in do:
            print('colonne ' + str(inc) +  ' == ' + key)
            data2[inc,:] = data[key][ref]
            inc += 1

    data = data2
    return data, hours



hours = yyyymmddhhmm_hours( Horaire[1:-1,0], Horaire[1:-1,1] )

data, hours = nettoyage_donnees( hours, data)

if not os.path.isdir(trait_dir):
    os.makedirs(trait_dir)

np.savetxt( trait_dir + filename[:-3] + 'data' , data)
np.savetxt( trait_dir + filename[:-3] + 'hours' , hours)

