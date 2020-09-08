#!/usr/bin/php
<?php
/*
 * upload_sqm_images.php
*  Invia sul sito astrogeo le immagini della camera SQM
 * 2017 - Dario Pilori <dario.pilori@astrogeo.va.it>
*/
// Directory contenente le immagini
define("DIR", "/media/pysqm/");
// Impostazioni FTP
//define("FTPHOST", "ftp.astrogeo.va.it");
define("FTPHOST", "10.101.0.2");
define("FTPUSER", "sqm");
define("FTPPASS", "***REMOVED***");
$sqmname = 'SQM_SCHIAP';

// Imposta timezone
date_default_timezone_set('Europe/Rome');

// Invio via FTP
//$ftpconn = ftp_ssl_connect(FTPHOST) or die("Impossibile collegarsi al server FTP\n");
$ftpconn = ftp_connect(FTPHOST) or die("Impossibile collegarsi al server FTP\n");
ftp_login($ftpconn, FTPUSER, FTPPASS) or die("Impossibile effettuare il login al server FTP\n");
ftp_pasv($ftpconn, true);
ftp_put($ftpconn, "$sqmname.txt",DIR."$sqmname.dat", FTP_BINARY) or die("Errore nell'invio via FTP del file\n");
ftp_put($ftpconn, "$sqmname.png",DIR."$sqmname.png", FTP_BINARY) or die("Errore nell'invio via FTP del file\n");
ftp_close($ftpconn);
?>
