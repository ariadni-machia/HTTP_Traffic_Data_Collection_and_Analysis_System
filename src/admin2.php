<html>

<head>
    <link rel="stylesheet" href="admin2_2.css">
    <title>Admin's catHARstrophe</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <!-- for ajax -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"
    integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0="
    crossorigin="anonymous">
    </script>
    

    <!-- for multiselect -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="css/bootstrap-multiselect.css">

    <!-- CSS for multiselects-dropdowns  -->
    <style> 
    .table-row {
        position: absolute;
        left: 6%;
        display: table-row;
        height: 100px;
        width: 90%;
    }
    .table-cell {
        border: 1px solid;
        background: rgb(194, 187, 187);
        display: table-cell;
        padding: 20px;
    }
    </style>

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

    <br>
    <h2 style="text-decoration: underline; text-align: center;">Analyze Response Time</h2>
    <br>
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- ~2A~ Content Type -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>

    
    <div class="table-row">
        <div class="table-cell">
            <h4>Content-Types</h4>
            <form method="get">
            <select class="form-control" id="selectoption" multiple="multiple">
            </select>
            <input type="button" value="Display" class="btn btn-primary" onclick="getSelected()">
            </form>
        </div> <!--  ends "table-cell" for ~2A~ Content Type  -->
    <!-- ~2A~ Content Type END-->
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- ~2B~ Day of the Week -->
        <div class="table-cell">
            <h4>Day Of the Week</h4>
            <form method="get">
                <select class="form-control" id="selectday" multiple="multiple">
                    <option value="Monday">Monday</option>
                    <option value="Tuesday">Tuesday</option>
                    <option value="Wednesday">Wednesday</option>
                    <option value="Thursday">Thursday</option>
                    <option value="Friday">Friday</option>
                    <option value="Saturday">Saturday</option>
                    <option value="Sunday">Sunday</option>
                </select>
                <input type="button" value="Display" class="btn btn-primary" onclick="getSelectedDay()">
            </form>
        </div> <!--  ends "table-cell" for ~2B~ Day of the Week  -->

    <!-- Getting Day of the Week for Select Dropdown  -->
    <script type="text/javascript">
        $('#selectday').multiselect({
            includeSelectAllOption:true,
            // nonSelectedText:'Select Option',
            enableFiltering:true,
            buttonWidth:'200px'
        });

    </script>

    <!-- ~2B~ Day of the Week END-->
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- ~2C~ HTTP Method -->
        <div class="table-cell">
            <h4>HTTP Methods</h4>
            <form method="get">
                <select class="form-control" id="selectmethod" multiple="multiple">
                </select>
                <input type="button" value="Display" class="btn btn-primary" onclick="getSelectedMethod()">
            </form>
        </div> <!--  ends "table-cell" for ~2C~ HTTP Method  -->
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- ~2D~ Internet Provider -->
        <div class="table-cell">
            <h4>Internet Providers</h4>
            <form method="get">
                <select class="form-control" id="selectprovider" multiple="multiple">
                </select>
                <input type="button" value="Display" class="btn btn-primary" onclick="getSelectedProvider()">
            </form>
            </div> <!--  ends "table-cell" for ~2D~ Internet Provider  -->
    </div> <!--  ends "table-row" -->
    <!-- ~2D~ Internet Provider END -->
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->
    <!-- Graph -->
    
    <div id="chartContainer" style="height: 400px; width: 95%; position:absolute; top: 45%; left: 2.5%"></div>
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
    <!-- Graph END-->
    <!-- ---------------------------------------------------------------------------------------------------------------------- -->

</body>
</html>

<!-- ======================================================================================================================== -->
<!-- ~2A~ Content Type -->
<!-- Getting Content Types for Select Dropdown  -->
<script>
    var ct=[];// distinct content type
    var ajax = new XMLHttpRequest();
    ajax.open("GET", "query_for_type_web_obj.php", true); // calling ajax
    ajax.send(); // sending ajax request

    // readyState == 4 -> the request is done/completed
    // status == 200 -> everything goes right
    ajax.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var data=JSON.parse(this.responseText);
            // console.log(data);
            for(var j=0;j<data.length;j++){
                $.each(data[j], function(i, el){
                    el= el.toLowerCase(); //making everything lowcase
                    el= el.replace(' ','');// erasing spaces
                    var temp= el.split(";"); // getting every different type 
                    for(k=0;k<temp.length;k++){ 
                        if($.inArray(temp[k], ct) === -1 && temp[k]!=""){ // $.inArray(temp[k], ct)-> Search for a specified value within array ct and return its index (or -1 if not found).
                            ct.push(temp[k]);
                        } 
                    }     
                });
            }
            
            // console.log("Content-Types:",ct);

            var select = document.getElementById("selectoption"); 
            // Clear all existing options first:
            // select.innerHTML = "";
            // Fill list with options from ct:
            for(var i = 0; i < ct.length; i++) {
                var opt = ct[i];
                select.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectoption').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'300px'
            });

        }
    };
    
