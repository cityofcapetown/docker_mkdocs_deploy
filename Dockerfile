FROM ubuntu:18.04

# this is temporary.
EXPOSE 8000

# this is permanent
#EXPOSE minio port 

RUN rm -rf /var/lib/apt/lists/* && \
    apt-get update &&\
    apt-get install -y git python3-pip nano && \
    apt-get clean
RUN pip3 install mkdocs

# DB-UTILS GIT REPO
ENV DBUTILS_URL https://ds1.capetown.gov.za/ds_gitlab/OPM/db-utils.git

# MKDOCS FILES
ENV GIT_URL https://ds1.capetown.gov.za/ds_gitlab/OPM/ds_zone_documentation.git

# DESTINATION BUCKET FOR BUILT SITE
ENV BUCKET_URL https://ds2.capetown.gov.za/public/ds_zone_documentation

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8

COPY deploy.sh .

RUN chmod +x /deploy.sh
CMD ["/bin/bash", "./deploy.sh"]

#ENV TINI_VERSION v0.18.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
#RUN chmod +x /tini
#ENTRYPOINT ["/tini", "-g", "--"]

#COPY run.sh .
#RUN chmod +x /run.sh
#CMD ["/bin/bash", "./run.sh"]


