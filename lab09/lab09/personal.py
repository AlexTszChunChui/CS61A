def every_m_ints_to(n, m):
    i = 0
    while (i <= n):
        yield i
        i += m

def every_3_ints_to_10():
    for item in every_m_ints_to(10, 3):
        yield item

a = every_m_ints_to(10, 3)
b = every_3_ints_to_10()

print(list(b))
print(list(b))