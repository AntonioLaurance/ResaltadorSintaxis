# coalision.py
# Ricardo Campos Luna
# August 26th class (Modular Programming)

import math

def distance(a, b, c, d, e, f):
    dx = d - a
    dy = e - b
    dz = f - c
    return math.sqrt(dx ** 2 + dy ** 2 + dz ** 2)


def inCollision(x1, y1, z1, r1, x2, y2, z2, r2):
    sumR = r1 + r2
    d = distance(x1, y1, z1, x2, y2, z2)
    if d <= sumR:
        return True
    else:
        return False
    
ux = float(input("Enter ux: "))

crash = inCollision(ux, 7.5, 2.2, 5.13, -3.1, -2.2, 0.98, 3.7)
print(crash)

crash = inCollision(3.1, 7.5, 2.2, 7.13, -3.1, -2.2, 0.98, 3.7)
print(crash)
