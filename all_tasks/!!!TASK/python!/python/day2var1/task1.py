n = int(input())
student_marks = {}
for i in range(n):
    name, *args = input().split()
    rezult_mark = sum(list(map(float, args))) / 3
    a = {name: rezult_mark}
    student_marks.update(a)
entered_name = input()
print('%.2f' % student_marks[entered_name])
