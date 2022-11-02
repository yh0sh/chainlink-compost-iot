FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python3
RUN apt-get install -y python3-pip

RUN pip3 install flask
RUN pip3 install --upgrade flask
RUN pip3 install -U flask-cors
RUN apt-get -y install libpq-dev gcc \
    && pip3 install psycopg2

ENV APP_PATH=/home
WORKDIR $APP_PATH
ENV HOME $APP_PATH

ENV FLASK_APP=app.py

CMD [ "/bin/sh" ]
