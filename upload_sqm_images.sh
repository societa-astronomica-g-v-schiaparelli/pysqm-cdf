#!/bin/bash
# upload_sqm_images.sh
# Uploads using FTP SQM images.
#
# Copyright (c) 2017-2020 - Dario Pilori <dario.pilori@astrogeo.va.it>
# SPDX-License-Identifier: MIT OR GPL-3.0-or-later

## Import FTP settings from `ftp_settings'
#FTPHOST="ftp.example.com"
#FTPUSER="username"
#FTPPASS="password"
source /home/pysqm/ftp_settings

# Set name of SQM and working dir
SQM_NAME="SQM_SCHIAP"
DIR="/media/pysqm/"

# FTP upload
ftp -ine ${FTPHOST} << EOF

user ${FTPUSER} ${FTPPASS}
lcd ${DIR}
put ${SQM_NAME}.dat
put ${SQM_NAME}.png
bye

EOF
