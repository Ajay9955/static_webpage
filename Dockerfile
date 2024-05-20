From pyhton:3.9

WORKDIR /app

COPY requirements.txt/app/

RUN pip install --no-cache-dir -r requirements.txt

COPY ./app/

EXPOSE 8000

CMD ["python"]

RUN ["manage.py", "runserver", "0.0.0.0:8000"]
