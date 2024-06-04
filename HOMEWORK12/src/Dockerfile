FROM python:3.10

WORKDIR /code

COPY requirements.txt .

COPY . .

EXPOSE 8000
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

ENTRYPOINT ["gunicorn", "-b", "0.0.0.0:8000"]
CMD [ "flask_app:app_student" ]