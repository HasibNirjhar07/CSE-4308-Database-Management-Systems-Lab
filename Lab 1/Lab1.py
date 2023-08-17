

def CalculateAverageGpa(gradesfile):

    content =open(gradesfile,"r")
    lines=content.readlines()
    content.close()

    totalGpa=0

    for line in lines:
        totalGpa+=float(line.split(";")[1])

    AverageGpa=(round(totalGpa/len(lines), 3))

    print(AverageGpa)

CalculateAverageGpa("grades.txt")









