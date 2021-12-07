<?php
    include_once 'include_db.php';

    session_start();

    if (isset($_SESSION['loggedIN'])) {
        $usrname = $_SESSION['username']; // Getting the username which is logged in
    }

    $result = mysqli_query($conn, "SELECT count(*) AS count FROM users_hars WHERE usr_name='$usrname';");

    $result2 = mysqli_query($conn, "SELECT max(date_time) AS latest FROM users_hars WHERE usr_name='$usrname';");

    
    $data = array();
    while ($row = mysqli_fetch_object($result))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result2))
    {
        array_push($data, $row);
    }
    
    echo json_encode($data);
    exit();
?>