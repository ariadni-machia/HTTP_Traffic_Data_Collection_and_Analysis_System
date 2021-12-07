<?php
include("include_db.php");

session_start();

if (!isset($_SESSION['loggedIN'])) {
    header('Location: before_login.php');
    exit();
}
    // if (isset($_SESSION['loggedIN'])) {
    //   $user = $_SESSION['username'];
    // }
?>
<!-- 2/09 AFTER LOGIN UI -->
<html>
    <head>
        <link rel="stylesheet" href="after_loginU_2.css">
        <title>
            Your personal catHARstrophe
        </title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
         <!-- for ajax -->
         <script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
        crossorigin="anonymous">
        </script>
           <!-- Map  -->
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"/>
        <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/heatmapjs@2.0.2/heatmap.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/leaflet-heatmap@1.0.0/leaflet-heatmap.js"></script>
        <!-- <style>
            #mapid { 
                display: none;
                height: 500px; 
                width: 90%;
                position: absolute; 
                top: 40%; 
                right: 10%;
            }
        </style> -->
    </head>

    <body>

      <div class="menu">
        <ul>
           <li>
                <div class="dropdown">
                    <img src="woman.png" onclick="myFunction()" alt="user" id="img" style="position: absolute; padding-left: 1px; top:10px; width:30px; border-radius: 50%; z-index: 2;">
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
                <a href="userIn2.php"> <img src="logo-w.png" height="55px" width="100px"/> </a> 
            </div>
      </div>

      

    <!-- after login screens -->
    <button class="UpHar" id="UpHar" type="button" onclick="display_panel_upHar()">Upload HAR files...</button>

    <button class="Stats" type="button" onclick="display_panel_stat()">See your statistics!</button>

    <button class="Heatmap" type="button" onclick="display_heatmap()">Heatmap</button>

    <!-- Box panel for Statistics  -->
    <div id="panel_stat" style="display:none; position: absolute; top: 40%; right: 10%; background-color: rgb(194, 187, 187); padding: 20px; width:50%; height:12%; text-align:left;">
        <p id="sumOfFiles"></p>
        <p id="latestDate"></p>
    </div>

    <!-- Box panel for Uploadind Har file  -->
    <div id="panel_upHar" style="display:none; position: absolute; top: 40%; right: 10%; background-color: rgb(194, 187, 187); padding: 20px; width:50%; height:10%; text-align:left;">
        <form>
            Select har to upload:
            <input type="file" accept=".har" name="filename">
            <input id="btnUpload" type="button" value="Upload" onclick="user_ip();uploadHar();" disabled='disabled'> 
            <span id="loading" style="display:none;">Loading File...</span>
        </form>
        <p id="response" style="text-align:center"> </p>
        <script type="text/javascript" src="user_info.js"></script>     <!-- user's info -->
        <script type="text/javascript" src="har_info.js"></script> <!-- har info -->
        
    </div>

    <div id="mapid" style="display: none; height: 500px; width: 60%; position: absolute; top: 20%; right: 3%;"></div> 
    
 

    



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

<!-- Displaying Statitics Panel  -->
<script>
    function display_panel_stat(){
        document.getElementById('panel_upHar').style.display= "none"; // Hiding the upHar panel
        document.getElementById('mapid').style.display= "none"; // Hiding the heatmap
        var spolier = document.getElementById('panel_stat');

        if(spolier.style.display == "none"){
            getStats();
            spolier.style.display= "block";
        }
        else {
            spolier.style.display = "none";
        }
    }
</script>

<!-- Displaying Uploading Panel  -->
<script>
    function display_panel_upHar(){
        document.getElementById('panel_stat').style.display= "none"; // Hiding the stats panel
        document.getElementById('mapid').style.display= "none"; // Hiding the heatmap
        var spolier = document.getElementById('panel_upHar');

        if(spolier.style.display == "none"){
            spolier.style.display= "block";            
        }
        else {
            spolier.style.display = "none";
        }
    }
</script>


<!-- function getStats -  getting user's statistics -->
<script>
    function getStats(){
        var ajax = new XMLHttpRequest();
        ajax.open("GET", "query_for_stats.php", true); // calling ajax
        ajax.send(); // sending ajax request

        // readyState == 4 -> the request is done/completed
        // status == 200 -> everything goes right
        ajax.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                var data=JSON.parse(this.responseText);
                $("#sumOfFiles").html("The number of files uploaded: "+data[0].count);
                var date= data[1].latest;
                date=date.split(" ");
                var time = date[date.length-1];
                date=date[date.length-2]
                date=date.split('-');
                date=date[2]+'-'+date[1]+'-'+date[0]; // formatting the date -> day-month-year
                $("#latestDate").html("Your latest upload -> Date: "+date+" | Time: "+time);
            }
        };
    }
    
</script>

<!-- Displaying Heatmap Panel  -->
<script>
let mymap;
 function display_heatmap(){
    document.getElementById('panel_stat').style.display= "none"; // Hiding the Stats panel
    document.getElementById('panel_upHar').style.display= "none";// Hiding the upHar panel
    var spolier = document.getElementById('mapid');

    if(spolier.style.display == "none"){
        RemoveExistingMap(mymap);
        spolier.style.display = "block";  
        getMapData();          
    }
    else {
        spolier.style.display = "none";
    }


 }
function getMapData(){
    $.ajax({
        url: "query_get_coodinates.php",
        method: "get",        
        success: function(res){
            // console.log("Coo: ",res);  
            data=JSON.parse(res);
            console.log("Coo: ",data);               
        }
    })
    .done(function(){
        makeMap(data);
    });

}

function makeMap(dataCoo){    
    mymap = L.map("mapid");
    let osmUrl = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
    let osmAttrib ='Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors';
    let osm = new L.TileLayer(osmUrl, { attribution: osmAttrib });
    mymap.addLayer(osm);
    mymap.setView([38.246242, 21.7350847],2);


    let MapData = {
        max: 8,
        data: dataCoo
    };
        
    let cfg = {
        // radius should be small ONLY if scaleRadius is true (or small radius is intended)
        // if scaleRadius is false it will be the constant radius used in pixels
        "radius": 40,
        "maxOpacity": 0.8,
        // scales the radius based on map zoom
        "scaleRadius": false,
        // if set to false the heatmap uses the global maximum for colorization
        // if activated: uses the data maximum within the current map boundaries
        //   (there will always be a red spot with useLocalExtremas true)
        "useLocalExtrema": false,
        // which field name in your data represents the latitude - default "lat"
        latField: 'lat',
        // which field name in your data represents the longitude - default "lng"
        lngField: 'lng',
        // which field name in your data represents the data value - default "value"
        valueField: 'count'
    };

    let heatmapLayer =  new HeatmapOverlay(cfg);

    mymap.addLayer(heatmapLayer);
    heatmapLayer.setData(MapData);
}
function RemoveExistingMap(map) { // Clearing Heatmap
    if (map != null) {
        map.remove();
        map = null;
    }
}



</script>


