import numpy as np
def maceps(epsmac):
    epsmac[0] = 1.0
    epsmac[1] = 1.0
    while True:
        epsmac[0] = epsmac[0] * 0.5
        if epsmac[1]+epsmac[0] <= epsmac[1]:
            break
    epsmac[0] = epsmac[0] * 2    
    return

epsmac = np.array([0,0],dtype=np.float32)

maceps(epsmac)

print ("%.8E" % epsmac[0])
print("%.8E" % np.finfo(np.float32).eps)
