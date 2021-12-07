<html>
<head>
<link rel="stylesheet" href="admin3.css">
    <title>Admin's catHARstrophe</title>
    <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous">
    </script>
    <!-- for dats subtraction -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js" crossorigin="anonymous"></script>
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
            top: 10%;
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

    <div class="table-row">
        <div class="table-cell">
            <h4>Content-Types For TTL</h4>
            <form method="get">
                    <select class="form-control" id="selectoption" multiple="multiple">
                    </select>
                    <input type="button" value="Display" class="btn btn-primary" onclick="getSelected()">
            </form>
            </div> <!--  ends "table-cell" -->
        <div class="table-cell">
            <h4>Content-Types For Cacheability Directives</h4>
            <form method="get">
                    <select class="form-control" id="selectoption_b" multiple="multiple">
                    </select>
                    <input type="button" value="Display" class="btn btn-primary" onclick="getSelected_b();">
            </form>
        </div> <!--  ends "table-cell" -->
        <div class="table-cell">
            <h4>Content-Types For TTL</h4>
            <form method="get">
                    <select class="form-control" id="selectoption_c" multiple="multiple">
                    </select>
                    <input type="button" value="Display" class="btn btn-primary" onclick="getSelected_c(); display_c()">
            </form>
        </div> <!--  ends "table-cell" -->
    </div> <!--  ends "table-row" -->

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js" integrity="sha384-h0AbiXch4ZDo7tp9hKZ4TsHbi047NrKGLO3SEJAg45jXxnGIfYzk4Si90RDIqNm1" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>

    <div id="chartContainer" style="height: 370px; width: 100%; position:absolute; top:35%;"></div>
    <script src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>

    <div id="admin3b" style="display:none; position: absolute; top: 40%; left: 40%; background-color: rgb(194, 187, 187); padding: 20px; width:20%; text-align:center;">
        <table >
            <tr>
            <th>Percentage of max-stale:</th>
            </tr>
            <tbody id="2a"></tbody>
        </table><br>
        
        <table>
            <tr>
            <th>Percentage of min-freshs:</th>
            </tr>
            <tbody id="2b"></tbody>
        </table><br>
    </div>

<div id="admin3c" style="display:none; position: absolute; top: 40%; left: 40%; background-color: rgb(194, 187, 187); padding: 20px; width:20%; text-align:center;">
    <table >
        <tr>
        <th>Percentage of public:</th>
        </tr>
        <tbody id="3a"></tbody>
    </table><br>
    
    <table>
        <tr>
        <th>Percentage of private:</th>
        </tr>
        <tbody id="3b"></tbody>
    </table><br>

    <table>
        <tr>
        <th>Percentage of no-cache:</th>
        </tr>
        <tbody id="3c"></tbody>
    </table><br>

    <table>
        <tr>
        <th>Percentage of no-store:</th>
        </tr>
        <tbody id="3d"></tbody>
    </table><br>
</div>

<body>
</html>

<!-- START: 3A Content Type -->
<!-- Getting Content Types for Select Dropdown  -->
<script>
    var ct=[];// distinct content type
    var ajax = new XMLHttpRequest();
    ajax.open("GET", "query_for_adm3.php", true); // calling ajax
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
            for(var i = 0; i < ct.length; i++) { // add ct to the dropdown menu
                var opt = ct[i];
                select.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectoption').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'300px'
            });

            var select2 = document.getElementById("selectoption_b"); 
            // Clear all existing options first:
            // select.innerHTML = "";
            // Fill list with options from ct:
            for(var i = 0; i < ct.length; i++) {
                var opt = ct[i];
                select2.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectoption_b').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'300px'
            });

            var select3 = document.getElementById("selectoption_c"); 
            // Clear all existing options first:
            // select.innerHTML = "";
            // Fill list with options from ct:
            for(var i = 0; i < ct.length; i++) {
                var opt = ct[i];
                select3.innerHTML += "<option value=" + opt + ">" + opt + "</option>";
            }
            $('#selectoption_c').multiselect({
                includeSelectAllOption:true,
                // nonSelectedText:'Select Option',
                enableFiltering:true,
                buttonWidth:'300px'
            });

        }
    };
    
