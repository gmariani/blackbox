<?php

$localNum = $_GET['localNum'];
$username = $_GET['username'];
$serverNum = rand(5362, 9345);


$timeDiff = abs($localNum - $serverNum);

//save timeDiff to mySQL
$con = mysqli_connect("localhost", "USERNAME", "PASSWORD");
if ($con === false) {
    die('Could not connect: ' . mysqli_error($con));
}

mysqli_select_db($con, "DBNAME");

mysqli_query($con, "UPDATE talk_users SET timeDiff = '$timeDiff' WHERE name = '$username' ");

mysqli_close($con);


echo "serverNum=" . $serverNum;
