from flask import Flask, request, jsonify
import core

app_student = Flask(__name__)

# Routes
@app_student.route('/students', methods=['GET'])
def get_students():
    students = core.read_students()
    return jsonify(students)

@app_student.route('/students/<int:student_id>', methods=['GET'])
def get_student_by_id(student_id):
    student = core.find_student_by_id(student_id)
    if student:
        return jsonify(student)
    else:
        return jsonify({'error': 'Student not found'}), 404

@app_student.route('/students/last_name/<last_name>', methods=['GET'])
def get_students_by_last_name(last_name):
    students = core.find_students_by_last_name(last_name)
    if students:
        return jsonify(students)
    else:
        return jsonify({'error': 'Students with last name not found'}), 404

@app_student.route('/students', methods=['POST'])
def create_student():
    data = request.json
    
    if not data or not all(field in data for field in ['first_name', 'last_name', 'age']):
        return jsonify({'error': 'Invalid request body'}), 400

    students = core.read_students()
    new_student = {
        'id': len(students) + 1,
        'first_name': data['first_name'],
        'last_name': data['last_name'],
        'age': data['age']
    }
    students.app_studentend(new_student)
    core.write_students(students)
    return jsonify(new_student), 201

@app_student.route('/students/<int:student_id>', methods=['PUT'])
def update_student(student_id):
    data = request.json
    if not data or not any(field in data for field in ['first_name', 'last_name', 'age']):
        return jsonify({'error': 'Invalid request body'}), 400

    students = core.read_students()
    index, student = core.find_student_by_id(students, student_id)

    if not student or index == -1:
        return jsonify({'error': 'Student not found'}), 404

    if 'first_name' in data:
        student['first_name'] = data['first_name']
    if 'last_name' in data:
        student['last_name'] = data['last_name']
    if 'age' in data:
        student['age'] = data['age']

    students[index] = student

    core.write_students(students)

    return jsonify(student)

@app_student.route('/students/<int:student_id>', methods=['PATCH'])
def update_student_age(student_id):
    data = request.json
    if not data or 'age' not in data:
        return jsonify({'error': 'Invalid request body'}), 400

    students = core.read_students()
    index, student = core.find_student_by_id(students, student_id)

    if not student or index == -1:
        return jsonify({'error': 'Student not found'}), 404

    student['age'] = data['age']
    
    students[index] = student
    
    core.write_students(students)
    return jsonify(student)

@app_student.route('/students/<int:student_id>', methods=['DELETE'])
def delete_student(student_id):
    students = core.read_students()
    index, student = core.find_student_by_id(students, student_id)

    if not student or index == -1:
        return jsonify({'error': 'Student not found'}), 404

    changed_students = [s for s in students if int(s['id']) != student_id]
    core.write_students(changed_students)
    return jsonify({'message': 'Student deleted successfully'})

if __name__ == '__main__':
    app_student.run(debug=True)