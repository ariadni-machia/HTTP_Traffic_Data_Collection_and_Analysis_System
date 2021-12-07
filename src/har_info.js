/* VARIABLES WITH THE NECESSARY HAR DATA */
var startedDateTimes=[];
var ips=[];
var waits=[];
var methods=[];
var urls=[];
var statuss=[];
var statusTexts=[];
var req_content_types= []; // Request Header
var req_cache_controls= [];
var req_pragmas= [];
var req_expires= [];
var req_ages= [];
var  req_last_modifieds= [];
var req_hosts= [];
var res_content_types=[]; // Response Header
var res_cache_controls=[];
var res_pragmas=[];
var res_expires=[];
var res_ages=[];
var res_last_modifieds=[];
var res_hosts=[];
//---------------------------------------------------------//
var ready1=false;

var har_data = {}; //json with all the data from the har
var hd=[]; // array with json files, is the har_data but split

var ips_coo=[];
var count=0; // counts how many fetches have been completed (for getCoo function)

// DELETE LATER ///////////////////
var hars=[];



/* Choose File Action */
const input = document.querySelector('input[type="file"]')

input.addEventListener('change', function(e){
    btnUpload.disabled = true; //Disable the button upload because its ready for upload to the db
    ips_coo=[]; // Reset the ips_coo
    count=0;
    ready1=false; // Reset ready1 // Not ready for upload
    $("#response").html(""); // Reset text display of result message
    

    // har file name 
    var name = e.target.files[0].name;
    console.log('FILE NAME:'+name);
    // Checking that it is indeed a har file
    if(name[name.length-3]=='h' && name[name.length-2]=='a' && name[name.length-1]=='r'){
        console.log("it's a har file. All good, you can continue.");
        // Calling function ckeckingIfReady every 0.5 seconds
        ready=setInterval(checkingIfReady, 500); // Reset ready // Not ready for upload
        fileReader();
    }
    else{
        alert("Error! Choose a \".har\" file");
        //Clearing the old variables
        startedDateTimes = null;        
        ips = null;
        waits = null;
        methods = null;
        urls = null;
    } 

}, false)

/* FUNCTION UPLOADHAR - Button: Upload */
function uploadHar(){
   console.log(hd);
   console.log("Len=",startedDateTimes.length);
   console.log("DONE. Lenght= "+ips_coo.length);
   console.log({case: 0,har_data,user_info});

   var last={};
   var i=0;

/*    calls the php script in order to upload the data to the database
      depending on the size of the upload file if is too large it does the upload in steps otherwise at ones */

    // If data is NOT too large 
    // uploading the all the har's data and user's info
   if(startedDateTimes.length<100){ 
        console.log("CASE 0");
        $.ajax({
            url: "upload_to_db.php",
            method: "post",
            data: {case: 0,har_data,user_info},            
            success: function(res){
                console.log("---",res);
                if (res.indexOf("All the data have insert to the database successfully.") >= 0) {
                    console.log("Success");
                    $("#response").html("Your file has been successfully uploaded");
                }
                else{
                    console.log("Error");
                    $("#response").html("Error! The file was not uploaded");
                }
            }
        });
    }
    else{ // If the data is slitted in parts because it's too large        
        console.log("CASE 1");
        i=0;
        console.log("Har Data part: ",i,"\n",hd[i]);
        har_data=hd[i];

        // uploading the 1st part of har's data and user's info
        $.ajax({
            url: "upload_to_db.php",
            method: "post",
            data: {case: 0, har_data, user_info},
            success: function(res){
                console.log("---------------",res);
                res=res.split('\n');
                console.log(res[res.length-1]," !! ",res[res.length-2] );
                last.en=res[res.length-2]; // last entry
                last.id=res[res.length-1]; // last har id
            }
        })
        .done(function(){
            if(i<hd.length){
                Upload_parts(i,last); // Calling function Upload_parts in order to upload the next part of the data
            }
        });
        
                
    }// End of Else 
    

}// End of uploadHar