// Gets the selected values from the dropdown menu for Content-Type 
function getSelected(){
        var sel = $('#selectoption').val();
        let sel_json={}
        $.each(sel, function(i, el){ //gia polles epiloges
            var h={};
            h.type=el;
            sel_json[i]=h;
        });
        console.log("Selected: ",sel_json);
        getMaxAge(sel_json, sel);
}

function getSelected_b(){
    var sel = $('#selectoption_b').val();
    let sel_json={}
    $.each(sel, function(i, el){ //gia polles epiloges
        var h={};
        h.type=el;
        sel_json[i]=h;
    });
    console.log("Selected: ",sel_json);
    calculatePercentage(sel_json);
}

function getSelected_c(){
    var sel = $('#selectoption_c').val();
    let sel_json={}
    $.each(sel, function(i, el){ //gia polles epiloges
        var h={};
        h.type=el;
        sel_json[i]=h;
    });
    console.log("Selected: ",sel_json);
    calculateCacheability(sel_json);
} 

</script>

<script>
function getMaxAge(selected, sel){ // pairnw ta max age
        console.log("===",selected);
        // At lest one is selected
        $.ajax({
            url: "query_MaxAge.php",
            method: "post",
            data: selected,
            success: function(res){// Return Max Age
                //console.log(res);
                var data=JSON.parse(res);
                console.log("Print data (result of query): ",data);

                var array = [];
                var final =[];
                var for_exp = [];
                for(var a = 0; a < data.length; a++) {
                    array[a] = data[a].ma;
                    var temp = array[a].split('max-age=');
                    console.log(temp[1]);

                    if(array[a].includes("max-age=")==false){ // an exw grammh p den exei max-age => undefined
                        // console.log("den exei");
                        console.log("no max age: ", array[a]);
                        //kwdikas gia na parw to max age me vash to expires kai to last modified
                        //console.log(array[a]);
                        for (var i=0; i< array.length; i++) {
                            // for_exp[i]= array[a];
                            
                            if( $.inArray(array[a],for_exp) == -1 && array[a] != "") {
                                // var h ={}
                                // h.rcc = array[a];
                                // for_exp[i]=h;
                                for_exp.push(array[a]);
                            }
                            
                        }
                        console.log("a",a," exp ",for_exp);

                    }
                    else if (temp[1].includes(',') == true) {
                        console.log("exists");
                        final.push(temp[1].split(',')[0]);
                    }
                    else {
                        final.push(temp[1]); //pushes temp1 p exei tis max-age apo to split
                    }
                }
                console.log("111====",final);
                if (for_exp.length == 0) {
                    console.log("All have max_age if for_exp array is null: ",for_exp);
                    //keno se periptwsh p exoun ola max age kai den xreiazetai na travhksw apo thn vash exp kai last mod
                    forGraph(final);
                }
                else{
                    $.ajax ({
                        url: "query_for_expires.php",
                        method: "POST",
                        data: {sel: sel, exp: for_exp}, //thelw na parw ta expires k last modified tou epilegmenou
                        success: function(exp_mod) { // have to split => get the dates => subtract them 
                        //console.log(" ***********AJAX********* ", exp_mod);
                        var asp=JSON.parse(exp_mod);
                        console.log(asp);
                        addExpAndMod(asp,final); // if exp and last_mod != null => sub => final
                        } 
                    });
                }
                
                //makeGraph(data, selected); // GET THAT FOR GRAPH
            }
        });
}

function addExpAndMod(asp,final) {
    //console.log(asp);
    var re = [];
    var rlm = [];
    
    for( var b=0; b<asp.length; b++ ) {
        re.push(asp[b]['res_expires']);
        rlm.push(asp[b]['res_last_modified']);

        if ( re[b] == "" && rlm[b] == "" ) {
            console.log("both res_expires and res_last_modified are empty");
            forGraph(final);
        }
        else {
            console.log(re[b]); //res_expired that is not ""
            console.log(rlm[b]); //res_last_modified that is not ""

            if ( re[b] == "" || rlm[b] == "") { // is at least one null? => dont add to final
                console.log("i will not add to final!");
               forGraph(final);
            }
            else {
                var tre = re[b].split(' GMT');
                //console.log(tre[0]);
                var tre2 = tre[0].split(', ')
                // console.log("final form of res_expires: ",tre2[1]); // final form of res_expires

                var eday = tre2[1].split(' ')[0];
                var emon = tre2[1].split(' ')[1];
                var eyear = tre2[1].split(' ')[2];

                var trlm = rlm[b].split(' GMT');
                // console.log(trlm[0]);
                var trlm2 = trlm[0].split(', ')
                // console.log("final form of res_last_modified: ",trlm2[1]); // final form of res_last_modified

                var lday = trlm2[1].split(' ')[0];
                var lmon = trlm2[1].split(' ')[1];
                var lyear = trlm2[1].split(' ')[2];

                var ed = eday + " " + emon + " " + eyear; // make string for expires => date
                // console.log(ed);
                var t1 = new Date(ed);
                console.log(t1);
                
                var ld = lday + " " + lmon + " " + lyear; // make string for last_modified => date
                // console.log(ld);
                var t2 = new Date(ld);
                console.log(t2);

                var sub = (t2-t1)/1000; // convert to seconds
                console.log(sub.toString());

                
                final.push(sub.toString()); //array final is now complete
                forGraph(final);
            }
        }

    }
}

