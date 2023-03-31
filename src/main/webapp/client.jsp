<%@ page import="ehotel.ConnectionDB" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%
    ConnectionDB conDB = new ConnectionDB();
            conDB.getConnection();
            conDB.printAllTable();

    %>

    <meta charset="UTF-8">
    <title>e-Hotels</title>

    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="signin.css">
    
    
    <meta name="viewport" content="width=device-width">

    <style>
        img {
            max-width: 100%;
        }
    </style>
</head>
<body>
    
    <div id="wrapper" >



        <div id ="header"> 
            <a href="../index.jsp" id="logo"><b>e-Hotels</b> </a>
            <a href="../index.jsp" id="signout">  Sign out</a>
            
         
        </div>

         
        <div id="main">
            <h>My booking</h>


           
            

            
                
            
            
        </div>
            
            
            
       
         
       
            

    
        

         <div id ="footer"> 
            <ul>
                <li><h4>CONTACT US</h4></li>
                <li>Phone: </li>
                <li>Email<br></li>
                <li><a href="">Instagram</a></li>
                <li><a href="">Facebook</a></li>
                <li>copyright &copy;  e-Hotels</li>
                

            </ul>
               
            
               
               
        </div>
        
    </div>
</body>





