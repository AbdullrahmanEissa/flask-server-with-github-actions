FROM python:3.10.19-slim-bookworm
WORKDIR /flask
COPY requirements.txt /flask/
RUN pip install -r requirements.txt
COPY . /flask/
EXPOSE 5000
CMD ["python" , "app.py"]