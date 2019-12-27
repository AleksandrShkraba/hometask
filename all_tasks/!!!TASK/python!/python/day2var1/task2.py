from itertools import zip_longest

print("write first list")
line = input()
keylist = line.split(' ')
print("write second list")
line2 = input()
valuelist = line2.split(' ')
if len(keylist) < len(valuelist):
    n = len(valuelist) - len(keylist)
    valuelist = valuelist[:len(valuelist) - n]
rezult = dict(zip_longest(keylist, valuelist))
print(rezult)
