FROM python:3.8

WORKDIR /workspace

COPY requirements.txt /workspace/requirements.txt

RUN pip install -r requirements.txt

COPY src /workspace/src

ENTRYPOINT ["python","src/main.py"]