function forGraph(final) {
    console.log("=====================", final);
    var max = 0;
    var min = 0;
    for (var c=0; c<final.length; c++) {
        if (final[c] > max) {
            max = final[c];
        }
        if (final[c] <= min) {
            min = final[c];
        }
    }

    var normal = (max-min)/10;
    console.log(normal);
    console.log(max);

    var bucket = [];
    // var x_graph = 0;
    var a = 1;
    for (var d=0; d<10; d++) {
        bucket[d] = min + "-" + a*(min+normal);
        a++;
    }
    console.log(bucket);

    // var cell = 0;
    // var count = [];
    // var check = 0;
    // var compare = [];

    // for (var f=0; f<final.length; f++) {
    //     compare = final[cell];
    //         if (compare == final[f] && cell != f) {
    //             check++;
    //             count[cell] = check;
    //         }
    //         else {
    //             count[f] = 0;
    //         }
    //     cell++;
    // }

    //console.log("DUUUUUUUUUUUUUUUDE ",count); //otan to check = 0 shmainei oti h eggrafh uparxei 1 fora

    makeGraph(final,bucket);
}

</script>

<!-- START: CREATE GRAPH 3A -->
<script>
    var dataPoints = [];

    var options =  {
        animationEnabled: true,
        theme: "light2",
        title: {
            text: "Content-Types and Max Age"
        },
        axisX: {
            // valueFormatString: "DD MMM YYYY",
        },
        axisY: {
            title: "Count",
            titleFontSize: 24
        },
        data: [{
            type: "column", 
            yValueFormatString: "",
            dataPoints: dataPoints,
            
        }]
    };

    function makeGraph(final,bucket) {
        dataPoints.length = 0 // clearing dataPoints 
        
        // arrx=[];
        // arry=[];
        // for (var i = 0; i < 11; i++) {
        //     arrx[i] = bucket[i];
        // }

        // for (var i = 0; i < 11; i++) {
        //     if(i<final.length) {
        //         arry[i]=final[i];
        //     }
        //     else{
        //         arry[i]=0;
        //     }
        // }
        // console.log(arrx);
        // console.log(arry);

        // for (var i = 0; i < 11; i++) {
            
            //console.log("hey");
            dataPoints.push({
                x: bucket,
                y: {}
            });
        // }
        $("#chartContainer").CanvasJSChart(options);

    }

</script>
<!-- END: CREATE GRAPH 3A -->
<!-- END: 3A Content Type -->
<!-- --------------------------------------------------------------------------------------------------------------- -->
<!-- START: 3B -->
<script>
    function calculatePercentage(selected) {
        console.log("===",selected);
        // At lest one is selected
        $.ajax({
            url: "query_for_MsAndMf.php",
            method: "post",
            data: selected,
            success: function(res){// Return Max Stale, count of content_type and content_type
                var data=JSON.parse(res);
                console.log("Print data (result of query): ",data);
            
                var array = [];
                var max_stales = []; // contains all the max-stale values
                var min_freshs = []; // contains all the min-fresh values
                var count = [];
                
                for(var a = 0; a < data.length; a++) {
                    array[a] = data[a];
                    count.push(array[a].count);
                    var rcc = array[a].res_content_type;
                    var rcache = array[a].res_cache_control;

                    if (rcache.includes("max-stale=") == true) {
                        const maxs = rcache.split('max-stale=');
                        //console.log(maxs[1]);
                        max_stales.push(maxs[1]);
                    }
                    else if (rcache.includes("min-fresh=") == true) {
                        const minf = rcache.split('min-fresh=');
                        //console.log(minf[1]);
                        min_freshs.push(minf[1]);
                    }
                }
                // console.log(max_stales);
                // console.log(min_freshs);
                // console.log(count);

                
                document.getElementById("2a").innerHTML = ""; //clears the table
                document.getElementById("2b").innerHTML = "";
                var ms_percentage = (max_stales.length*100) / count.length ;
                //console.log(ms_percentage);

                var html = "";
                html += "<tr>";
                        html += "<td>" + ms_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("2a").innerHTML += html;

                var mf_percentage = (min_freshs.length*100) / count.length ;
                //console.log(mf_percentage);
                
                var html = "";
                html += "<tr>";
                        html += "<td>" + mf_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("2b").innerHTML += html;

            }
        }); 
        display();
        
    }

