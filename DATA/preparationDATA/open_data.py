
import numpy as np
import matplotlib.pyplot as plt
from datetime import datetime, timedelta
import os


data_dir = "./DATA/preparationDATA/" # repertoire des donnees
trait_dir = "./TRAITEMENTS/" # repertoire des sorties

#filename = "eCO2mix_RTE_Annuel-Definitif_2018.csv"
#filename = "eCO2mix_RTE_Hauts-de-France_Annuel-Definitif_2018.csv"
#filename = "eCO2mix_RTE_Occitanie_Annuel-Definitif_2018.csv"
filename = "data_type_RTE.csv"




data = np.genfromtxt( data_dir + filename, delimiter=',', deletechars='�', names=True )
#data = data[0::2,:]
Horaire = np.loadtxt( data_dir + filename, dtype=str, usecols=(2,3), delimiter=',' )

print('')

print( filename)
print('2 fichiers sont sauvegardés:')
print('-- le temps dans *hours*')

def yyyymmddhhmm_hours( yyyymmdd, hhmm):
    # récupération données
    inc = 0
    h = np.array(hhmm[inc].split(':'), dtype=np.int)
#    d = np.array(yyyymmdd[inc].split('-'), dtype=np.int)
    d = np.array(yyyymmdd[inc].split('/'), dtype=np.int)
    print(d)
#    t0 = datetime(year=d[0], month=d[1], day=d[2], hour=h[0], minute=h[1])
    t0 = datetime(day=d[0], month=d[1], year=d[2], hour=h[0], minute=h[1])
    
    
    hours = np.array([])
    for inc in range(len(hhmm)) :
        h = np.array(hhmm[inc].split(':'), dtype=np.int)
#        d = np.array(yyyymmdd[inc].split('-'), dtype=np.int)
        d = np.array(yyyymmdd[inc].split('/'), dtype=np.int)
#        t = datetime(year=d[0], month=d[1], day=d[2], hour=h[0], minute=h[1])
        t = datetime(day=d[0], month=d[1], year=d[2], hour=h[0], minute=h[1])
        td = (t - t0) / timedelta(days=1) * 24
        hours = np.append( hours, td)

    return hours

def nettoyage_donnees(hours,data):
    print('-- les données sont dans *data* qui contient:')
    ref = ~np.isnan(data['Consommation'])
    hours = hours[ref[:-1]]
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

