## Container for pysqm
# Copyright (c) 2020-2022 - Dario Pilori <dario.pilori@astrogeo.va.it>
# SPDX-License-Identifier: GPL-3.0-or-later

# Base information
FROM python:2-alpine
LABEL maintainer="dario.pilori@astrogeo.va.it"

# Install packages
RUN apk add --no-cache git lftp freetype-dev gcc g++ tzdata

# Set timezone
RUN cp /usr/share/zoneinfo/Europe/Rome /etc/localtime && echo "Europe/Rome" > /etc/timezone

# Install Python packages
RUN pip install -U pip setuptools wheel
RUN pip install numpy ephem serial matplotlib

# Remove unused packages
RUN apk del tzdata gcc g++

# Select volume for images
VOLUME /media/pysqm

# Create unprivileged user
RUN addgroup -g 978 -S pysqm
RUN adduser -g 978 -S -s /sbin/nologin -D -h /home/pysqm -G pysqm -u 1006 pysqm
USER pysqm

# Install PySQM with config
RUN git clone https://github.com/societa-astronomica-g-v-schiaparelli/PySQM.git /home/pysqm/PySQM
ADD config.py /home/pysqm/PySQM/config.py
ADD upload_sqm_images.sh /home/pysqm/upload_sqm_images.sh
ADD ftp_settings /home/pysqm/ftp_settings

# Run PySQM
WORKDIR /home/pysqm/PySQM
CMD python2 -m pysqm
