#!/usr/bin/php
<?php
/*
* upload_sqm_images.php
* Uploads using FTP SQM images. This scripts should be
* replaced with a much simpler bash script.
*
* Copyright (c) 2017-2020 - Dario Pilori <dario.pilori@astrogeo.va.it>
* SPDX-License-Identifier: MIT
*
*/
// Directory with the images
define("DIR", "/media/pysqm/");

// FTP settings
// Define those constants in the ftp_settings.php file:
// define("FTPHOST", "ftp.example.com");
// define("FTPUSER", "username");
// define("FTPPASS", "password");
require_once('ftp_settings.php');

$sqmname = 'SQM_SCHIAP';

// Set timezone
date_default_timezone_set('Europe/Rome');

// FTP upload
$ftpconn = ftp_connect(FTPHOST) or die("Unable to connect to FTP server\n");
ftp_login($ftpconn, FTPUSER, FTPPASS) or die("Login error on the FTP server\n");
ftp_pasv($ftpconn, true);
ftp_put($ftpconn, "$sqmname.txt",DIR."$sqmname.dat", FTP_BINARY) or die("FTP file upload error\n");
ftp_put($ftpconn, "$sqmname.png",DIR."$sqmname.png", FTP_BINARY) or die("FTP file upload error\n");
ftp_close($ftpconn);
?>
