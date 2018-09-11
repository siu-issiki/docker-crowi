FROM debian:jessie-slim
ARG awscli_version

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb http://repo.mongodb.org/apt/debian jessie/mongodb-org/4.0 main" | tee /etc/apt/sources.list.d/mongodb-org-4.0.list

RUN apt-get update; \
    apt-get install -y \
        mongodb-org \
        mongodb-org-tools \
        busybox-static \
        python \
        curl \
        zip

RUN curl -kL https://bootstrap.pypa.io/get-pip.py | python; pip install awscli==${awscli_version}

COPY backup/crontab /var/spool/cron/crontabs/root

CMD busybox crond -l 2 -f