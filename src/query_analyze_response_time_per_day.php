<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }

    $data = $_POST;  // data gets json har_data from 

    $std_wait=array(); //keeps all -> startedDateTime and wait
    $result = mysqli_query($conn, "SELECT startedDateTime, wait FROM har_info;");
    while ($row = mysqli_fetch_assoc($result)){
            array_push($std_wait, $row);                      
    }
    
    // print_r($std_wait);
    $date=array();// keep the dates from startedDateTime and its wait time
    foreach($std_wait as $d){
        $temp= explode("T",$d['startedDateTime']);
        $temp_d=$temp[0]; // splitting to get the date which in before T -> index 0 
        $hour= explode("Z", $temp[count($temp)-1])[0]; //splitting to get the hour after T and before Z
        $hour= explode(":",$hour)[0];
        $temp_d = strtotime($temp_d);
        $temp_d = date('l', $temp_d);   
        array_push($date,[$temp_d,$hour, $d['wait']]); 
    }
    // print_r($date);
    $time=array();
    $wait=array();
    foreach($data as $d1){
        foreach($date as $d2){
            if($d1['day'] == $d2[0]){ // 0-> day
                array_push($time,$d2[1]); // 1-> hour of the har been selected
                array_push($wait,floatval($d2[2])); // 2-> wait
            }
        }
            
    }
    // print_r($time);
    // print_r($wait);

    $average = array();
    $check=False;
    $sum=0;
    $total=0;
    for($i=0;$i<24;$i++){    
        //initilizing
        $check=False;
        $sum=0;
        $total=0;    
        for($j=0;$j<count($wait);$j++){ // $wait and $time have the same length
            if(intval($time[$j])<$i+1 && intval($time[$j])==$i){
                $sum=$wait[$j]+$sum;
                $total=$total+1;
                $check=True;
            }
        }   
        // echo "sum:". $sum;
        // echo "total: ".$total;   
        if($check==False){
            array_push($average,0); 
        }
        else{
            $avg= $sum/ $total; // Calculating Average wait time
            array_push($average,$avg); // add the average to the correct time
        }            
    }
    // print_r($average);
    

    // // $average = array_sum($wait_floats) / count($wait_floats); // Calculating Average wait time
    echo json_encode($average);

?>