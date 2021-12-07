<?php

  include_once 'include_db.php';

  session_start();
  
  if (isset($_POST['signup'])) {
    $name = $conn->real_escape_string($_POST['name']);
    $surname = $conn->real_escape_string($_POST['surname']);
    $bdate = $conn->real_escape_string($_POST['date']);
    $gender = $conn->real_escape_string($_POST['gender']);
    $email = $conn->real_escape_string($_POST['email']);
    $username = $conn->real_escape_string($_POST['username']);
    $password = $conn->real_escape_string($_POST['password']);


    // CHECK IF THE USERNAME EXISTS 
    $quer1 = $conn->query("SELECT username FROM users ");
    $array = array();
    if ($quer1->num_rows >= 0) {
        while($row = $quer1->fetch_assoc()) {
            // echo "Username: " . $row["username"];
            $array[] = $row["username"];
            // print_r($array);
        } 
    }
    // else {
    //     exit(json_encode(array("status" => 0, "msg" => 'Please check inputs for username !')));
    // }

    $checkU = false;
    foreach ($array as $u) {
        // echo "noooo",$u;
        if($u == $username){
            $checkU = true;
            exit('<font color="red"><center>Username already exists.</center></font>');
        }
    }

    // CHECK IF THE EMAIL EXISTS 
    $quer2 = $conn->query("SELECT email FROM users ");
    $array2 = array();
    if ($quer2->num_rows >= 0) {
        while($row = $quer2->fetch_assoc()) {
            // echo "Username: " . $row["username"];
            $array2[] = $row["email"];
            // print_r($array);
        } 
    }
    // else {
    //     exit(json_encode(array("status" => 0, "msg" => 'Please check inputs for email!')));
    // }

    $checkE = false;
    foreach ($array2 as $u2) {
        // echo "noooo",$u;
        if($u2 == $email){
            $checkE = true;
            exit('<font color="red"><center>Email already exists.</center></font>');
        }
    }


    if ($checkU == false && $checkE == false) {
      
      $sql = "INSERT INTO users VALUES('$email','$username','$password','$name','$surname','$gender','$bdate');";
      $result = $conn->query($sql);

        if($result === TRUE){
            exit('<font color="limegreen"><center><b>Successful Sign Up!</b></center></font>');
        }
        else{
            exit('<font color="red"><center><b>Unsuccessful Sign Up :(</b></center></font>');
        }

    }
  }


  //$conn->close(); // close connection    

?>
<html>

<head>
    <link rel="stylesheet" href="SignUp.css">
<title>
    catHARstrophe Sign In
</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">

</head>

<body>
<body alink="whitesmoke" vlink="">
    
    <form id="frm1" method="post" class="main-box">
 
        <h1>Sign Up</h1>
        <p>To sign up to our platform you have to fill out the following form.</p> 

        <label for="fname">First name<mark class="star">*</mark>:</label><br>
        <input type="text" id="fname" name="fname" required><br><br>
      
        <label for="lname">Last Name<mark class="star">*</mark>:</label><br>
        <input type="text" id="lname" name="lname"required ><br><br>
      
        <label for="birthday">Date of Birth:</label><br>
        <input type="date" id="birthday" name="birthday"><br><br>
      
        <label for="genders">Gender:</label><br>
        <select id="genders" name="genders">
          <option value="male">Male</option>
          <option value="female">Female</option>
          <option value="non-binary">Non-Binary</option>  
        </select><br><br>
      
        <label for="email">Email<mark class="star">*</mark>:</label><br>
        <input type="email" id="email" name="email"  placeholder="john.doe@gmail.com" required><br><br>
      
        <label for="usern">Username<mark class="star">*</mark>:</label><br>
        <input type="text" id="usern" name="usern" required><br><br>
      
        <label for="pwd1">Password<mark class="star">*</mark>:</label><br>
        <input type="password" id="pwd1" name="pwd1" required onblur="pwdStrength()"> <br><br>
      
        <label for="pwd2">Re-Enter Password<mark class="star">*</mark>:</label><br>
        <input type="password" id="pwd2" name="pwd2" required onblur="myFunction()"> <br>
        
        <p id="demo"> <br><br></p> 
        <p id="demo2"> </p> 
        <input type="button" id="sbmt" value="Sign Up" class="btnSignUp" disabled>
        <p><mark class="star">*</mark>:fields marked with an asterisk are required for your sign-up.</p>
        <p id="response"> </p>

    </form>
      
      
  <div class="other">
          <p>If you have already Signed In, <a href="before_login.php"> Login Now</a> to view our exclusive content!</p>
  </div>

  <div class="info">
          <p>
            Let us remind you that by Signing In, you agree to the Terms of Service and Conditions.
            We at catHARstrophe value your privacy and we are hoping that you will allow us to keep doing that!
          </p>
  </div>

  <div class="logo">
    <a href="index.html"><img src="logo-w.png" height="90px" width="150px"></a>
</div>

</body>
</html>

<!-- For Password -->
<script>
  function myFunction() {
    //console.log('test');
    var x = document.getElementById("frm1");

      var psw1 = x.elements[6].value;
      var psw2 = x.elements[7].value;
      var n = psw1.localeCompare(psw2);
      if (n != 0){
        document.getElementById("demo").innerHTML = "Passwords don't match <br><br> "; //can we make this be in red font? 
        document.getElementById("sbmt").disabled = true; 
      }
      else{
        document.getElementById("sbmt").disabled = false;
        document.getElementById("demo").innerHTML = "<br><br>";
      }
    // document.getElementById("demo").innerHTML = text;
  }

  function pwdStrength() {
    var x = document.getElementById("frm1");

    var pwd = x.elements[6].value;
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

<!-- For action Button "Sign Up" -->
<script
  src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
</script>

<script type="text/javascript">
  $(document).ready(function () {
      //console.log('mes1');
      
      $("#sbmt").on('click', function () {
        var name=$('#fname').val(); 
        var surname=$('#lname').val(); 
        var date=$('#birthday').val();
        var gender=$('#genders').val(); 
        var email=$('#email').val();
        var username=$('#usern').val();
        var password=$('#pwd1').val();

        $.ajax({
          url: 'SignUp.php',
          method: 'POST',
          data: {signup: 1, name: name, surname: surname, date: date, gender: gender, email: email, username: username, password: password},                  
          success: function (response) {
              $("#response").html(response);              
              if (response.indexOf('successful') >= 0) {
                  // window.location = 'SignUp.php';
              }
            },
          dataType: 'text'
          });


      });
    });
</script>