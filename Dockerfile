FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install -y python3 python3-pip

RUN python3 -m pip install --upgrade pip

RUN apt install -y ffmpeg libsm6 libxext6

COPY TensorRT-8.6.1.6 /opt/TensorRT-8.6.1.6

WORKDIR /opt/app/

COPY . .

RUN python3 -m pip install --user --no-cache-dir -r requirements.txt

CMD ["python3","app.py"]
