# Base information
FROM centos:7
MAINTAINER Dario Pilori <dario.pilori@astrogeo.va.it>

# Install EPEL
RUN yum -y install epel-release

# Install dependencies
RUN yum -y install python2-numpy python-matplotlib git pyephem ftp

# Select volume for images
VOLUME /media/pysqm

# Create unprivileged user
RUN useradd -r -s /sbin/nologin -m -d /home/pysqm -u 1006 pysqm
USER pysqm

# Install PySQM with config
RUN git clone https://github.com/societa-astronomica-g-v-schiaparelli/PySQM.git /home/pysqm/PySQM
ADD config.py /home/pysqm/PySQM/config.py
ADD upload_sqm_images.sh /home/pysqm/upload_sqm_images.sh
ADD ftp_settings /home/pysqm/ftp_settings

# Run PySQM
WORKDIR /home/pysqm/PySQM
CMD python2 -m pysqm
