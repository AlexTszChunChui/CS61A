def count_stair_ways(n):
    if n < 0:
        return 0
    elif n <= 1:
        return 1
    return count_stair_ways(n-1) + count_stair_ways(n-2)



def count_k(n, k):
    if n < 0:
        return 0
    elif n <= 1:
        return 1
    elif k == 1:
        return 1
    i = 1
    total = 0
    while i <= k:
        total += count_k(n-i, k)
        i += 1
    return total

print(count_k(10, 3))

def even_weighted(s):
    
   return [x * s.index(x) for x in s if s.index(x) % 2 == 0]


def max_product(s):
    if len(s) == 0:
        return 1
    use1 = s[0] * max_product(s[2:])
    use2 = max_product(s[1:])

    if use1 > use2:
        return use1
    return use2

