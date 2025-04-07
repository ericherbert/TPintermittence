

import numpy as np

def covariance(x,y):
    # covariance sans décalage temporel
    mean_x = np.mean(x)
    mean_y = np.mean(y)
    cov = np.mean( (x-mean_x) * (y-mean_y) )
    return cov
    
    
def correlation( a, v):
    cor = np.correlate( a, v, "same")
    return cor
    
    
def derivee(hours, a):
    dt = 2
    d = (a[ dt:: ] - a[ :-dt: ]) / dt / (hours[1]-hours[0])
    return d
