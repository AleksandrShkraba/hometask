# a = open('input.txt').read()
a = int(input())


def factorial(a):
    if a == 0:
        a = 1
    else:
        a = a * factorial(a - 1)
    return a


# open('output.txt', 'w').write(str(factorial(a)))
rezult = factorial(a)
print(rezult)
