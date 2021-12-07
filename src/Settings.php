<?php

include("include_db.php");
session_start();


    
    if (!isset($_SESSION['loggedIN'])) {
        header('Location: index.html');
        exit();
    }
    if (isset($_SESSION['loggedIN']) ) {
        $user = $_SESSION['username'];
    }

// START: CHANGE PASSWORD PHP
    if (isset($_POST['email'])) {

        // echo '<script type="text/javascript">CheckPasswordFunction();</script>';
        $sql0 = $conn->query("SELECT email FROM users WHERE username = '$user'");
        if ($sql0->num_rows > 0) {
            // echo "sasdasdasdasd";
        }
        else {
            exit(json_encode(array("status" => 0, "msg" => 'Please check inputs!')));
        }
        $result0 = $sql0->fetch_array();

        $email = $conn->real_escape_string($_POST['email']);

        $sql = $conn->query("SELECT username, pwd FROM users WHERE email = '$email'");
        if ($sql->num_rows > 0) {
            // echo "sasdasdasdasd";
        }
        else {
            exit(json_encode(array("status" => 0, "msg" => 'Please check inputs!')));
        }

        $result = $sql->fetch_array();

        $data = array(); // to store the email and the username
        $data[0] = $email; //email
        $data[1] = $result['username']; //username
        $data[2] = $result['pwd']; // password apo thn vash
    
        if (isset($_POST['oldp']) && isset($_POST['newp']) && isset($_POST['cnewp'])) {
            $old_pass = $conn->real_escape_string($_POST['oldp']); // password pou vazei o xrhshths

            $newp = $conn->real_escape_string($_POST['newp']);
            $cnewp = $conn->real_escape_string($_POST['cnewp']);

            if($result['pwd'] == $old_pass && $newp == $cnewp && $result0[0]==$email) {
                $change = $conn->query("UPDATE users SET pwd = '$cnewp' WHERE email = '$email' AND username = '$data[1]'");
                exit('<font color="white"><center>Password changed successfully!</center></font>');
            }

            else {
                exit('<font color="white"><center>Please check your inputs.</center></font>');
            }
        }
    }
