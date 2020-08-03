FROM python:3.8

# Fixing timezone:
ENV TZ=America/New_York
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

COPY /src /src

WORKDIR /src/tests
CMD ["python3", "__main__.py"]