<?php
DEFINE ('DB_USER', 'studentdb');
DEFINE ('DB_PASSWORD', 'Newtech21!');
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_NAME', 'quickopen');

$dbc = @mysqli_connect(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME)
OR die('Could not connect to MySQL: ' . 
mysqli_connect_error());
?>
