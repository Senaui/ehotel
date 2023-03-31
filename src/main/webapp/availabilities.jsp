<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>e-Hotels</title>

    <link rel="stylesheet" href="../style.css">
    <link rel="stylesheet" href="../availabilities.css">
    
    
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
            <a href="index.jsp" id="logo"><b>e-Hotels</b> </a>
            <a href="SignInPage/signin.jsp" id="signin">  Sign In</a>
            
         
        </div>

         
        <div id="searchbar">


            <div id ="where">

                
                <input type="text" placeholder="Where to stay?">

            </div>
            
           
            <div id = numTravellerandRoom>
                <input type="text" placeholder="Number of traveller" >
                <input type="text" placeholder="Number of room" >
                
                
            </div>

            <div id = dates>
                
                <input type="date"  name="checkIn">
                
          
                <input type="date"  name="checkOut">

                <a href="availabilities.jsp" id="searchBtn">
                    <button type="button" >Search</button>

                </a>
            </div>
                
            
            
        </div>
            
            
            
        
        
        

        
        <div id="header1">
            <h>Our availabilities</h>

        </div>
        

        <!-- Main content -->

        <section>

            <!-- filter section -->
            <div id="filterBox">

                <div id="capacity">
                    <h>Capacity</h><br>
                    <input type="checkbox" id="small" name="smallRoom" value="Small">
                    <label for="small"> Single</label><br>
                    <input type="checkbox" id="medium" name="mediumRoom" value="Medium">
                    <label for="medium"> Double</label><br>
                    <input type="checkbox" id="large" name="largeRoom" value="Large">
                    <label for="large"> Triple</label><br><br>
                    
                </div>
                <div id="price">
                
                    
                        <h>Price range (per night)</h><br>
                        <input type="checkbox" id="cheap" name="cheapRoom" value="Cheap">
                        <label for="cheap"> < $100</label><br>
                        <input type="checkbox" id="mid" name="midRoom" value="Mid">
                        <label for="mid"> $100 - $200</label><br>
                        <input type="checkbox" id="expensive" name="expensiveRoom" value="Expensive">
                        <label for="expensive">$200 - $500</label><br>
                        <input type="checkbox" id="luxury" name="luxuryRoom" value="Luxury">
                        <label for="luxury"> > $500</label><br><br>
                        

                </div>


                <div id="view">
                    <h>View</h><br>
                        <input type="checkbox" id="view1" name="sea" value="Sea">
                        <label for="view1"> Sea</label><br>
                        <input type="checkbox" id="view2" name="mountain" value="Mountain">
                        <label for="view2"> Mountain</label><br><br>
                        
                </div>


                <div id="starRating">
                    <h>Star rating</h><br>
                        <input type="checkbox" id="1star" name="oneStar" value="1">
                        <label for="1star">&#9733;</label><br>
                        <input type="checkbox" id="2star" name="twoStar" value="2">
                        <label for="2star"> &#9733; &#9733;</label><br>
                        <input type="checkbox" id="3star" name="threeStar" value="3">
                        <label for="3star">&#9733; &#9733; &#9733;</label><br>
                        <input type="checkbox" id="4star" name="fourStar" value="4">
                        <label for="4star">&#9733; &#9733; &#9733; &#9733;</label><br>
                        <input type="checkbox" id="5star" name="fiveStar" value="5">
                        <label for="5star">&#9733; &#9733; &#9733; &#9733; &#9733;</label><br><br>

                </div>


                <div id="amenty">
                    <h>Amenties</h><br>
                        <input type="checkbox" id="amenty1" name="a1" value="spa">
                        <label for="amenty1">spa</label><br>
                        <input type="checkbox" id="amenty2" name="a2" value="pet">
                        <label for="amenty2">pet-friendly</label><br>
                        <input type="checkbox" id="amenty3r" name="a3r" value="pool">
                        <label for="amenty3">pool</label><br>
                        <input type="checkbox" id="amenty4" name="a4" value="gym">
                        <label for="amenty4">gym</label><br>
                        <input type="checkbox" id="amenty5" name="a5" value="parking">
                        <label for="amenty5">parking</label><br><br>
                        


                </div>

                


            </div>



            <!-- main content -->
            <div id="content">

                 <div id="hotel">
                    <img src="Assets/fairmont.jpg" alt="fairmontimage"><br>
                    <h1>Deluxe Double Room, Ocean View</h1><br>
                    <p>Double</p><br>
                    <p>Ocean view</p><br>
                    <p>Breakfast included</p><br>
                    <p>Free seld parking</p><br>
                    <a href="" id="reserve">
                        <button type="button" >Reserve</button>
                        
                    </a>                                    
                    
               

                 </div>
                 <div id="hotel">
                    <img src="Assets/fairmont.jpg" alt="fairmontimage"><br>
                    <h1>Hilton Niagara Falls</h1><br>
                    <p>2 Queen Beds and 1 Double Sofa Bed</p><br>
                    <p>pool</p><br>
                    <p>hot tub</p><br>
                    <p>gym</p><br>
                    <a href="" id="reserve">
                        <button type="button" >Reserve</button>
    
                    </a>
                    
               

                 </div>
                 <div id="hotel">
                                    <img src="Assets/fairmont.jpg" alt="fairmontimage"><br>
                                    <h1>Deluxe Double Room, Ocean View</h1><br>
                    <p>Double</p><br>
                    <p>Ocean view</p><br>
                    <p>Breakfast included</p><br>           
                    <p>Free seld parking</p><br>
                    <a href="" id="reserve">
                        <button type="button" >Reserve</button>
    
                    </a>
                    
                    
               

                 </div>
                 <div id="hotel">
                    <img src="Assets/fairmont.jpg" alt="fairmontimage"><br>
                    <h1>Deluxe Double Room, Ocean View</h1><br>
                    <p>Double</p><br>
                    <p>Ocean view</p><br>
                    <p>Breakfast included</p><br>
                    <p>Free seld parking</p><br>
                    <a href="" id="reserve">
                        <button type="button" >Reserve</button>
    
                    </a>
                    
                    
               

                 </div>
               

            </div>

        </section>
        

        




       
    
        

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





