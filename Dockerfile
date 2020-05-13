# Dockerfile

# Import from the debian baseline of linux operating system
FROM debian

### The following sets of Environment Variables

### So logging/io works reliably w/Docker
ENV PYTHONUNBUFFERED=1
### UTF Python issue for Click package (pipenv dependency)
ENV LC_ALL=C.UTF-8
ENV LANG=C.UTF-8
### Need to explicitly set this so `pipenv shell` works
ENV SHELL=/bin/bash

### This is a test fo see if we can echo our own environment variable
ENV SECRET_MESSAGE="Hellow World :-D"

### Basic Python dev dependencies
RUN apt-get update && \
  apt-get upgrade -y && \
  apt-get install python3-pip curl -y && \
  pip3 install pipenv

### Install via pip or pipenv:
RUN pip3 install pandas
#RUN pipenv install pandas