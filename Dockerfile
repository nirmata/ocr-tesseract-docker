FROM centos:7

RUN yum install deltarpm -y &&\
    yum update -y && \
    yum install -y epel-release &&\
    yum install -y python-pip python-deve && \
    yum install -y yum install -y libSM libXext && \
    yum -y install tesseract && \
    yum -y install poppler-utils && \
    yum clean all

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip &&\
    pip install -U setuptools &&\
    pip install pillow &&\
    pip install pytesseract &&\
    pip install opencv-contrib-python &&\
    pip install -r requirements.txt &&\
    rm -rf ~/.cache/pip

ENTRYPOINT ["python"]
CMD ["app.py"]
