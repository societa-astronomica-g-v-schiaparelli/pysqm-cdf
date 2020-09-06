# Base information
FROM centos:7
MAINTAINER Dario Pilori <dario.pilori@astrogeo.va.it>

# Update
RUN yum -y update && yum -y install epel-release

# Install dependencies
RUN yum -y install python2-numpy python-matplotlib git pyephem

# Select volume for images
VOLUME /media/allsky/sqm

# Create unprivileged user
RUN useradd -r -s /sbin/nologin -m -d /home/pysqm -u 1006 pysqm
USER pysqm

# Install PySQM with config
RUN git clone https://github.com/mireianievas/PySQM.git /home/pysqm/PySQM
ADD config.py /home/pysqm/PySQM/config.py

# Run PySQM
ENTRYPOINT cd /home/pysqm/PySQM && python2 -m pysqm

