


ID=input("Enter your ID: ")
GPA=float(input("Enter your GPA: "))
Semester=int(input("Enter your Semester: "))

file=open("grades.txt","a")

if GPA <= 2.5 or GPA >= 4 or Semester < 1 or Semester > 8 or len(ID) >= 11:
    print("Invalid input")
else:
    file.write(ID + ";" + str(GPA) + ";" + str(Semester) + "\n")
    file.close()
    print("Your GPA has been added to the file")





