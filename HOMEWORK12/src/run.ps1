# Prerequisites
# pip -m venv env
# env/Scripts/Activate.ps1

# in src folder execute.
docker build -t flask_st_server .

# then

docker run -p 8000:8000 --name flask_st_server_cnt -i -t flask_st_server

# then using curl

# curl http://127.0.0.1:8000/students
# or in Postman app