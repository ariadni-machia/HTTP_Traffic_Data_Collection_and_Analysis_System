<html>

<head>
<link rel="stylesheet" href="admin1.css">
    <title>Admin's catHARstrophe</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <meta charset="ISO-8859-1">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <script src="https://cdn.anychart.com/releases/8.0.0/js/anychart-base.min.js"></script>
</head>

<body>

    <div class="menu">
        <ul class="ulmenu">
            <li><a href="admin1.php">Visualize Basic Data</a></li> <!-- FILL THE # => INSIDE THE PAGE LINK -->
            <li><a href="admin2.php">Analyze Response Time</a></li>
            <li><a href="admin3.php">HTTP Header Analysis</a></li>
            <li><a href="admin4.php">Map</a></li>
            <li><a href="logout.php">Log out</a></li>
        </ul>
    </div>
    
    <div class="logo">
        <img src="logo-w.png" height="60px" width="100px"/>
    </div>

    <button class="vbd_table" type="button" onclick="display_vdb_array()">Visualize Basic Data Using Array</button>
    <br><br>
    <button class="vbd_graph" type="button" onclick="display_vdb_graphs()" style="position:absolute; top:40%">Visualize Basic Data Using Graphs</button>

<!-- START: TABLE CODE APPEARS ON CLICK OF THE BUTTON "Visualize Basic Data Using Array"--> 
    <div id="panel_vbd_tables" style="display:none; position: absolute; top: 15%; left: 35%; background-color: rgb(194, 187, 187);; padding: 20px; width:35%; text-align:center;">
        <table>
            <tr>
            <th>No of Users</th>
            </tr>
            <tbody id="1a"></tbody>
        </table><br>

        <table>
            <tr>
            <th>Method</th>
            <th>Count</th>
            </tr>
            <tbody id="1b"></tbody>
        </table><br><br>

        <table >
            <tr>
            <th>Status</th>
            <th>Count</th>
            </tr>
            <tbody id="1c"></tbody>
        </table><br>

        <table>
            <tr>
            <th>No of unique domain</th>
            </tr>
            <tbody id="1d"></tbody>
        </table><br>

        <table>
            <tr>
            <th>Count</th>
            <th>Internet Provider</th>
            </tr>
            <tbody id="1e"></tbody>
        </table><br>

        <table>
            <tr>
            <th>Content Type</th>
            <th>Average Age</th>
            </tr>
            <tbody id="1f"></tbody>
        </table>
    </div>    
<!-- END: TABLE CODE APPEARS ON CLICK OF THE BUTTON "Visualize Basic Data Using Array"-->

<!-- START: GRAPH, BOX PANEL FOR GRAPHS -->
<div id="panel_vbd_graphs" style="display:none; position: absolute; top: 20%; right: 2%; background-color: rgb(194, 187, 187); padding: 10px; width:70%; height:60%; text-align:left;">

    <div id="container" style="width: 97%; height: 80%; margin-top: 0%"></div>

</div>
<!-- END: GRAPH, BOX PANEL FOR GRAPHS -->

<script>
        var ajax = new XMLHttpRequest();
        ajax.open("GET", "query_for_adm1.php", true); // calling ajax
        ajax.send(); // sending ajax request

        var check = 0;

        // readyState == 4 -> the request is done/completed
        // status == 200 -> everything goes right
        ajax.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var data=JSON.parse(this.responseText);
            console.log(data);
            // $("#sumOfUsers").html("The number of users: "+data[0].counta);

//start: print in table for 1A
            for(var a = 0; a < data.length; a++) {
                //console.log("a= ",a, "data ", data[a]);
                if (data[a].counta != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;                 
                    }
                }
            }

            var html = "";
            for (var a = starting; a<starting+check; a++ ) {
                var counta = data[a].counta;

                html += "<tr>";
                    html += "<td>" + counta + "</td>";
                html += "</tr>";
            }
                document.getElementById("1a").innerHTML += html;
//end: print in table for 1A

///////////////////////////////////////////
check = 0;
starting = 0;
//start: print in table for 1B
            for(var a = 0; a < data.length; a++) {
                //console.log("a= ",a, "data ", data[a]);
                if (data[a].method != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;
                    }
                }
            }

            var html = "";
            for (var a = starting; a<starting+check; a++) {
                var method = data[a].method; //pollapla apotelesmata
                var count = data[a].count;

                html += "<tr>";
                        html += "<td>" + method + "</td>";
                        html += "<td>" + count + "</td>";
                    html += "</tr>";
            }
                document.getElementById("1b").innerHTML += html;
