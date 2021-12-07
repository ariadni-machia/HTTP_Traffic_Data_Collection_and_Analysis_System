<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }

    // $data = $_POST;  // data gets json har_data from 

    $data = array();
    foreach ($_POST as $d){  
        $ct=$d["type"];
        $result = mysqli_query($conn, "SELECT startedDateTime, wait FROM har_info where res_content_type LIKE'%$ct%';");    
        while ($row = mysqli_fetch_assoc($result)){
                array_push($data, $row);  
                      
        }
    }
    // print_r($data);
    $wait_floats=array();// array with the wait in float type not string
    foreach($data as $w){
        array_push($wait_floats,floatval($w['wait'])); 
    }
    $time=array();// array with the startedDateTime (string)
    foreach($data as $t){
        $temp_t= explode("T",$t['startedDateTime']); // splitting to get the time which in betweeen T and Z
        $temp_t= explode("Z", $temp_t[count($temp_t)-1])[0];
        $temp_t= explode(":",$temp_t)[0];
        array_push($time, $temp_t ); 
    }
    // print_r($time);
    // print_r($wait_floats);
    
    $average = array();
    $check=False;
    $sum=0;
    $total=0;
    for($i=0;$i<24;$i++){    
        //initilizing
        $check=False;
        $sum=0;
        $total=0;    
        for($j=0;$j<count($wait_floats);$j++){ // $wait_floats and $time have the same length
            if(intval($time[$j])<$i+1 && intval($time[$j])==$i){
                $sum=$wait_floats[$j]+$sum;
                $total=$total+1;
                $check=True;
            }
        }      
        if($check==False){
            array_push($average,0); 
        }
        else{
            $avg= $sum/$total; // Calculating Average wait time
            array_push($average,$avg); // add the average to the correct time
        }            
    }
    // print_r($average);
    

    // $average = array_sum($wait_floats) / count($wait_floats); // Calculating Average wait time
    echo json_encode($average);

?>