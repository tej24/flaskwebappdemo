FROM python:3.6

RUN mkdir /code
WORKDIR /code
ADD . /code/
RUN pip3 install -r requirements.txt

EXPOSE 5000
CMD ["python3", "/code/app.py"]
