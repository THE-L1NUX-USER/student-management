FROM python:3.8
RUN mkdir /code
WORKDIR /code
COPY . /code/
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
