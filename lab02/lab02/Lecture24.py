def smallest(lst):
    return [i for i in range(len(lst)) if abs(lst[i]) == min([abs(s) for s in lst])]

def largest_adj_ele(lst):
    return max([lst[i] + lst[i+1] for i in range(len(lst) - 1)]) # max([a + b for a, b in zip(s[:-1], s[1:])])

def dict_map(lst):
    return {d: [ele for ele in lst if ele % 10 == d] for d in range(10) if any([ele % 10 == d for ele in lst])}

