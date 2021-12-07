# HTTP_Traffic_Data_Collection_and_Analysis_System
 Internet traffic via HTTP can be recorded by any client, so that this data can be used later to analyze the behavior of a website. For this purpose, the HAR (HTTP ARchive) standard has been created, which defines a specific JSON structure (schema) for storing this data. 
<br /><br />The purpose of this work is to build a population-based HAR data collection system in order to provide some basic analyzes for each user individually, but also more general analyzes concerning the internet infrastructure in an area (e.g. Patras). There are two types of users in the system: Administrator and User. 
>## User:
<br />The user connects to the system via a desktop computer, and has the following capabilities:
1) __Registration in the system__. The user registers and accesses the system by choosing a username & password of his choice, and providing his email. The password must be at least 8 characters long and contain at least one capital letter, a number and a symbol (e.g. # $ * & @).
2) __Upload data__. The user selects a HAR file from their computer. The file will be processed locally to delete sensitive data and then the user has the option to upload it to the system. The uploaded data must be further processed (on the server) in order to save the desired data in the appropriate format. Also, the IP of the user uploading the file should be "analyzed" so that the user's connectivity provider is automatically discovered and this information is stored in the database along with the registrations.
3) __Profile management__. The user can change the username / password and see basic statistics for the data the user has uploaded (last upload date, number of registrations).
4) __Data visualization__. The user can see on a map the locations of the IPs to which he has sent HTTP requests. Specifically, the map shows a heatmap that depicts the distribution of the number of records related to HTML, PHP, ASP, JSP (or pure domains, without path) web objects. 
>## Admin:
<br />The Administrator accesses the system with a desktop computer, through an appropriate username / password mechanism. Upon entering the system it has the following capabilities:
1. __Illustration of Basic Information__. The administrator sees relevant information on one page, in tables that display:
   1. The number of registered users
   2. The number of registrations in the database per type (method) of application
   3. The number of entries in the database by response code (status)
   4. The number of unique domains that exist in the database
   5. The number of unique connectivity providers on the base
   6. The average age of the web objects at the time they were retrieved, per CONTENT-TYPE 
2. __Analysis of response times to requests (object type entries, timings field)__. A configurable diagram with the average response time (Y axis) is displayed in each request per hour of the day [0-24] (X axis). The diagram can display filtered data as follows:
   1.Web object type (select one or more CONTENT-TYPE or all)
   2. Day of the week (Monday - Sunday or all)
   3. HTTP method type on request (select one or more, or all)
   4. Connectivity Provider (eg "Wind", "Cosmote" or all) 
3. __HTTP header analysis (header objects)__. The administrator sees relevant information on a page, in tables and / or graphs depicting cache usage information. More specifically:
   1. Histogram of TTL distribution of web objects in response, per CONTENT-TYPE (selection of one or more CONTENT-TYPE or all). The TTL is the max-age directive (if any) or calculated based on expires (if any) and the date of modification of the web object. The number of buckets in the histogram is 10 and the width of each bucket is dynamically calculated according to the recovered values.
   2. Percentage of max-stale and min-fresh directives on the total number of applications per CONTENT TYPE (selection of one or more CONTENT-TYPE or all).
   3. Percentage of cacheability directives (public, private, no-cache, no-store) on the total of responses per CONTENT-TYPE (selection of one or more CONTENT-TYPE or all).
All of the above graphs / tables are configured by selecting the connectivity provider Connectivity provider (eg “Wind”, “Cosmote” or all).
4. __Data visualization (object entries)__. The administrator can see on a map the locations of the IPs to which the users have sent HTTP requests. 
