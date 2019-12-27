a = input().split()
b, c = map(int, a)

for i in range(b):
    pattern = ".|."
    if i < (b - 1) / 2:
        print((pattern * (2 * i + 1)).center(c, "-"))
    elif i == (b - 1) / 2:
        print("WELCOME".center(c, "-"))
    else:
        print((pattern * (2 * (b - 1 - i) + 1)).center(c, "-"))
