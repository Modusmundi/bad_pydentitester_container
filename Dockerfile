FROM redhat/ubi9:9.0.0-1468.1655190709
LABEL authors="Modusmundi"

RUN yum install -y python3
RUN yum install -y python3-pip
RUN yum install -y git

WORKDIR /app

RUN git clone https://github.com/Modusmundi/pydentitester.git .

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --no-cache-dir -r requirements.txt

EXPOSE 8080
ENTRYPOINT ["python3", "/app/main.py"]