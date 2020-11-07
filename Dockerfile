#FROM python:3-alpine
FROM arm32v7/python:3.8-slim
WORKDIR /usr/src/app

COPY . .

RUN python ./setup.py install

ENTRYPOINT [ "python", "./autocompose.py" ]