function make_har_data(){ //MAKING JSON FILE OF ALL THE DATA FROM THE HAR FILE
    har_data={}; // initialize har_data
    hd=[];

    for(i=0;i<startedDateTimes.length;i++){  //oloi oi pinakes exoun to idio mege8os  startedDateTimes.length
        var h = {};
        h.usrname = hars[i];  // PREPEI NA ALLA3EI
        h.startedDateTime = startedDateTimes[i];
        h.wait = waits[i] ;
        h.sIP = ips[i];
        h.method = methods[i];
        h.url = urls[i];        
        h.status = statuss[i];
        h.statusTx = statusTexts[i];
        h.req_ct = req_content_types[i];
        h.req_cc = req_cache_controls[i];
        h.req_pr = req_pragmas[i];
        h.req_ex = req_expires[i];
        h.req_age = req_ages[i];
        h.req_lm = req_last_modifieds[i];
        h.req_host = req_hosts[i];
        h.res_ct = res_content_types[i];
        h.res_cc = res_cache_controls[i];
        h.res_pr = res_pragmas[i];
        h.res_ex = res_expires[i];
        h.res_age = res_ages[i];
        h.res_lm = res_last_modifieds[i];
        h.res_host = res_hosts[i];
        h.lat = ips_coo[i][0];
        h.lon = ips_coo[i][1];
        // h.lat = null;
        // h.lon = null;
        har_data[i]=h;
    }

    //Spitting if neccessary
    //Too many data overloads the upload to the data so we spilt it in order to inserted to the db smoothly
    l = startedDateTimes.length;
    j=0;
    while(l>100){ 
        part={}; 
        for(i=0;i<100;i++) 
            part[i]=har_data[j++];
        hd.push(part);
        l=l-100; 
    }
    part={};
    l=startedDateTimes.length-j;
    for(i=0;i<l;i++)
        part[i]=har_data[j++];
    hd.push(part);
    // console.log(hd);  



}


