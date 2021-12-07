<?php
    include_once 'include_db.php';

    // session_start();
    

    
    $lat_lng_count = array();
    // $result = mysqli_query($conn, "SELECT lat, lon AS lng, count(DISTINCT id, entry) AS count FROM har_info WHERE (res_content_type LIKE'%html%' || res_content_type LIKE'%php%' || res_content_type LIKE'%asp%' || res_content_type LIKE'%jsp%') GROUP BY lat,lon;");
    $result = mysqli_query($conn, "SELECT lat, lon AS lng FROM har_info WHERE (res_content_type LIKE'%html%' || res_content_type LIKE'%php%' || res_content_type LIKE'%asp%' || res_content_type LIKE'%jsp%') GROUP BY lat,lon;");
    while ($row = mysqli_fetch_assoc($result))
    {
        array_push($lat_lng_count, $row);
    }
    // print_r($lat_lng_count);
    $data=array();
    foreach($lat_lng_count as $d){
        // $row= ["lat:"=> floatval($d['lat']),"lon"=> floatval($d['lng'])];
        $row= [floatval($d['lat']),floatval($d['lng'])];
        array_push($data,$row);

    }
    // echo $data;
    echo json_encode($data);    

    exit();
?>