</script>

<script>
        function display(){
            // document.getElementById('admin3b').style.display= "none"; 
            
            document.getElementById('chartContainer').style.display= "none";
            document.getElementById('admin3c').style.display= "none";
            var spolier = document.getElementById('admin3b');

            if(spolier.style.display == "none"){
                spolier.style.display= "block";
            }
            // else {
            //     spolier.style.display = "none";
            // }
        }
</script>
<!-- END: 3B -->
<!-- ----------------------------------------------------------------------------------- -->

<!-- START: 3C -->
<script>
    function calculateCacheability(selected) {
        console.log("===",selected);
        // At lest one is selected
        $.ajax({
            url: "query_for_directives.php",
            method: "post",
            data: selected,
            success: function(res){// Return Max Stale, count of content_type and content_type
                var data=JSON.parse(res);
                console.log("Print data (result of query): ",data);
            
                var array = [];
                var public = [];
                var private = [];
                var no_store = [];
                var no_cache = [];
                var count = [];
                var b = 0;
                
                for(var a = 0; a < data.length; a++) {
                    array[a] = data[a];
                    count.push(array[a].count);
                    var rcc = array[a].res_content_type;
                    var rcache = array[a].res_cache_control;

                    if (rcache.includes("public") == true) {
                        b++;
                        public.push(b);
                    }
                    if (rcache.includes("private") == true) {
                        b = 0;
                        b++;
                        private.push(b);
                    }
                    if (rcache.includes("no-cache") == true) {
                        b = 0;
                        b++;
                        no_cache.push(b);
                    }
                    if (rcache.includes("no-store") == true) {
                        b = 0;
                        b++;
                        no_store.push(b);
                    }
                }
                console.log(public);
                console.log(private);
                console.log(no_cache);
                console.log(no_store);
                console.log(count);


                document.getElementById("3a").innerHTML = "";
                document.getElementById("3b").innerHTML = "";
                document.getElementById("3c").innerHTML = "";
                document.getElementById("3d").innerHTML = "";
                var public_percentage = (public.length*100) / count.length ;
                // console.log(public_percentage);

                var html = "";
                html += "<tr>";
                        html += "<td>" + public_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("3a").innerHTML += html;
                // |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

                var private_percentage = (private.length*100) / count.length ;
                // console.log(private_percentage);
                
                var html = "";
                html += "<tr>";
                        html += "<td>" + private_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("3b").innerHTML += html;
                // |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

                var no_cache_percentage = (no_cache.length*100) / count.length ;
                //console.log(no_cache_percentage);
                
                var html = "";
                html += "<tr>";
                        html += "<td>" + no_cache_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("3c").innerHTML += html;
                // |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

                var no_store_percentage = (no_store.length*100) / count.length ;
                //console.log(no_store_percentage);
                
                var html = "";
                html += "<tr>";
                        html += "<td>" + no_store_percentage+"%" + "</td>";
                    html += "</tr>";
                document.getElementById("3d").innerHTML += html;
                // |||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

            }
        });   
    }

</script>

<script>
        function display_c(){
            // document.getElementById('admin3c').style.display= "none"; 
            document.getElementById('chartContainer').style.display= "none";
            document.getElementById('admin3b').style.display= "none"; 
            var spolier = document.getElementById('admin3c');

            if(spolier.style.display == "none"){
                spolier.style.display= "block";
            }
            // else {
            //     spolier.style.display = "none";
            // }
        }
</script>

<!-- END: 3C -->