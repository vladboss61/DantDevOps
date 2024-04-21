PART 1: Develop a REST API
Functionalities
Develop a REST API for student management in Python using the Flask library named app.py, with data persistence in a students.csv file. The API should support GET, POST, PUT, PATCH, and DELETE requests. Each student should have fields for id, first name, last name, and age.

HTTP Requests
GET
Retrieve information about a specific student (display all available information):
By their ID; if the provided ID is not found in the CSV file, return an error.
By their last name; if there are multiple students with the same last name, display all of them; if the provided last name is not found in the CSV file, return an error.
Retrieve a list of all students (display all available information).
POST
Create a new student.

The ID field should be automatically generated with an increment of +1.
The POST request body should include first name, last name, and age.
If a non-existing field is passed in the POST body or if no fields are passed at all, return an error.
If any of the fields are missing in the POST body, return an error without writing to the CSV file.
Upon successful request, return information about the added student.
PUT
Update student information by their ID.

It should be possible to update the fields first name, last name, and age.
If the provided ID is not found in the CSV file, return an error.
The PUT request body should include first name, last name, and age accordingly.
If a non-existing field is passed in the PUT body or if no fields are passed at all, return an error.
Upon successful request, return the updated information about the student.
PATCH
Update a student's age by their ID.

It should be possible to update the age field.
If the provided ID is not found in the CSV file, return an error.
The PATCH request body should include the age.
If a non-existing field is passed in the PATCH body or if no fields are passed at all, return an error.
Upon successful request, return the updated information about the student.
DELETE
Delete a student from the CSV file by their ID.

If the provided ID is not found in the CSV file, return an error.
Upon successful request, return a message confirming the successful deletion of the student.
PART 2: Create test_requests.py
Functionalities
Create a test_requests.py file to verify the created REST API. In this file, demonstrate the functionality of all methods using the requests library in the following sequence:

Retrieve all existing students (GET).
Create three students (POST).
Retrieve information about all existing students (GET).
Update the age of the second student (PATCH).
Retrieve information about the second student (GET).
Update the name and last name of the third student (PUT).
Retrieve information about the second student (GET).
Retrieve all existing students (GET).
Delete the first user (DELETE).
Retrieve all existing students (GET).
Display the execution results in the console and write them to the results.txt file.