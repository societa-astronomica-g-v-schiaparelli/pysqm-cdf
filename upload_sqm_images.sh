#!/bin/bash
#
#    upload_sqm_images.sh - Uploads using FTP SQM images.
#    Copyright (c) 2017-2022   Dario Pilori <dario.pilori@astrogeo.va.it>
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.
#
# SPDX-License-Identifier: GPL-3.0-or-later

## Import FTP settings from `ftp_settings'
#FTPHOST="ftp.example.com"
#FTPUSER="username"
#FTPPASS="password"
source /home/pysqm/ftp_settings

# Set name of SQM and working dir
SQM_NAME="SQM_SCHIAP"
DIR="/media/pysqm/"

# FTP upload
lftp -u ${FTPUSER},${FTPPASS} ${FTPHOST} << EOF

lcd ${DIR}
put ${SQM_NAME}.dat
put ${SQM_NAME}.png
bye

EOF
