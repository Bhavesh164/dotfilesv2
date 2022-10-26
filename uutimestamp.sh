#!/usr/bin/env php
<?php
$handle=fopen("php://stdin","r");
$timestamp=fgets($handle);  //grab inside the input
$date=preg_replace('/\R/', '', trim(date('Y-m-d',(int)$timestamp)));
$pid=shell_exec("echo  " . escapeshellarg($date) . " | xclip -r -sel c | exit 0");
echo "Date is :$date\n";
?>
