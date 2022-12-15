FROM python:3.8
RUN mkdir /code
WORKDIR /code
RUN pip install virtualenv
#RUN virtualenv venv
COPY . /code/
#RUN python3 -m venv /opt/venv
#RUN source venv/Scripts/activate
RUN pip install -r requirements.txt
RUN python manage.py makemigrations
RUN python manage.py migrate
RUN python manage.py createsuperuser
CMD ["python","manage.py","runserver","0.0.0.0:8000"]
