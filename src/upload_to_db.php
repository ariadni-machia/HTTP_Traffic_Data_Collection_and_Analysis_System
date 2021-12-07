<?php
    include_once 'include_db.php';

    session_start();

    if (isset($_SESSION['loggedIN'])) {
        $usrname = $_SESSION['username']; // Getting the username which is logged in
        echo "Username: ",$usrname,"\n";
    }

    $data = $_POST;  // data gets json har_data from 
    // print_r($data); // prints the data we post with ajax to this php
    $check = true;

    // Har's Info -> Upload
    $entry = 0;
    if($data["case"]>0){
        $entry=$data["lastid"]["en"];
        print_r("========= ",$entry);
    }
   
    foreach ($data['har_data'] as $d){  
        $entry++;
        // $usrname = $d['usrname'];
        $sDT = $d['startedDateTime'];
        $wait = $d['wait'];
        $sIP = $d['sIP'];
        $method = $d['method'];
        $url = $d['url'];
        $status = $d['status'];
        $statusTx = $d['statusTx'];
        $lat = $d['lat'];
        $lon = $d['lon'];

        $req_ct=$d['req_ct'];
        $req_cc=$d['req_cc'];
        $req_pr=$d['req_pr'];
        $req_ex=$d['req_ex'];
        $req_age=$d['req_age'];
        $req_lm=$d['req_lm'];
        $req_host=$d['req_host'];

        $res_ct=$d['res_ct'];
        $res_cc=$d['res_cc'];
        $res_pr=$d['res_pr'];
        $res_ex=$d['res_ex'];
        $res_age=$d['res_age'];
        $res_lm=$d['res_lm'];
        $res_host=$d['res_host'];
        
        if($entry === 1 && $data['case']==0){ //Uploading to DB
            $sql1 = "INSERT INTO har_info VALUES(NULL,'$entry','$usrname', '$sDT', '$wait', '$sIP', '$method','$url', $status, '$statusTx','$lat','$lon','$req_ct', '$req_cc','$req_pr','$req_ex','$req_age','$req_lm','$req_host','$res_ct','$res_cc','$res_pr','$res_ex','$res_age','$res_lm','$res_host');";
            $result1 = $conn->query($sql1);
            $last_id = $conn->insert_id; // taking the last inserted har ID
        }
        else{
            //echo "else ", $last_id,"\n";
            if($data["case"]>0){
                $last_id=$data["lastid"]["id"];
            }
            //Uploading to DB   
            $sql1 = "INSERT INTO har_info VALUES('$last_id','$entry','$usrname', '$sDT', '$wait', '$sIP', '$method','$url', $status, '$statusTx','$lat','$lon', '$req_ct', '$req_cc','$req_pr','$req_ex','$req_age','$req_lm','$req_host','$res_ct','$res_cc','$res_pr','$res_ex','$res_age','$res_lm','$res_host');";
            $result1 = $conn->query($sql1);
        }        

        
    }// Ends Har's Info


    // User's Info -> Upload
    if($data['case']==0){
        $isp=$data['user_info']['isp'];
        $city=$data['user_info']['city'];
        $lat=$data['user_info']['lat'];
        $lon=$data['user_info']['lon'];

        $sql = "INSERT INTO cities VALUES('$last_id','$usrname','$city','$lat','$lon');";
        $result = $conn->query($sql);
        //Uploading to DB
        if ($result === TRUE) {
            echo "Insertion in table cities was successfully.\n";        
        } 
        else {
            $check = false;
            echo "\nError! Unsuccessful entry of the data in table cities with har_id: ", $last_id, " usrname: ",$usrname," city: ",$city," lat: ",$lat," lon: ",$lon,"\n";
        }

        $sql = "INSERT INTO i_providers VALUES('$last_id','$usrname','$isp');";
        $result = $conn->query($sql);
        //Uploading to DB
        if ($result === TRUE) {
            echo "Insertion in table i_providers was successfully.\n";        
        } 
        else {
            $check = false;
            echo "\nError! Unsuccessful entry of the data in table i_providers with har_id: ", $last_id, " usrname: ",$usrname," provider: ",$isp,"\n";
        }

        $sql = "INSERT INTO users_hars VALUES('$last_id','$usrname', CURRENT_TIMESTAMP);";
        $result = $conn->query($sql);
        //Uploading to DB
        if ($result === TRUE) {
            echo "Insertion in table users_hars was successfully.\n";        
        } 
        else {
            $check = false;
            echo "\nError! Unsuccessful entry of the data in table users_hars with har_id: ", $last_id, " usrname: ",$usrname,"\n";
        }
    } // End User's Info // Case==0


    //Checking if everything was successful
    if($check == true)
            echo "All the data have insert to the database successfully.\n";
    echo $entry,"\n";
    echo $last_id;

    $conn->close(); // close connection

?>