<html>
<head>
    <link rel="stylesheet" href="userIn2.css">
<title>
    Your personal catHARstrophe
</title>
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
</head>

<body>
      
    <div class="menu">
        <!-- MENUUUUUUUUU -->
        <ul >
           <li>
                <a class="con" href="#contact">Contact Us</a>
                <a class="q" href="#questions">FAQ</a>
                <a class="abt" href="#about">About Us</a>
                 


                <div class="dropdown">
                    <img src="woman.png" onclick="myFunction()" alt="user" id="img" style="position: absolute; padding-left:6px; top:20px; width:30px; border-radius: 50%; z-index: 2;">
                    <button class="dropbtn" onclick="myFunction()">&nbsp;&nbsp;&nbsp;&nbsp;My account
                    <i class="fa fa-caret-down"></i>
                    </button>
                    <div class="dropdown-content" id="myDropdown" >
                      <a href="Settings.php">Profile Settings</a>
                      <a href="after_loginU.php">My Homepage</a>
    
                      <a id="logout" href="logout.php" >Log out</a>
                    </div>
                </div>
            </li>
        </ul>
        
        <div class="logo">
            <a href="after_loginU.php"> <img src="logo-w.png" height="55px" width="100px"/> </a>
        </div>

    </div>

    <div class="quote">
        <p>"Imagination is more important than knowledge.</br> 
            For knowledge is limited, whereas imagination embraces </br>the entire world, 
            stimulating progress, giving birth to evolution."<br></p>
          <p>-Albert Einstein</p>
    </div>

    <div class="wave-container">
        <svg viewbox="0 0 100 20">
            <path fill="rgb(119, 118, 134)" opacity="0.5" d="M0 30 V15 Q30 3 60 15 V30z" />
            <path fill="rgb(23, 33, 51)" opacity="0.95" d="M0 30 V12 Q30 17 55 12 T100 11 V30z" />
          </svg> 
    </div>

    <div class="mirror-wave">
        <svg viewbox="0 0 100 20" class="mirror">
            <path fill="rgb(119, 118, 134)" opacity="0.5" d="M0 30 V15 Q30 3 60 15 V30z" />
            <path fill="rgb(23, 33, 51)" opacity="0.95" d="M0 30 V12 Q30 17 55 12 T100 11 V30z" />
          </svg> 
    </div>

   

    <div class="information">
            
        <div class="about">
            <h2><a name="About"><u>About Us</u></a></h2>
            <p>We originally created this website as a project for our Univercity course. As we started studying more and more in order to complete it we were
                fascinated about the way that the World Wide Web actually works. So after our project was complete we decided to share all the things we learnt with you!</p>
            <p>All that being said, we are very happy that you landed to our website, catHARstrophe.
                We hope you join us and find out how servers respond to multiple HTTP requests that you make while using your internet browser.
                Don't worry there will be plenty cat content.(we can't lie, we love them too!)
            </p>
        </div> 
            </br></br>

        <div class="question">
            <h2><a name="Questions"><u>Frequently Asked Questions</u></a></h2>
            <ul class="faq">
                <li>What is a HAR file?</li>
                <p>The HTTP Archive format, or HAR, is a JSON-formatted archive file format for logging of a web browser's interaction with a site.</p></br>
                <li>What are HAR files used for?</li>
                <p>A HAR file is primarily used for identifying performance issues, such as bottlenecks and slow load times, and page rendering problems.</p></br>
                <li>What do the initials of HAR stand for?</li>
                <p>The HTTP Archive format.</p></br>
            </ul>
        </div>
            </br></br>

            <hr class="line">
        <div class="contact">
            <h2><a name="Contact"><u>Contact Us</u></a></h2>
                <p>If you have more questions about our website, feel free to contact the creators of the website.</p>
                <p><b>Ariadni M.</b></p>
                <p><b>Aspasia K.</b></p>
        </div>
    </div>

    <script>
        /* When the user clicks on the button, 
        toggle between hiding and showing the dropdown content */
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
</body>
</html>