/* Function - Reading the file */
function fileReader(){
    loading.style="display:inline, block;" // Showing the Loading text

    user_ip(); // Calling function from user_info.js in order to take the user's information

    //Reading File
    console.log(input.files)
    const reader = new FileReader()
    reader.onload = function (){
        const jsonContents = JSON.parse(reader.result);
        console.log(`Entries: ${jsonContents.log.entries.length}`);
        //Entries
        // Array with all the startedDateTime
        startedDateTimes = jsonContents.log.entries.map(entry => entry.startedDateTime);

        // Entries Timings // Array with all the Wait time 
        waits= jsonContents.log.entries.map(entry => entry.timings.wait);

        // Array with all the serverIPAddresses
        ips= jsonContents.log.entries.map(entry => entry.serverIPAddress);
        // Fixing form of IPv6
        for (var i = 0; i < ips.length; i++) {
            if(ips[i][0]=='['){
                // Removing the first character
                ips[i] = ips[i].substring(1);    
                // Removing the last character
                ips[i] = ips[i].substring(0, ips[i].length - 1);
            } 
            getCoo(ips[i],i); // GETCOO FUNCTION ///////////////////////////////////////////////////////////////////////////////   
        }  
        

        //Request
        // Array with all the Methods
        methods = jsonContents.log.entries.map(entry => entry.request.method);
        
        // Array with all the URLS
        urls = jsonContents.log.entries.map(entry => entry.request.url);
        for (var i = 0; i < urls.length; i++) {
            urls[i] = urls[i].replace('http://','').replace('https://','').replace('www.','').split(/[/?#]/)[0];
        }    
        
        // Request Headers
        var req_headers = jsonContents.log.entries.map(entry => entry.request.headers);
        console.log(`Request Headers: ${req_headers.length}`);
        var k = []; // array with counters for its data in the response header in order to do only once the double loop
        for (var i = 0; i < req_headers.length  ; i++) {
            for(var j = 0; j < 7  ; j++){ // initializing k[]
                k[j] = false;
            }
            //initializing with null in case they don't exist (or the length of the header is 0)
            req_content_types[i] = null;  
            req_cache_controls[i] = null;  
            req_pragmas[i] = null;
            req_expires[i] = null;
            req_ages[i] = null;
            req_last_modifieds[i] = null;        
            req_hosts[i]=null;
            for(var j = 0; j < req_headers[i].length  ; j++){
                // Array with all the Content-Types
                if ( (req_headers[i][j].name == "Content-Type" || req_headers[i][j].name == "content-type") && k[0] == false ){
                    req_content_types[i] = req_headers[i][j].value;
                    k[0] = true;
                }
                // Array with all the Cache-Controls
                if ( (req_headers[i][j].name == "Cache-Control" || req_headers[i][j].name == "cache-control") && k[1] == false ){
                    req_cache_controls[i] = req_headers[i][j].value;
                    k[1] = true;
                } 
                // Array with all the Pragmas
                if ( (req_headers[i][j].name == "Pragma" || req_headers[i][j].name == "pragma") && k[2] == false ){
                    req_pragmas[i] = req_headers[i][j].value;
                    k[2] = true;
                }    
                // Array with all the Expires
                if ( (req_headers[i][j].name == "Expires" || req_headers[i][j].name == "expires") && k[3] == false ){
                    req_expires[i] = req_headers[i][j].value;    
                    k[3] = true;               
                }  
                // Array with all the Ages
                if ( (req_headers[i][j].name == "Age" || req_headers[i][j].name == "age") && k[4] == false ){
                    req_ages[i] = req_headers[i][j].value;       
                    k[4] = true;
                } 
                // Array with all the Last-Modifieds
                if ( (req_headers[i][j].name == "Last-Modified" || req_headers[i][j].name == "last-modified") && k[5] == false ){
                    req_last_modifieds[i] = req_headers[i][j].value;  
                    k[5] = true;                 
                }
                // Array with all the Host
                if ( (req_headers[i][j].name == "Host" || req_headers[i][j].name == "host") && k[6] == false ){
                    req_hosts[i] = req_headers[i][j].value;
                    k[6] = true;
                } 
            }
        }
        
        
        //Response
        // Array with all the Status
        statuss = jsonContents.log.entries.map(entry => entry.response.status);               

        // Array with all the StatusTexts
        statusTexts = jsonContents.log.entries.map(entry => entry.response.statusText);

        // Response Headers 
        var res_headers = jsonContents.log.entries.map(entry => entry.response.headers);
        console.log(`Response Headers: ${res_headers.length}`);
        var k = []; // array with counters for its data in the response header in order to do only once the double loop
        // for(var i = 0; i < 7  ; i++){ // initializing k[]
        //     k[i] = false;
        // }
        
        for (var i = 0; i < res_headers.length  ; i++) {
            for(var j = 0; j < 7  ; j++){ // initializing k[]
                k[j] = false;
            }
            //initializing with null in case they don't exist (or the length of the header is 0)
            res_hosts[i]= null;
            res_content_types[i] = null;  
            res_cache_controls[i] = null;  
            res_pragmas[i] = null;
            res_expires[i] = null;
            res_ages[i] = null;
            res_last_modifieds[i] = null;        
            for(var j = 0; j < res_headers[i].length  ; j++){
                // Array with all the Content-Types
                if ( (res_headers[i][j].name == "Content-Type" || res_headers[i][j].name == "content-type") && k[0] == false ){
                    res_content_types[i] = res_headers[i][j].value;
                    k[0] = true;
                }
                // Array with all the Cache-Controls
                if ( (res_headers[i][j].name == "Cache-Control" || res_headers[i][j].name == "cache-control") && k[1] == false ){
                    res_cache_controls[i] = res_headers[i][j].value;
                    k[1] = true;
                } 
                // Array with all the Pragmas
                if ( (res_headers[i][j].name == "Pragma" || res_headers[i][j].name == "pragma") && k[2] == false ){
                    res_pragmas[i] = res_headers[i][j].value;
                    k[2] = true;
                }    
                // Array with all the Expires
                if ( (res_headers[i][j].name == "Expires" || res_headers[i][j].name == "expires") && k[3] == false ){
                    res_expires[i] = res_headers[i][j].value;    
                    k[3] = true;               
                }  
                // Array with all the Ages
                if ( (res_headers[i][j].name == "Age" || res_headers[i][j].name == "age") && k[4] == false ){
                    res_ages[i] = res_headers[i][j].value;       
                    k[4] = true;
                } 
                // Array with all the Last-Modifieds
                if ( (res_headers[i][j].name == "Last-Modified" || res_headers[i][j].name == "last-modified") && k[5] == false ){
                    res_last_modifieds[i] = res_headers[i][j].value;  
                    k[5] = true;                 
                } 
                // Array with all the Host
                if ( (res_headers[i][j].name == "Host" || res_headers[i][j].name == "host") && k[6] == false ){
                    res_hosts[i] = res_headers[i][j].value;
                    k[6] = true;
                }
            }                               
        }  
        
        // // DELETE LATER !!!!!! ///////////
        // for(i=0;i<startedDateTimes.length;i++){
        //     hars[i]="har";
        // }  
        //make_har_data();  // MAKING THE JSON FILE OF ALL THE DATA FROM THE HAR FILE
        // make_har_data();  // DELETE LATER !!!!!! ///////////
        // readyToUpoload();  // DELETE LATER !!!!!! ///////////
    }
    reader.readAsText(input.files[0])
}

//Fuction which fetches the coordinates from an ip && checks if all the ips from the har were done fetching
async function getCoo(ip, i){    
    await fetch('https://freegeoip.app/json/'+ip)  
    .then(function(response) {
        return response.json();
    })
    .then(function (data) {
        ips_coo[i] = [data.latitude, data.longitude];
        //console.log("ips:",ip," ",i," ips_coo:",ips_coo[i]," ",j) ;
        count++;   
    })
    .catch(function (err) {
        // There was an error
        console.warn('Something went wrong.', err);
    });   
    //Checking if all ips where fetched
    if(count==ips.length){
        console.log("DONE. Lenght= "+ips.length);   
        ready1=true; //All coordinated were fetched. Har info are ready for upload
        make_har_data();  // MAKING THE JSON FILE OF ALL THE DATA FROM THE HAR FILE
    }
    
}

// Functions for setInterval
// Function which checks if all the data is collected and it's ready to be uploaded
function checkingIfReady(){ 
    if(ready1==true && ready2==true){
        console.log("Ready For Upload");
        readyToUpoload(); 
    }  
}

// Function which signals that the data is ready for upload
function readyToUpoload() {
    btnUpload.disabled = false; //Enable the button upload because its ready for upload to the db
    loading.style="display:none;" // Hiding the Loading text 
    clearInterval(ready); // stops setInterval function
}

// Function which is uploading har's data from the 2nd part until the last one.
function Upload_parts(i,last) { 
    // console.log("############# i= ",i," last: ",last);
    i++; 
    har_data=hd[i]; // getting next part
    
    $.ajax({
        url: "upload_to_db.php",
        method: "post",
        data: {case: 1, har_data, lastid: last},
        success: function(res){
            // console.log("---->",res);
            res=res.split('\n');
            last.en=res[res.length-2];
            last.id=res[res.length-1];
            // console.log("~~~~~~~~~",{case: 1, har_data, lastid: last}); 
            if (res.indexOf("All the data have insert to the database successfully.") >= 0) {
                console.log("Success");
                $("#response").html("Your file has been successfully uploaded");
            }
            else{
                console.log("Error");
                $("#response").html("Error! The file was not uploaded");
            }
        }                
    }).done(function again(){
        if(i<hd.length-1){ // Calling function Upload_parts until the last part (hd.length-1 because the 1st was seperated)
            console.log("\nCalling Upload_part\n");
            Upload_parts(i,last); // Calling function Upload_parts in order to upload the next part of the data
        }
    });
}//End of Upload_parts
