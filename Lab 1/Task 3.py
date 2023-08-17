

# Task 3


ID=input("Enter your ID: ")

content=open("studentInfo.txt","r")

lines=content.readlines()

for line in lines:
    if line.split(";")[0]==ID:
        print(line.split(";")[1])


content2=open("grades.txt","r")

lines2=content2.readlines()

for i in range(len(lines2) - 1):
    current_line = lines2[i]
    next_line = lines2[i + 1]

    if current_line.split(";")[0] == ID:
        current_semester = int(current_line.split(";")[2])
        next_semester = int(next_line.split(";")[2])
        current_gpa = float(current_line.split(";")[1])
        next_gpa = float(next_line.split(";")[1])

        if next_gpa < current_gpa:
         current_gpa=next_gpa
         current_semester=next_semester


print(current_semester)
