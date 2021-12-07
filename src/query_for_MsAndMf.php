<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }

    $data = array();
    foreach ($_POST as $d){  
        $ct=$d["type"];
        $result = mysqli_query($conn, "SELECT res_content_type,res_cache_control,count(res_content_type) AS count FROM har_info where res_content_type LIKE'%$ct%';");
    
        while ($row = mysqli_fetch_assoc($result)){
            if(in_array($row, $data)==false){ //check we push only distinct entries
                array_push($data, $row);  
            }
                      
        }
    }
    //print_r($data);
    echo json_encode($data); 
    exit();
?>