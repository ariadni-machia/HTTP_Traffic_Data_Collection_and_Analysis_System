<?php
include("include_db.php");
    session_start();

    //if already logged in
    if (isset($_SESSION['loggedIN'])) {
        header('Location: after_loginU.php');

        exit();
    }

    if (isset($_SESSION['loggedINA'])) {
        header('Location: admin.php');

        exit();
    }

    if (isset($_POST['login'])) {
        $username = $conn->real_escape_string($_POST['username']); //met sthn 120
        $password = $conn->real_escape_string($_POST['password']); //met sthn 121

        $res = false;

        $admin = $conn->query("SELECT username FROM admins WHERE username = '$username' AND pwd = '$password'");

            if ($admin-> num_rows > 0) { // to login
                $_SESSION['loggedINA'] = '1';
                $_SESSION['username'] = $username;
                exit('<font color="white"><center>Admin login successfull!</center></font>');
            }

            else {
                $res = true;

                if ($res == true) {
                    $data = $conn->query("SELECT email FROM users WHERE username = '$username' AND pwd = '$password'");
        
                    if ($data-> num_rows > 0) { // to login
                        $_SESSION['loggedIN'] = '1';
                        $_SESSION['username'] = $username;
                        exit('<font color="white"><center>User login successfull!</center></font>');
                    }
        
                    else {
                        exit('<font color="red"><center>Please check your inputs.</center></font>');
                    }
                }
            }
    }
?>

<html>
<head>
    <link rel="stylesheet" href="before_login.css">

    <title>
        catHARstrophe Login
    </title>

    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>

<body>

    <div class="login-box">
        </br>
        <h1>Login Here!</h1>
    
        <form method="post" action="before_login.php">

            <img src="user.png" class="user"/>
            <p>Username</p>
            <input type="text" id="user" placeholder="Enter Username"><br>
            <p>Password</p>
            <input type="password" id="pass" placeholder="Enter Password"><br>
            <input type="button" id="login" class="button" value="Log In"><br>
            <p class="forget">Forgot Password? Click <a href="before_login.php">here</a>.</p><br>
            <p id="response"> </p>
        </form>
        
    </div>

    <div class="logo">
        <a href="index.html"><img src="logo-w.png" height="90px" width="150px"></a>
    </div>

    <script
        src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    
    <script type="text/javascript">
        $(document).ready(function () {
            //console.log('mes1');
            
            $("#login").on('click', function () {
                //console.log('mes2');
                
                var username = $("#user").val();
                var password = $("#pass").val();
                //console.log(username);

                if (username == "" || password == "") {
                    alert('Check input');
                }

                else {
                    $.ajax(
                        {
                            url: 'before_login.php',
                            method: 'POST',
                            data: {
                                login: 1,
                                username: username,
                                password: password
                            },
                            
                            success: function (response) {
                                $("#response").html(response);
                                    console.log("everything ok!");

                                if ( response.indexOf('Admin') >= 0) {
                                    window.location = 'admin.php';
                                }
                                else {
                                    window.location = 'after_loginU.php';
                                }


                              },

                            dataType: 'text'
                        }
                    );
                }

            });
        });
    </script>

</body>
</html>