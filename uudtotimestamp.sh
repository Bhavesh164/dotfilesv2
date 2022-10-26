#!/usr/bin/env php
<?php
echo "Enter Date:";
$handle=fopen("php://stdin","r");
$date=fgets($handle);  //grab inside the input
$date=substr($date,0,4)."-".substr($date,4,2)."-".substr($date,6);
$date=preg_replace('/\R/', '', trim($date));
$date=$date." 00:00:00";
$d = DateTime::createFromFormat(
    'Y-m-d H:i:s',
    $date,
    new DateTimeZone('IST')
);
if ($d === false) {
echo "Program terminated \n";
exit;
} else {
$pid=shell_exec("echo  " . escapeshellarg($d->getTimestamp()) . " | xclip -r -sel c | exit 0");
echo "Timestamp is:".$d->getTimestamp()."\n";
}
shell_exec("xdotool key Alt+backslash|exit 0"); //for exiting drop down terminal Guake
?>
