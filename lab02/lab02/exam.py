def hailstone(n, g):
    if n == 1:
        h = lambda x, y : 1
    
    elif n % 2 != 0:
        h = up

    else:
        h = down
    
    g(n)
    
    return h(n, lambda x: hailstone(x, g))

def up(n, f):
    return 1 + f(3 * n + 1)

def down(n , f):
    return 1 + f(n // 2)

def collide(m, n):
    s = []
    hailstone(m , s.append)
    found = None
    def f(k):
        nonlocal found
        if k in s and found is None:
            found = k
    hailstone(n, f)
    return found

