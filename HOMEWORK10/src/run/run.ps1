# Prerequisites
# pip -m venv env
# env/Scripts/Activate.ps1

pip list
pip install -r .\requirements.txt
flask run

# in other window run
python .\test_requests.py