def memory(n):
    def f(g):
        nonlocal n
        n = g(n)
        return n
    return f

def group_by(s, fn):
    '''
    >>> group_by([12, 23, 14, 45], lambda p: p // 10)
    {1: [12, 14], 2: [23], 3: [45]}
    '''
    grouped = dict()
    for numb in s:
        key = fn(numb)
        if key in grouped:
            grouped[key].append(numb)
        else:
            grouped[key] = [numb]    
    return grouped

def add_this_many(x, el, s):
    count = 0
    for ele in s:
        if ele == x:
            count = count + 1
    for time in range(count):
        s.append(el)
    return s

def filter(iterable, fn):
    for ele in iterable:
        if fn(ele):
            yield ele

def merge(a, b):
    numbera = next(a)
    numberb = next(b)
    while True:
        if numbera == numberb:
            yield numbera
            numbera = next(a)
            numberb = next(b)
        elif numbera < numberb:
            yield numbera
            numbera = next(a)
        else: 
            yield numberb
            numberb = next(b)

def sequence(start, step):
    while True:
        yield start
        start += step
        