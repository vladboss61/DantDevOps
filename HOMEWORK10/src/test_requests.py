import pytest
from flask import Flask, jsonify, request

# Mock data for testing
students = [
    {'id': 1, 'first_name': 'John', 'last_name': 'Doe', 'age': 25},
    {'id': 2, 'first_name': 'Alice', 'last_name': 'Smith', 'age': 30},
    {'id': 3, 'first_name': 'Bob', 'last_name': 'Johnson', 'age': 35}
]

@pytest.fixture
def app():
    app = Flask(__name__)
    
    # Routes for the mock server
    @app.route('/students', methods=['GET'])
    def get_students():
        return jsonify(students)

    @app.route('/students/<int:student_id>', methods=['GET'])
    def get_student(student_id):
        student = next((s for s in students if s['id'] == student_id), None)
        if student:
            return jsonify(student)
        else:
            return jsonify({'error': 'Student not found'}), 404

    @app.route('/students', methods=['POST'])
    def create_student():
        data = request.json
        if not data or not all(field in data for field in ['first_name', 'last_name', 'age']):
            return jsonify({'error': 'Invalid request body'}), 400

        new_student = {
            'id': max(s['id'] for s in students) + 1,
            'first_name': data['first_name'],
            'last_name': data['last_name'],
            'age': data['age']
        }
        students.append(new_student)
        return jsonify(new_student), 201

    @app.route('/students/<int:student_id>', methods=['PUT'])
    def update_student(student_id):
        data = request.json
        student = next((s for s in students if s['id'] == student_id), None)
        if not student:
            return jsonify({'error': 'Student not found'}), 404

        student.update(data)
        return jsonify(student)

    @app.route('/students/<int:student_id>', methods=['DELETE'])
    def delete_student(student_id):
        delete_students = [s for s in students if s['id'] != student_id]
        return jsonify({'message': 'Student deleted successfully'})

    return app

# Tests
def test_retrieve_all_students(client):
    response = client.get('/students')
    assert response.status_code == 200

def test_create_student(client):
    data = {'first_name': 'New', 'last_name': 'Student', 'age': 40}
    response = client.post('/students', json=data)
    assert response.status_code == 201

def test_update_student(client):
    data = {'age': 45}
    response = client.put('/students/1', json=data)
    assert response.status_code == 200

def test_delete_student(client):
    response = client.delete('/students/2')
    assert response.status_code == 200