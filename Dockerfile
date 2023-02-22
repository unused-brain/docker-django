FROM python:alpine3.16

WORKDIR /usr/djangoApp/

# Set environment variables
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN apk --no-cache add curl

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY ./app .

RUN python manage.py makemigrations

RUN python manage.py migrate

# remember to remove ALLOWED_HOST or put '*' in it in settings.py

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000"]

