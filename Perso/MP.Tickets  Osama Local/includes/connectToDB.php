<?php

$dbname = 'mpticket';
$dbuser = 'MPTicket';
$dbpass = 'root';
$dbhost = 'localhost/phpmyadmin/mpticket';

$link = mysqli_connect($dbhost, $dbname ,$dbuser , $dbpass);
if (!$link) {
   // echo "Error: Unable to connect to MySQL." . PHP_EOL;
  //  echo "Debugging ERROR: " . mysqli_connect_errno() . PHP_EOL;
 //   echo "Debugging error: " . mysqli_connect_error() . PHP_EOL;
    exit;
}

echo "Success: A proper connection to MySQL was made! The my_db database is great." . PHP_EOL;
echo "Host information: " . mysqli_get_host_info($link) . PHP_EOL;

mysqli_close($link);
?>