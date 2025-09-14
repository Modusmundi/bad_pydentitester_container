FROM redhat/ubi9:9.0.0

RUN yum install -y python3
RUN yum install -y python3-pip
RUN yum remove -y python3-requests
RUN yum install -y git

WORKDIR /app

RUN git clone https://github.com/Modusmundi/pydentitester.git .

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --no-cache-dir -r requirements.txt

RUN python3 -m pip install --no-cache-dir langflow

RUN curl --create-dirs --output-dir /app/eicar -O https://secure.eicar.org/eicar.com

EXPOSE 8080
ENTRYPOINT ["python3", "/app/main.py"]