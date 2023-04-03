

import numpy as np

def covariance(x,y):
    mean_x = np.mean(x)
    mean_y = np.mean(y)
    cov = np.mean( (x-mean_x) * (y-mean_y) )
    return cov
    
    
def correlation(x,y):
# alternativement vous pouvez utiliser la fonction np.correlate
    cov = covariance(x,y)
    std_x = np.std(x)
    std_y = np.std(y)
    r = cov / std_x / std_y
    return r
