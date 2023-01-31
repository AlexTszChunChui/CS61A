def multiply(m, n):
    if n == 1:
        return m
    else:
        return multiply(m, n-1) + m

 
# From the last recursion, 1 returned to the second last plus 1, and returned 2 two the next one
def hailstone(n):
    print(n)
    if n == 1:
        return 1
    elif n % 2 == 0:
        return 1 + hailstone(n/2)
    else:
        return 1 + hailstone(n*3 + 1)

def make_func_repeater(f, x):
    def repeater(y):
        if y == 1:
            return f(x)
        else:
            return f(repeater(y-1))
    return repeater

def prime_helper(n, count = 2):
    if n == count:
        return True
    elif n % count == 0:
        return False
    else:
        return prime_helper(n, count + 1)