</script>

<!-- For Analyze Response Time For Content Type -->
<script>
    // Gets the selected values from the dropdown menu for Content-Type 
    function getSelected(){
        var sel = $('#selectoption').val();
        let sel_json={}
        $.each(sel, function(i, el){
            var h={};
            h.type=el;
            sel_json[i]=h;
        });
        console.log("Selected: ",sel_json);
        getAvgWait(sel_json);
    }

    function getAvgWait(selected){
        // console.log("===",selected);
        // At lest one is selected
        $.ajax({
            url: "query_analyze_response_time.php",
            method: "post",
            data: selected,            
            success: function(res){// Return AVG
                var data=JSON.parse(res);
                console.log("Avg Wait by time: ",data);                
                $("#avgOfCT").html("The Avegerage Wait Timw is: "+res);
                makeGraph(data);
            }
        });
    }

</script>

<!-- Graph For Content Type-->
<script>
    var dataPoints_a = [];

    var options_a =  {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "Content-Types"
        },
        axisX: {
            title: "Hour"
        },
        axisY: {
            title: "Response Time",
            titleFontSize: 24
        },
        data: [{
            type: "spline", 
            yValueFormatString: "$#,###.##",
            dataPoints: dataPoints_a
        }]
    };

    function makeGraph(data){
        dataPoints_a.length = 0 // clearing dataPoints 
        for (var i = 0; i < data.length; i++) {
            dataPoints_a.push({
                x: i,
                y: data[i]
            });
        }
        $("#chartContainer").CanvasJSChart(options_a);

    }


</script>
<!-- ======================================================================================================================== -->
<!-- ~2B~ Day of the Week -->

<!-- For Analyze Response Time For Day Of the Week -->
<script>
    // Gets the selected values from the dropdown menu for Day of the Week
    function getSelectedDay(){
        var sel = $('#selectday').val();
        let sel_json={}
        $.each(sel, function(i, el){
            var h={};
            h.day=el;
            sel_json[i]=h;
        });
        console.log("Selected Day: ",sel_json);
        getAvgWaitByDay(sel_json);
    }

    function getAvgWaitByDay(selected){
    // console.log("===",selected);
    // At lest one is selected
    $.ajax({
            url: "query_analyze_response_time_per_day.php",
            method: "post",
            data: selected,            
            success: function(res){// Return AVG
                var data=JSON.parse(res);
                console.log("Avg Wait Time Per Day: ",data);                
                makeGraph_B(data);
            }
        });
    }

</script>

<!-- Graph For Day of the Week-->
<script>
    var dataPoints_b = [];

    var options_b =  {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "Days of the Week"
        },
        axisX: {
            title: "Hour"
            // valueFormatString: "#",
        },
        axisY: {
            title: "Response Time",
            titleFontSize: 24
        },
        data: [{
            type: "spline", 
            yValueFormatString: "$#,###.##",
            dataPoints: dataPoints_b
        }]
    };

    function makeGraph_B(data){
        dataPoints_b.length = 0 // clearing dataPoints 
        for (var i = 0; i < data.length; i++) {
            dataPoints_b.push({
                x: i,
                y: data[i]
            });
        }
        $("#chartContainer").CanvasJSChart(options_b);

    }
</script>
<!-- ======================================================================================================================== -->
<!-- ~2C~ HTTP Method -->
<!-- Getting Content Types for Select Dropdown  -->
<script>
    var methods=[];// distinct method
    var ajax = new XMLHttpRequest();
    ajax.open("GET", "query_for_http_methods.php", true); // calling ajax
    ajax.send(); // sending ajax request

    // readyState == 4 -> the request is done/completed
    // status == 200 -> everything goes right
    ajax.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var data=JSON.parse(this.responseText);
            for(var j=0;j<data.length;j++){
                $.each(data[j], function(i, el){
                    el= el.toUpperCase(); //making everything upper case
                    if($.inArray(el, methods) == -1 && el!=""){ // $.inArray(temp[k], ct)-> Search for a specified value within array ct and return its index (or -1 if not found).
                        methods.push(el);
                    } 
                        
                });
            }
            
            // console.log("Methods:",methods);

            var select = document.getElementById("selectmethod"); 
            // Fill list with options from methods:
            for(var i = 0; i < methods.length; i++) {
                var opt = methods[i];
                select.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectmethod').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'150px'
            });

        }
    };
    
