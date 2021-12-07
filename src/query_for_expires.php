<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }

    $data = array();
    foreach ($_POST['sel'] as $ct){  
        foreach($_POST['exp'] as $e){
            $result = mysqli_query($conn, "SELECT res_expires,res_last_modified FROM har_info where res_content_type LIKE '%$ct%' AND res_cache_control ='$e';");
    
            while ($row = mysqli_fetch_assoc($result)){
                // if(in_array($row, $data)==false){ //check we push only distinct entries
                    array_push($data, $row);  
                // }            
            }
        }

    }
    echo json_encode($data);    

    exit();
?>