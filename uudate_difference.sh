#!/usr/bin/env php
<?php
echo "Enter first Date: ";
$first_date=fopen("php://stdin","r");
$first_date=fgets($first_date);
echo "Enter Second  Date: ";
$second_date=fopen("php://stdin","r");
$second_date=fgets($second_date);
$earlier = new DateTime($first_date);
$later = new DateTime($second_date);
echo $abs_diff = $later->diff($earlier)->format("%a")."\n"; 
?>
