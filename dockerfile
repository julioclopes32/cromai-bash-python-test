FROM python:3.8.10

ADD python_script.py .

CMD ["python", "./python_script.py"]

FROM ubuntu:20.04

ENV TERM linux
ENV DEBIAN_FRONTEND noninteractive

ADD bash_script.sh .

RUN apt-get update
RUN apt-get install -y  

CMD ["/bin/bash"]