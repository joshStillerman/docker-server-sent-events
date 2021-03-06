FROM ubuntu:14.04
RUN apt-get update \
	&& apt-get install --no-install-recommends python-pip build-essential python-dev libevent-dev  -y


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

RUN pip install -U pip
RUN pip install -U setuptools

COPY requirements.txt /usr/src/app/
RUN pip install -r requirements.txt

COPY . /usr/src/app

EXPOSE 80
CMD [ "gunicorn", "--bind", "0.0.0.0:80", "server:app" ]
