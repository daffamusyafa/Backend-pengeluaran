# Ambil base image Python
FROM python:3.10-slim

WORKDIR /code

# Install dependencies
COPY ./requirements.txt /code/requirements.txt
RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

# Salin kode aplikasi
COPY ./app /code/app

# Jalankan server
# Gunakan Uvicorn sebagai ASGI server untuk FastAPI
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8000"]
