
#  پوریا خواجه پور (400171392) - سید محمد سجادان (98170862)

## ۱. توضیح ساختار فایل‌ها:
- Dockerfile: فایل ساخت ایمیج برنامه Django است که با نصب وابستگی‌های پایتون و کپی کردن کد انجام می‌شود.
- docker-compose.yml: دو سرویس تعریف می‌کند — 'web' برای Django و 'db' برای PostgreSQL. پورت 8000 برای دسترسی وب نگاشته شده و Django به Postgres متصل می‌شود.
- requirements.txt: فهرست وابستگی‌های پایتون از جمله Django و psycopg2 را نشان می‌دهد.

## ۲. دستورالعمل‌ها:
```
docker-compose up --build
docker-compose exec web python manage.py migrate
docker-compose exec web python manage.py createsuperuser
```

## ۳. درخواست‌های وب‌سرور:
- ایجاد کاربر:
  درخواست: POST `http://127.0.0.1:8000/users/create/?username=user1&password=1234`
  پاسخ: 200 OK. {"id": 2, "username": "user1"}

- ورود:
  درخواست: POST `http://127.0.0.1:8000/users/login/?username=user1&password=1234`

- ایجاد یادداشت ۱:
  درخواست: POST /notes/ {"title": "title1", "body": "body1"}
  پاسخ: 200 OK. {"id": 1, "title": "title1", "body": "body1", "create_time": "2025-05-18T13:55:27.401Z"}

- ایجاد یادداشت ۲:
  درخواست: POST /notes/ {"title": "title2", "body": "body2"}
  پاسخ: 200 OK. {"id": 2, "title": "title2", "body": "body2", "create_time": "2025-05-18T13:55:56.637Z"}

- دریافت یادداشت‌ها:
  درخواست: GET /notes/ : `http://127.0.0.1:8000/notes/`
  پاسخ: [{"id": 1, "title": "title1", "body": "body1", "create_time": "2025-05-18T13:55:27.401Z"}, {"id": 2, "title": "title2", "body": "body2", "create_time": "2025-05-18T13:55:56.637Z"}]

## ۴. تعاملات با Docker:
- نمایش ایمیج‌ها و کانتینرهای فعال:
  دستور: docker ps
  خروجی: <فهرست کانتینرهای فعال>

- اجرای دستور در داخل کانتینر:
  دستور: docker exec -it <web_container_id> ls /
  خروجی: <فهرست فایل‌های موجود در ریشه>

## ۵. پرسش‌ها:
- Dockerfile تعیین می‌کند که چگونه یک ایمیج ساخته شود؛ شامل ایمیج پایه، دایرکتوری کاری، پکیج‌های نصب‌شده، و فایل‌های کپی‌شده.
- یک ایمیج، نقشه‌ای (blueprint) است شامل کد برنامه، کتابخانه‌ها، و محیط اجرا.
- یک کانتینر، نمونه‌ای اجرایی از یک ایمیج است — جایی که برنامه اجرا می‌شود.

- Kubernetes ابزاری است برای خودکارسازی پیاده‌سازی، مقیاس‌پذیری و مدیریت برنامه‌های کانتینری‌شده. این ابزار با Docker همکاری می‌کند تا کانتینرهای Docker را در سراسر کلاسترها مدیریت و هماهنگ کند.
