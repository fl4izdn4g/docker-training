FROM python:3.4-alpine
COPY . /code
WORKDIR /code
RUN pip install flask
EXPOSE 5000
CMD ["python", "app.py"]