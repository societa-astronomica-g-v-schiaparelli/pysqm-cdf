## Container for pysqm
# Copyright (c) 2020-2022 - Dario Pilori <dario.pilori@astrogeo.va.it>
# SPDX-License-Identifier: GPL-3.0-or-later

# Base information
FROM centos:7
LABEL maintainer="dario.pilori@astrogeo.va.it"

# Install EPEL
RUN yum -y update
RUN yum -y install epel-release

# Install dependencies
RUN yum -y install python2-numpy python-matplotlib git pyephem lftp

# Select volume for images
VOLUME /media/pysqm

# Create unprivileged user
RUN groupadd -g 978 pysqm
RUN useradd -g 978 -r -s /sbin/nologin -m -d /home/pysqm -u 1006 pysqm
USER pysqm

# Install PySQM with config
RUN git clone https://github.com/societa-astronomica-g-v-schiaparelli/PySQM.git /home/pysqm/PySQM
ADD config.py /home/pysqm/PySQM/config.py
ADD upload_sqm_images.sh /home/pysqm/upload_sqm_images.sh
ADD ftp_settings /home/pysqm/ftp_settings

# Run PySQM
WORKDIR /home/pysqm/PySQM
CMD python2 -m pysqm
