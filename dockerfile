FROM ubuntu

WORKDIR /app1

COPY requirements1.txt /app1/
COPY . /app1

RUN apt-get update && \
    apt-get -y install python3 && \
    apt-get -y install $(cat requirements1.txt)

ENTRYPOINT ["python3"]

CMD ["manage.py", "runserver", "0.0.0.0:8000"]


