#  پوریا خواجه پور (400171392) - سید محمد سجادیان (98170862)


## 1. ساختار فایل‌ها:
- Dockerfile: ایمیج Django app را بیلد میکند با نصب dependency های پایتون و کپی کردن کد
Builds the Django app image by installing Python dependencies and copying code.
- docker-compose.yml: ۲ سرویس تعریف میکند یکی 'web' برای Django و دیگری 'db' برای PostgreSQL. و پورت ۸۰۰۰ را مپ میکند برای دسترسی web و Django را به postres لینک میکند.
- requirements.txt: لیست dependencyها از جمله  Django و psycopg2.

## 2. دستورات:
```
docker-compose up --build
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser
```


## 3. درخواست‌های Web Server:
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

## 4. تعاملات با داکر:
- نشان دادن imageها و کانتینر‌ها:
  Command: docker ps
  Output: <list of running containers>

- اجرای دستور در کانتینر:
  Command: docker exec -it <web_container_id> ls /
  Output: <list of root directory files>

## 5. سوالات:
- فایل Dockerfile مشخص می‌کند که چگونه یک ایمیج ساخته شود, این فایل شامل ایمیج پایه، دایرکتوری کاری، پکیج‌های نصب‌شده و فایل‌های کپی‌شده است.
- ایمیج، یک نقشه‌ی اولیه (blueprint) است که شامل کد برنامه، کتابخانه‌ها و محیط اجرا می‌باشد.
- کانتینر یک نمونه اجرایی از یک ایمیج است — جایی که برنامه در آن اجرا می‌شود.

- Kubernetes برای خودکارسازیِ فرآیند استقرار (Deployment)، مقیاس‌پذیری (Scaling)، و مدیریت (Management) برنامه‌هایی که در قالب کانتینر اجرا می‌شوند، به‌کار می‌رود. این سیستم با Docker کار می‌کند و وظیفه‌ی هماهنگ‌سازی (Orchestration) و مدیریت کانتینرهای Docker در میان کلاسترهای مختلف را بر عهده دارد.
