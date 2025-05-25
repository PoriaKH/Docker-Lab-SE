#  Pouria Khajepour (400171392) - Seyyed Mohammad Sajjadian (98170862)


## 1. FILE STRUCTURE DESCRIPTION:
- Dockerfile: Builds the Django app image by installing Python dependencies and copying code.
- docker-compose.yml: Defines two services — 'web' for Django and 'db' for PostgreSQL. Maps port 8000 for web access and links Django to Postgres.
- requirements.txt: Lists Python dependencies including Django and psycopg2.

## 2. INSTRUCTIONS:
```
docker-compose up --build
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser
```


## 3. WEB SERVER REQUESTS:
- Create user:
  Request: POST `http://127.0.0.1:8000/users/create/?username=user1&password=1234`
  Response: 200 OK. {"id": 2, "username": "user1"}
- Login:
  Request: POST `http://127.0.0.1:8000/users/login/?username=user1&password=1234`
- Create note 1:
  Request: POST /notes/ {"title": "title1", "body": "body1"}
  Response: 200 OK. {"id": 1, "title": "title1", "body": "bodyl", "create _time": "2025-05-18T13:55:27.401Z"}
- Create note 2:
  Request: POST /notes/ {"title": "title2", "body": "body2"}
  Response: 200 OK. {"id": 2, "title": "title2", "body": "body2", "create _time": "2025-05-18T13:55:56.637Z"}
- Get notes:
  Request: GET /notes/ : `http://127.0.0.1:8000/notes/`
  Response: [{"id": 1, "title": "title1", "body": "body1", "create_time": "2025-05-18T13:55:27.401Z"}, {"id": 2, "title": "title2", "body": "body2", "create_time": "2025-05-18T13:55:56.637Z"}]

## 4. DOCKER INTERACTIONS:
- Show images and containers:
  Command: docker ps
  Output: <list of running containers>

- Run command in container:
  Command: docker exec -it <web_container_id> ls /
  Output: <list of root directory files>

## 5. QUESTIONS:
- Dockerfile defines how to build an image; it includes base image, working directory, installed packages, and copied files.
- An image is a blueprint containing the application code, libraries, and environment.
- A container is a runtime instance of an image — it is where the application runs.

- Kubernetes is used to automate deployment, scaling, and management of containerized applications. It works with Docker by orchestrating and managing the Docker containers across clusters.
