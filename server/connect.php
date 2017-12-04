<?php
    require('db.php');

    $conn = mysqli_connect($host, $username, $password);
    
    mysqli_select_db($conn, $db);
    if (mysqli_connect_errno()) {
        die("Connection failed");
    }
    mysqli_set_charset($conn, 'utf8');
    