FROM python:3.8.7
WORKDIR /app
ADD . /app
RUN apt-get update && apt-get install -y libasound2 && pip install -i https://mirrors.aliyun.com/pypi/simple/ --no-cache-dir -r requirements.txt
ENV SPEECH_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
ENV SERVICE_REGION=eastus
CMD ["gunicorn", "app:app", "-b", "0.0.0.0:6002", "--log-file", "-", "--access-logfile", "-", "--error-logfile", "-"]
EXPOSE 6002