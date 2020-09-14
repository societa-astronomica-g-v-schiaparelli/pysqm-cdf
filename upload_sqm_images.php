#!/usr/bin/php
<?php
/*
* upload_sqm_images.php
* Invia sul sito astrogeo le immagini della camera SQM
* Copyright (c) 2017-2020 - Dario Pilori <dario.pilori@astrogeo.va.it>
* SPDX-License-Identifier: MIT
*
*/
// Directory contenente le immagini
define("DIR", "/media/pysqm/");

// Impostazioni FTP
// Definire queste costanti nel file ftp_settings.php:
// define("FTPHOST", "ftp.example.com");
// define("FTPUSER", "username");
// define("FTPPASS", "password");
require_once('ftp_settings.php');

$sqmname = 'SQM_SCHIAP';

// Imposta timezone
date_default_timezone_set('Europe/Rome');

// Invio via FTP
$ftpconn = ftp_connect(FTPHOST) or die("Impossibile collegarsi al server FTP\n");
ftp_login($ftpconn, FTPUSER, FTPPASS) or die("Impossibile effettuare il login al server FTP\n");
ftp_pasv($ftpconn, true);
ftp_put($ftpconn, "$sqmname.txt",DIR."$sqmname.dat", FTP_BINARY) or die("Errore nell'invio via FTP del file\n");
ftp_put($ftpconn, "$sqmname.png",DIR."$sqmname.png", FTP_BINARY) or die("Errore nell'invio via FTP del file\n");
ftp_close($ftpconn);
?>
