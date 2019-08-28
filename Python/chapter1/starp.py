import numpy as np
import matplotlib.pyplot as plt

ONE = np.array((1.0),dtype=np.float32)
ev = np.arctan(ONE,dtype=np.float32)

h, s, err, alerr = np.array([0.0, 0.0, 0.0, 0.0],dtype=np.float32)

# 計算用 1.0, 0.5, 0.0, -9.9の単精度浮動小数点数
tmp = np.array([1.0, 0.5, 0.0, -9.9],dtype=np.float32)

# グラフ描画用リスト
x = []
y = []

print("--- TRAP ---")

for k in range(13):
    n = np.power(2,k+1)
    h = tmp[0] / n.astype(np.float32)
    s = tmp[1] * (tmp[0] + tmp[1])
    
    for i in range(n-1):
        s = s + tmp[0] / (tmp[0] + np.square(h*(i+1),dtype=np.float32))  
        
    s = s * h
    err = s - ev

    if err != tmp[2]:
        alerr = np.log10(np.abs(err))
    else:
        alerr = tmp[3]

    print("N=%6d　H=%9.2E　S=%13.6E　ERR=%8.1E　L(ERR)=%4.1F" % (n, h, s, err, alerr))
    
    # グラフ用変数セット
    x.append(k+1)
    y.append(alerr)

# グラフ描画
fig, ax = plt.subplots()
ax.scatter(x,y)
ax.set_xlabel("n (1/2^n)")
ax.set_ylabel("l (10^l)")
plt.show()