//end: print in table for 1B
var g2G = data[starting].method; //eftiaksa kainourgies met gt epistrefoun pollapla apotel kai den ksero poio na traviksw
var g2g = data[starting].count; // g2G and g2g for get method
var g2P = data[starting+check-1].method; //g2P and g2p for post method
var g2p = data[starting+check-1].count; // -1 giati sto array data ksekinane apo 0


///////////////////////////////////////////
check = 0;
starting = 0;
//start: print in table for 1C
            for(var a = 0; a < data.length; a++) {
                //console.log("a= ",a, "data ", data[a]);
                if (data[a].status != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;
                    }
                }
            }

            const array_stat = []; //pinakes gia input sto grafhma
            const array_count = []; //pinakes gia input sto grafhma

            var html = "";
            for (var a = starting; a<starting+check; a++ ) {
                //console.log("hey");
                var status = data[a].status;
                var count = data[a].count;

                // array_stat[a] = status;
                // array_count[a] = count;

                html += "<tr>";
                        html += "<td>" + status + "</td>";
                        html += "<td>" + count + "</td>";
                    html += "</tr>";
            }
                document.getElementById("1c").innerHTML += html;

            console.log(array_stat);
            console.log(array_count);
//end: print in table for 1C


///////////////////////////////////////////
check = 0;
starting = 0;
//start: print in table for 1D
            for(var a = 0; a < data.length; a++) {
                //console.log("a= ",a, "data ", data[a]);
                if (data[a].uniq != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;
                    }
                }
            }

            var html = "";
            for (var a = starting; a<starting+check; a++ ) {
                //console.log("hey");
                var unique = data[a].uniq;

                html += "<tr>";
                        html += "<td>" + unique + "</td>";
                    html += "</tr>";
            }
                document.getElementById("1d").innerHTML += html;
//end: print in table for 1D
var g4U = data[starting].uniq;
console.log(g4U);

// graph start
anychart.onDocumentReady(function() {

// set the data of the chart
var Chart1a = {
    header: ["Number Of Users", "Value"],
    rows: [
      ["Number of Users", counta],
      ["Number of Method " +g2G, g2g],
      ["Number of Method " +g2P, g2p],
      ["Number of Unique Domains ", g4U]
    ]
};

// create the chart
var chart = anychart.bar();

// add the data
chart.data(Chart1a);

// set the chart title
chart.title("Admin's Basic Information");

// draw
chart.container("container");
chart.draw();
});
// graph end

///////////////////////////////////////////
check = 0;
starting = 0;
//start: print in table for 1E
            for(var a = 0; a < data.length; a++) {
                if (data[a].provid != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;
                    }
                }
            }

            var html = "";
            for (var a = starting; a<starting+check; a++ ) {
                var provid = data[a].provid;
                var provider = data[a].provider;
                //console.log(provider);
                const pro = provider.split(" ", 2);
                // console.log(pro);

                html += "<tr>";
                        html += "<td>" + provid + "</td>";
                        html += "<td>" + pro[0] + " "+pro[1] + "</td>";
                    html += "</tr>";
            }
                document.getElementById("1e").innerHTML += html;
//end: print in table for 1E

///////////////////////////////////////////
check = 0;
starting = 0;
//start: print in table for 1F
            for(var a = 0; a < data.length; a++) {
                if (data[a].avg != null) {
                    check++;
                    if (check == 1) {
                        var starting = a;
                    }
                }
            }

            var html = "";
            for (var a = starting; a<starting+check; a++ ) {
                var avg = data[a].avg;
                var res_content_type = data[a].res_content_type;

                html += "<tr>";
                        html += "<td>" + res_content_type + "</td>";
                        html += "<td>" + avg + "</td>";
                    html += "</tr>";
            }
                document.getElementById("1f").innerHTML += html;
//end: print in table for 1F
        }
        };

    </script>

</body>
</html>

<script>
        function display_vdb_graphs(){
            document.getElementById('panel_vbd_tables').style.display= "none"; 
            var spolier = document.getElementById('panel_vbd_graphs');

            if(spolier.style.display == "none"){
                spolier.style.display= "block";
            }
            else {
                spolier.style.display = "none";
            }
        }
</script>

<script>
        function display_vdb_array(){
            document.getElementById('panel_vbd_graphs').style.display= "none";
            var spolier = document.getElementById('panel_vbd_tables');

            if(spolier.style.display == "none"){
                spolier.style.display= "block";
            }
            else {
                spolier.style.display = "none";
            }
        }
</script>