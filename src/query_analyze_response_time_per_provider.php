<?php
    include_once 'include_db.php';

    session_start();
    if (!isset($_SESSION['loggedINA'])) {
        // $usrname = $_SESSION['username']; // Getting the username which is logged in
        header('Location: index.html');
        exit();
    }


    $data = array(); //keeps all -> startedDateTime and wait
    foreach ($_POST as $d){  
        $pr=$d["provider"];
        $result = mysqli_query($conn, "SELECT id, entry, startedDateTime, wait, provider FROM i_providers INNER JOIN har_info ON har_id=id where provider LIKE '$pr%';");
        // eixe ena 8ema h sql kai h8ele unique/kleidia gia na kanei select oles tis eggrafes
        while ($row = mysqli_fetch_assoc($result)){
            if(in_array($row, $data)==false){ //check we push only distinct entries
                array_push($data, $row);  
            }  
        }
    }

    $time=array();// keeps the hours
    $wait=array(); // keeps the wait
    foreach($data as $d){
        $temp= explode("T",$d['startedDateTime']);
        $hour= explode("Z", $temp[count($temp)-1])[0]; //splitting to get the hour after T and before Z
        $hour= explode(":",$hour)[0];
        array_push($time,$hour); 
        array_push($wait,floatval($d['wait'])); 
    }    

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
        if($check==False){
            array_push($average,0); 
        }
        else{
            $avg= $sum/ $total; // Calculating Average wait time
            array_push($average,$avg); // add the average to the correct time
        }            
    }
    // print_r($average);
    
    echo json_encode($average);

?>