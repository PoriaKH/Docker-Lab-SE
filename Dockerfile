FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /code/notes

COPY notes /code/notes
COPY requirements.txt /code/

RUN pip install --upgrade pip && pip install -r /code/requirements.txt
