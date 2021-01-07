FROM python:3.8.7
WORKDIR /app
ADD . /app
RUN apt-get update
RUN apt-get install -y libasound2
RUN pip install -i https://mirrors.aliyun.com/pypi/simple/ --no-cache-dir -r requirements.txt
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:6000", "--log-file", "-", "--access-logfile", "-", "--error-logfile", "-"]
EXPOSE 6000