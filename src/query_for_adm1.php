<?php
    include_once 'include_db.php';

    session_start();

    if (!isset($_SESSION['loggedINA'])) {
        header('Location: index.html');
        exit();
    }

    $result = mysqli_query($conn, "SELECT count(username) AS counta FROM users;");
    $result2 = mysqli_query($conn, "SELECT method, COUNT(id) AS count from har_info WHERE method='GET';");
    $result2b = mysqli_query($conn, "SELECT method, COUNT(id) AS count from har_info WHERE method='POST';");
    $result3 = mysqli_query($conn, "SELECT status, COUNT(id) AS count FROM har_info GROUP BY status;");
    $result4 = mysqli_query($conn, "SELECT COUNT(DISTINCT url) AS uniq FROM har_info;");
    $result5 = mysqli_query($conn, "SELECT provider, COUNT(DISTINCT provider) AS provid FROM i_providers;");
    $result6 = mysqli_query($conn, "SELECT res_content_type,AVG(res_age) AS avg FROM har_info GROUP BY res_content_type;");

    $data = array();
    while ($row = mysqli_fetch_object($result))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result2))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result2b))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result3))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result4))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result5))
    {
        array_push($data, $row);
    }
    while ($row = mysqli_fetch_object($result6))
    {
        array_push($data, $row);
    }
    
    echo json_encode($data);
    exit();
?>