</script>

<!-- For Analyze Response Time For HTTP Method -->
<script>
    // Gets the selected values from the dropdown menu for HTTP Method
    function getSelectedMethod(){
        var sel = $('#selectmethod').val();
        let sel_json={}
        $.each(sel, function(i, el){
            var h={};
            h.method=el;
            sel_json[i]=h;
        });
        console.log("Selected Method: ",sel_json);
        getAvgWaitByMethod(sel_json);
    }

    function getAvgWaitByMethod(selected){
    // console.log("===",selected);
    // At lest one is selected
    $.ajax({
            url: "query_analyze_response_time_per_method.php",
            method: "post",
            data: selected,            
            success: function(res){// Return AVG
                var data=JSON.parse(res);
                console.log("Avg Wait Time Per HTTP Method: ",data);                
                makeGraph_C(data);
            }
        });
    }
</script>
<!-- Graph For HTTP Method-->
<script>
    var dataPoints_c = [];

    var options_c =  {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "HTTP Methods"
        },
        axisX: {
            title: "Hour"
            // valueFormatString: "#",
        },
        axisY: {
            title: "Response Time",
            titleFontSize: 24
        },
        data: [{
            type: "spline", 
            yValueFormatString: "$#,###.##",
            dataPoints: dataPoints_c
        }]
    };

    function makeGraph_C(data){
        dataPoints_c.length = 0 // clearing dataPoints 
        for (var i = 0; i < data.length; i++) {
            dataPoints_c.push({
                x: i,
                y: data[i]
            });
        }
        $("#chartContainer").CanvasJSChart(options_c);
    }
</script>

<!-- ======================================================================================================================== -->
<!-- ~2D~ Internet Provider -->
<!-- Getting Internet Provider for Select Dropdown  -->
<script>
    var providers=[];// distinct providers
    var ajax = new XMLHttpRequest();
    ajax.open("GET", "query_for_provider.php", true); // calling ajax
    ajax.send(); // sending ajax request

    // readyState == 4 -> the request is done/completed
    // status == 200 -> everything goes right
    ajax.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            var data=JSON.parse(this.responseText);
            for(var j=0;j<data.length;j++){
                $.each(data[j], function(i, el){
                    el= el.toUpperCase(); //making everything upper case
                    // el= el.split(" (")[0]; // don't need more of the name of the provider
                    if($.inArray(el, providers) == -1 && el!=""){ // $.inArray(el, provider)-> Search for a specified value within array provider and return its index (or -1 if not found).
                        providers.push(el);
                    } 
                });
            }
            
            // console.log("Internet Providers:",providers);

            var select = document.getElementById("selectprovider"); 
            // Fill list with options from providers:
            for(var i = 0; i < providers.length; i++) {
                var opt = providers[i];
                select.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectprovider').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'200px'
            });

        }
    };
    
</script>

<!-- For Analyze Response Time For Internet Provider -->
<script>
    // Gets the selected values from the dropdown menu for Internet Provider
    function getSelectedProvider(){
        var sel = $('#selectprovider').val();
        let sel_json={}
        $.each(sel, function(i, el){
            var h={};
            h.provider=el;
            sel_json[i]=h;
        });
        console.log("Selected Internet Provider: ",sel_json);
        getAvgWaitByProvider(sel_json);
    }

    function getAvgWaitByProvider(selected){
    // At lest one is selected
    $.ajax({
            url: "query_analyze_response_time_per_provider.php",
            method: "post",
            data: selected,            
            success: function(res){// Return AVG
                var data=JSON.parse(res);
                console.log("Avg Wait Time Per Internet Provider: ",data);                
                makeGraph_D(data);
            }
        });
    }
</script>
<!-- Graph For Internet Providers-->
<script>
    var dataPoints_d = [];

    var options_d =  {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "Internet Providers"
        },
        axisX: {
            title: "Hour"
            // valueFormatString: "#",
        },
        axisY: {
            title: "Response Time",
            titleFontSize: 24
        },
        data: [{
            type: "spline", 
            yValueFormatString: "$#,###.##",
            dataPoints: dataPoints_d
        }]
    };

    function makeGraph_D(data){
        dataPoints_d.length = 0 // clearing dataPoints 
        for (var i = 0; i < data.length; i++) {
            dataPoints_d.push({
                x: i,
                y: data[i]
            });
        }
        $("#chartContainer").CanvasJSChart(options_d);
    }
</script>
<!-- ======================================================================================================================== -->