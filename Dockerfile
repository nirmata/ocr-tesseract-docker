FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev build-essential && \
    apt update && apt install -y libsm6 libxext6 && \
    apt-get -y install tesseract-ocr && \
    apt-get -y install poppler-utils && \
    apt-get clean

COPY . /app
WORKDIR /app

RUN pip install pillow && \
    pip install pytesseract && \
    pip install opencv-contrib-python && \
    pip install -r requirements.txt

ENTRYPOINT ["python"]
CMD ["app.py"]
