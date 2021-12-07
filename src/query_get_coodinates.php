<?php
    include_once 'include_db.php';

    session_start();
    $usrname = $_SESSION['username']; // Getting the username which is logged in

    
    $lat_lng_count = array();
    // $result = mysqli_query($conn, "SELECT lat, lon AS lng, count(*) AS count FROM har_header INNER JOIN har_info ON id=har_id WHERE har_info.usr_name='$usrname' AND (res_content_type LIKE'%html%' || res_content_type LIKE'%php%' || res_content_type LIKE'%asp%' || res_content_type LIKE'%jsp%') GROUP BY lat,lon;");
    $result = mysqli_query($conn, "SELECT lat, lon AS lng, count(DISTINCT id, entry) AS count FROM har_info WHERE har_info.usr_name='$usrname' AND (res_content_type LIKE'%html%' || res_content_type LIKE'%php%' || res_content_type LIKE'%asp%' || res_content_type LIKE'%jsp%') GROUP BY lat,lon;");
    while ($row = mysqli_fetch_assoc($result))
    {
        array_push($lat_lng_count, $row);
    }
    // print_r($lat_lng_count);
    $data=array();
    foreach($lat_lng_count as $d){
        $row= ['lat'=> floatval($d['lat']), 'lng'=> floatval($d['lng']), 'count'=> floatval($d['count'])];
        array_push($data,$row);

    }
    echo json_encode($data);    

    exit();
?>