// END: CHANGE PASSWORD PHP
//////////////////////////////////////////////////////////////
// START: CHANGE USERNAME PHP

    if (isset($_POST['oldu'])) {
        // echo "im in";
        $oldu = $conn->real_escape_string($_POST['oldu']);

        $sql = $conn->query("SELECT email FROM users WHERE username = '$oldu'");
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

            $quer = $conn->query("SELECT username FROM users ");
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

            if ($newu == $cnewu && $newu != "" && $check==false && $user==$oldu) {
                $change = $conn->query("UPDATE users SET username = '$cnewu' WHERE username = '$oldu' ");
                $_SESSION['username']=$newu;
                exit('<font color="white"><center>Username changed successfully!</center></font>');
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
<head>
<link rel="stylesheet" href="Settings.css">

<title>
    Your personal catHARstrophe
</title>

<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

<!-- <script type="text/javascript">
    function CheckPasswordFunction(){
        alert('Execute Javascript Function Through PHP');
    }
</script> -->

</head>
<body>

    <div class="change_password"> 
        <form method="post" id="frm1">
            
        <h1>Change Password</h1>

            <label for="email">Enter your email here:</label>
            <input class="form-control" id="email" placeholder="Email Address" required><br>
            <br>
            <label for="old_password">Enter your old password here:</label>
            <input type="password" class="form-control" id="oldp" placeholder="Old Password" required><br>
            <br>
            <label for="new_password">Enter your new password here:</label>
            <input type="password" class="form-control" id="newp" placeholder="New Password" required onblur="pwdStrength()"><br>
            <br><label for="cnew_password" >Confirm your new password here:</label><br>
            <input type="password" class="form-control" id="cnewp" placeholder="Confirm new Password" required><br>
            <br>
            <input type="button" id="btn" class="button" value="Reset Password"><br><br>
            <p id="response"></p>
            <p id="demo"></p> 
            <p id="demo2"></p>

        </form>
    </div>

    <div class="change_username"> 
        <form action="">
            
            <h1>Change Username</h1>

            <label for="old_username">Enter your old username here:</label>
            <input class="form-control" id="oldu" placeholder="Old Username"><br>
            <br>
            <label for="new_username">Enter your new username here:</label>
            <input class="form-control" id="newu" placeholder="New Username"><br>
            <br>
            <label for="cnew_username">Confirm your new username here:</label>
            <input class="form-control" id="cnewu" placeholder="Confirm new Username"><br>
            <br>
            <input type="button" id="btn1" class="button" value="Reset Username"><br><br>
            <p id="response1"></p>
        </form>
    </div>

    <div class="menu">
        <ul>
            <li>
                <div class="dropdown">
                    <img src="woman.png" onclick="myFunction()"   alt="user" style="position: absolute; padding-left: 3px; top:20px; width:30px; border-radius: 50%; z-index: 2;"  >
                    <button class="dropbtn" onclick="myFunction()">&nbsp;&nbsp;&nbsp;&nbsp;My account
                      <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content" id="myDropdown" >
                      <a href="Settings.php">Profile Settings</a>
                      <a href="after_loginU.php">My Homepage</a>
    
                      <a id="logout" href="logout.php" >Log out</a>
                    </div>
                </div> 
    </div>

    <div class="logo">
        <a href="userIn2.php"> <img src="logo-w.png" height="55px" width="100px"/> </a>
    </div>


    <!-- <a class="pLink" href="#profile">Profile Details</a>
    <a class="passLink" href="#change_password">Change Password</a>
    <a class="usernLink" href="#change_username">Change Username</a>

    <hr class="line"> -->

    <script>/* When the user clicks on the button, toggle between hiding and showing the dropdown content */
        function myFunction() {
          document.getElementById("myDropdown").classList.toggle("show");
        }
        // Close the dropdown if the user clicks outside of it
        window.onclick = function(e) {
          if (!e.target.matches('.dropbtn')) {
          var myDropdown = document.getElementById("myDropdown");
            if (myDropdown.classList.contains('show')) {
              myDropdown.classList.remove('show');
            }
          }
        }
    
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>


<!-- START: CHANGE PASSWORD SCRIPT -->
    <script type="text/javascript">
        var email = $("#email");
        var oldp = $("#oldp");
        var newp = $("#newp");
        var cnewp = $("#cnewp");

        $(document).ready( function () {
            $('#btn').on('click', function () {

                if(email.val() != "" && newp.val() == cnewp.val()) {
                    $.ajax ({
                        url: 'Settings.php',
                        method: 'POST',
                        dataType: 'text',
                        data: { // ti thelw na parw
                            email: email.val(),
                            oldp: oldp.val(),
                            newp: newp.val(),
                            cnewp: cnewp.val()
                        },
                        success: function (response) {
                            $("#response").html(response);
                            if (response.indexOf('successfully') >= 0) {
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
                        url: 'Settings.php',
                        method: 'POST',
                        dataType: 'text',
                        data: { // ti thelw na parw
                            oldu: oldu.val(),
                            newu: newu.val(),
                            cnewu: cnewu.val()
                        },
                        success: function (response1) {
                            $("#response1").html(response1);
                            if (response1.indexOf('Username') >= 0) {
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

<!-- START: CHECK IF PASSWORD IS STRONG ENOUGH SCRIPT -->
<script>
function pwdStrength() {
    var x = document.getElementById("frm1");

    var pwd = x.elements[2].value;
    var patt1 = /.{8,}/g; 
    var patt2 = /[A-Z]/;
    var patt3 = /[0-9]/;
    var patt4 = /[#@&!*]/;
    var result1 = patt1.test(pwd);
    var result2 = patt2.test(pwd);
    var result3 = patt3.test(pwd);
    var result4 = patt4.test(pwd);
    if (result1 != true){
      document.getElementById("demo").innerHTML ="The password should be at least 8 characters long.";
      document.getElementById("sbmt").disabled = true;
      document.getElementById("pwd2").disabled = true;
    }
    else if(result1 && result2 && result3 && result4 ){
      //document.getElementById("demo").innerHTML = "";//"The password is strong enough";
      //document.getElementById("sbmt").disabled = false;
      document.getElementById("pwd2").disabled = false;
    }
    else{
      document.getElementById("demo").innerHTML = "The password is too weak. Should contain at least one capital letter, one number and one symbol.";
      document.getElementById("pwd2").disabled = true;
      document.getElementById("sbmt").disabled = true;
    }
}
</script>
<!-- END: CHECK IF PASSWORD IS STRONG ENOUGH SCRIPT -->

</body>
</html>