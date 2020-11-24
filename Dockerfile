FROM python:3.9-slim
COPY entrypoint.py requirements.txt /
RUN pip install -r /requirements.txt
ENTRYPOINT ["/entrypoint.py"]
