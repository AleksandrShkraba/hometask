line_1 = int(input())
line_2 = map(int, input().split())
line_3 = int(input())
line_4 = map(int, input().split())
x = set(line_2)
y = set(line_4)
a = x - y
b = y - x
rezult = a.union(b)
rezult = sorted(rezult)
print('\n'.join(map(str, rezult)))
