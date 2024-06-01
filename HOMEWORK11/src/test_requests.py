import requests as rq
import json

URL = "http://127.0.0.1:8000/"
HEADERS = {
    'Content-Type':'application/json',
}

if __name__ == "__main__":
    print("Request to Students API")

    print("GET - No Students:")
    print(rq.get(URL + "students").json())
    
    new_student = {
        'first_name': 'Vlad',
        'last_name': 'Delas',
        'age': '26'
    }

    print("POST Student 1:")
    rq.post(URL + "students", data=json.dumps(new_student), headers=HEADERS)

    print(rq.get(URL + "students").json())
    second_new_student = {
        'first_name': 'Vlad',
        'last_name': 'Delas',
        'age': '26'
    }

    print("Post Student 2:")
    rq.post(URL + "students", data=json.dumps(second_new_student), headers=HEADERS)

    print(rq.get(URL + "students").json())

    age_patch = {
        'age': '29'
    }
    
    print("PATCH Student 1:")
    print(rq.patch(URL + "students/1", data=json.dumps(age_patch), headers=HEADERS).json())
    print(rq.get(URL + "students").json())

    print("PUT Student 1:")
    put_new_student = {
        'first_name': 'Jon',
        'last_name': 'Doe',
        'age': '33'
    }
        
    print(rq.put(URL + "students/1", data=json.dumps(put_new_student), headers=HEADERS).json())
    print(rq.get(URL + "students").json())

    print("Delete Student 1:")
    print(rq.delete(URL + "students/1", headers=HEADERS).json())
    print(rq.get(URL + "students").json())