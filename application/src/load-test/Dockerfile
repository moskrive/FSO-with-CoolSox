#FROM python:2.7-wheezy
FROM python:3.10.0-buster

# Install locust
RUN pip install pyzmq locust faker

ADD locustfile.py /config/locustfile.py
ADD runLocust.sh /usr/local/bin/runLocust.sh

ENV LOCUST_FILE /config/locustfile.py

EXPOSE 8089

ENTRYPOINT ["/usr/local/bin/runLocust.sh"]
