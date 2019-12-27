a = int(input())


def factorial(a):
    if a == 0:
        a = 1
    else:
        a = a * factorial(a - 1)
    return a


rezult = factorial(a)
print(rezult)
