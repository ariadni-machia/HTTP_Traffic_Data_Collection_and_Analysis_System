var user_isp;
var user_city;
var user_coo=[];

var user_info={}; // user's info from user_info.js -> isp, city, [latitude, longtitude]

var ready2=false;

async function user_ip(){
    ready2=false; // Reset ready2 // Not ready for upload
    await fetch('http://api.ipify.org/?format=json')  
    .then(function(response) {
        return response.json();
    })
    .then(function (data) {
        get_user_info(data.ip);
    })
    .catch(function (err) {
        // There was an error
        console.warn('Something went wrong.', err);
    });
    
}

async function get_user_info(ip){
    await fetch('http://ip-api.com/json/'+ip)  
    .then(function(response) {
        return response.json();
    })
    .then(function (data) {
        user_isp=data.isp;
        user_city=data.city;
        user_coo = [data.lat, data.lon];  
        // console.log(user_isp,user_city,user_coo) ;
        makeUserInfoJSON();
    })
    .catch(function (err) {
        // There was an error
        console.warn('Something went wrong.', err);
    });
    
}

function makeUserInfoJSON(){
    user_info.isp = user_isp;
    user_info.city = user_city;
    user_info.lat = user_coo[0];
    user_info.lon = user_coo[1];
    ready2=true; // User's info were fetched and are ready for upload
}

    
