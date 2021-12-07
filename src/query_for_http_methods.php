<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }

    $result = mysqli_query($conn, "SELECT method FROM har_info;");

    $data = array();
    while ($row = mysqli_fetch_object($result))
    {
        array_push($data, $row);
    }
    echo json_encode($data);    

    exit();
?>