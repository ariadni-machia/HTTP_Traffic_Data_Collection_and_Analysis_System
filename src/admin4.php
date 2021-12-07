<html>

<head>
    <link rel="stylesheet" href="admin.css">
    <title>Admin's catHARstrophe</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <!-- for ajax -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous">
    </script>

    <!-- Map  -->
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.3.4/dist/leaflet.css"/>
    <script src="https://unpkg.com/leaflet@1.3.4/dist/leaflet.js" ></script>

</head>

<body>
    <div class="menu">
        <ul class="ulmenu">
            <li><a href="admin1.php">Visualize Basic Data</a></li> 
            <li><a href="admin2.php">Analyze Response Time</a></li>
            <li><a href="admin3.php">HTTP Header Analysis</a></li>
            <li><a href="admin4.php">Map</a></li>
            <li><a href="logout.php">Log out</a></li>
        </ul>
    </div>
    
    <div class="logo">
        <img src="logo-w.png" height="60px" width="100px"/>
    </div>

    <div id="mapid" style="height: 500px; width: 70%; position:absolute; left:15%; top:20%"></div>

    <script>
        getMapData();
        function getMapData(){
            $.ajax({
                url: "query_get_coodinates_admin.php",
                method: "get",        
                success: function(res){
                    data=JSON.parse(res);
                    console.log("Coo: ",data);               
                }
            })
            .done(function(){
                makeMap(data);
            });

        }
    </script>
    <script>
        function makeMap(dataCoo){   
            let mymap = L.map("mapid");
            let osmUrl = "https://tile.openstreetmap.org/{z}/{x}/{y}.png";
            let osmAttrib ='Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors';
            let osm = new L.TileLayer(osmUrl, { attribution: osmAttrib });
            mymap.addLayer(osm);
            mymap.setView([38.246242, 21.7350847], 2);
            for(var i=0;i<dataCoo.length;i++){
                let marker = L.marker(dataCoo[i]);
                marker.addTo(mymap);
            }
        }
        // function RemoveExistingMap(map) { // Clearing Heatmap
        //     if (map != null) {
        //         map.remove();
        //         map = null;
        //     }
        // }
    </script>


    
   
</body>
</html>


