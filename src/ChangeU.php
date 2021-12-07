<?php

include("include_db.php");
session_start();

    if (!isset($_SESSION['loggedIN'])) {
        header('Location: index.html');
        exit();
    }

// START: CHANGE USERNAME PHP

    if (isset($_POST['oldu'])) {
        // echo "im in";
        $oldu = $conn->real_escape_string($_POST['oldu']);

        $sql = $conn->query(query: "SELECT email FROM users WHERE username = '$oldu'");
        $res = $sql->fetch_array();
        if ($sql->num_rows > 0) {
            // echo "1";
        }
        else {
            exit(json_encode(array("status" => 0, "msg" => 'Please check inputs!')));
        }
        
        $data = array(); // to store stuff
        $data[0] = $oldu;

        // print_r($data);

        if (isset($_POST['newu']) && isset($_POST['cnewu'])) {

            $newu = $conn->real_escape_string($_POST['newu']);
            $cnewu = $conn->real_escape_string($_POST['cnewu']);

            $quer = $conn->query(query:"SELECT username FROM users ");
            $array = array();
            if ($quer->num_rows > 0) {
                while($row = $quer->fetch_assoc()) {
                    // echo "Username: " . $row["username"];
                    $array[] = $row["username"];
                    // print_r($array);
                } 
            }
            else {
                exit(json_encode(array("status" => 0, "msg" => 'Please check inputs!')));
            }

            $check = false;
            foreach ($array as $u) {
                // echo "noooo",$u;
                if($u == $cnewu){
                    $check=true;
                    exit('<font color="white"><center>Username already exists.</center></font>');
                }
            }

            if ($newu == $cnewu && $newu != "" && $check==false) {
                $change = $conn->query(query: "UPDATE users SET username = '$cnewu' WHERE username = '$oldu' ");
                exit('<font color="black"><center>Username changed successfully!</center></font>');
            }
            // CHNAGE THE COLOR OF THE LETTERS TO WHITE 
            else {
                exit('<font color="white"><center>Username error. Please check your inputs.</center></font>');
            }
        }
    }
// END: CHANGE USERNAME PHP
?>

<html>
<body>

    <div class="change_username"> 
        <form action="">
            
            <h1>Change Username</h1>

            <label for="old_username">Enter your old username here:</label>
            <input class="form-control" id="oldu" placeholder="Old Username:"><br>
            <br>
            <label for="new_username">Enter your new username here:</label>
            <input class="form-control" id="newu" placeholder="New Username:"><br>
            <br>
            <label for="cnew_username">Confirm your new username here:</label>
            <input class="form-control" id="cnewu" placeholder="Confirm new Username:"><br>
            <br>
            <input type="button" id="btn1" class="button" value="Reset Username"><br><br>
            <p id="response"> </p>

        </form>

        <!-- <a id="logout" href="logout.php" >Log out</a> -->

    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    
    <!-- START: CHANGE USERNAME SCRIPT -->

    <script type="text/javascript">
        //console.log("hi");
        var oldu = $("#oldu");
        var newu = $("#newu");
        var cnewu = $("#cnewu");

        $(document).ready( function () {
            //console.log("1");
            $('#btn1').on('click', function () {
                //console.log("2");
                if(oldu.val() != "" && newu.val() == cnewu.val()) {
                    
                    $.ajax ({
                        url: 'ChangeU.php',
                        method: 'POST',
                        dataType: 'text',
                        data: { // ti thelw na parw
                            oldu: oldu.val(),
                            newu: newu.val(),
                            cnewu: cnewu.val()
                        },
                        success: function (response) {
                            $("#response").html(response);
                            if (response.indexOf('Username') >= 0) {
                            }
                        }
                    });
                } 
                else {
                    alert('Check input');
                }
            });
        });
    </script>
<!-- END: CHANGE PASSWORD SCRIPT -->

</body>
</html>