#FROM python:3-alpine
FROM arm32v7/python:rc-slim
WORKDIR /usr/src/app

COPY . .

RUN python ./setup.py install

ENTRYPOINT [ "python", "./autocompose.py" ]
