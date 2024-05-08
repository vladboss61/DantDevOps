import os
import csv

STUDENTS_CSV = 'students.csv'
FIELDNAMES = ['id', 'first_name', 'last_name', 'age']

def read_students():
    if not os.path.exists(STUDENTS_CSV):
        return []
    with open(STUDENTS_CSV, 'r', newline='') as file:
        reader = csv.DictReader(file)
        students = list(reader)
    return students

def write_students(students):
    with open(STUDENTS_CSV, 'w', newline='') as file:
        writer = csv.DictWriter(file, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(students)

def find_student_by_id(students, student_id):
    for index, student in enumerate(students):
        if int(student['id']) == student_id:
            return index, student
    return -1, None

def find_students_by_last_name(last_name):
    students = read_students()
    return [student for student in students if student['last_name'] == last_name]