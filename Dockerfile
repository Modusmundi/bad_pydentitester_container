# We're using a real outdated version of UBI!
FROM redhat/ubi9:9.0.0


RUN yum install -y python3
RUN yum install -y python3-pip
RUN yum remove -y python3-requests
RUN yum install -y git

WORKDIR /app

# In an enterprise you may not be storing your code in a public repo, which is fair.
# Ideally you'd have your code in a known-good repo that you can pull from and then
# validate off of some criteria (Hashes etc.).
RUN git clone https://github.com/Modusmundi/pydentitester.git .

RUN python3 -m pip install --upgrade pip

RUN python3 -m pip install --no-cache-dir -r requirements.txt

# We're adding a *real dirty* Python library that will pop in scans.
RUN python3 -m pip install --no-cache-dir langflow

# EICAR test file to see if ClamAV actually works!
RUN curl --create-dirs --output-dir /app/eicar -O https://secure.eicar.org/eicar.com

EXPOSE 8080
ENTRYPOINT ["python3", "/app/main.py"]