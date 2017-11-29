# The idea is to re-write foo(bar(baz(arg))) as apply(arg, foo, bar, baz)
# Inspired by awesom haskell `$` operator: e.g.: foo $ bar $ baz $ arg
#
# >>> apply(0, addOne, addTwo)
# 3
# >>> apply(0, addOne, addTwo, addThree)
# 6

def addOne(x = 0):
    return x + 1

def addTwo(y = 0):
    return y + 2

def addThree(z = 0):
    return z + 3

def keep(val):
    return val

def apply( arg
         , f1 = keep
         , f2 = keep
         , f3 = keep ):
    result = f1(f2(f3(arg)))
    return result
