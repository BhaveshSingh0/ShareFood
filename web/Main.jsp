
<%@page import="com.DonarC"%>
<%@page import="org.hibernate.criterion.ProjectionList"%>
<%@page import="org.hibernate.transform.Transformers"%>
<%@page import="org.hibernate.SQLQuery"%>
<%@page import="org.hibernate.criterion.Projections"%>
<%@page import="com.User"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Criteria"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.cfg.Configuration"%>
<%



if (null == request.getAttribute("dbError")) {
   request.setAttribute("dbError", "none");
    }
if (null == request.getAttribute("sendSuccess")) {
   request.setAttribute("sendSuccess", "none");
    }
if (null == request.getAttribute("loginError")) {
   request.setAttribute("loginError", "none");
    }


%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Home</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link type="text/css" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500">
   <link href="css/style.css" rel="stylesheet" type="text/css"/>
      <style>
        #wrong_login{
            display: <%= request.getAttribute("loginError") %>;
        }
        #sendSuccess{
            display: <%= request.getAttribute("sendSuccess") %>;
        }
        #dbError {
            display: <%= request.getAttribute("dbError") %>;
        }
    </style>
 
 
     
   <script type="text/javascript">
      
            $(document).ready(function(){
                $('#count-box').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box2').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
                 $('#count-box3').CountUpCircle({
                    duration: 1000,
                    opacity_anim: true,
                    step_divider: 2
                });
            });
     </script>   
  <style>
      .mytab {
          margin: auto;
          padding-left: 4%;
          padding-right: 5%;
          background-color: white;
      }
       .carousel-inner img {
      width: 100%; 
      margin: auto;
      min-height:200px;
       }
  li {
     font-family:  Georgia, serif;
      font-size: 17px;
      
  }
  .info {
    background-color: #e7f3fe;
    border-left: 6px solid #2196F3;
}

  
  li:hover{
      
     font-family:  Comic Sans MS, cursive, sans-serif ;
     font-size: 20px;
     color: #000;
  }
  @media (max-width: 600px) {
    .carousel-caption {
      display: none; 
    }
  }
      
      
    .nav-tabs { border-bottom: 2px solid #DDD; }
    .nav-tabs > li.active > a, .nav-tabs > li.active > a:focus, .nav-tabs > li.active > a:hover { border-width: 0; }
    .nav-tabs > li > a { border: none; color: #666; }
    .nav-tabs > li.active > a, .nav-tabs > li > a:hover { border: none; color: #4285F4 !important; background: transparent; }
    .nav-tabs > li > a::after { content: ""; background: #4285F4; height: 4px; position: absolute; width: 100%; left: 0px; bottom: -1px; transition: all 250ms ease 0s; transform: scale(0); }
    .nav-tabs > li.active > a::after, .nav-tabs > li:hover > a::after { transform: scale(1); }
    .tab-nav > li > a::after { background: #21527d none repeat scroll 0% 0%; color: #fff; }
    .tab-pane { padding: 15px 0; }
    .tab-content{padding:20px}

.card {background: #FFF none repeat scroll 0% 0%; box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.3); margin-bottom: 30px; }
body{ background: #EDECEC; padding:50px}






                    h1 {
  font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic, "AppleGothic", sans-serif;
  font-size: 32px;
  padding: 20px 10px;
  text-align: center;
  text-transform: uppercase;
  text-rendering: optimizeLegibility;
}



.deepshd {
    
  color: #e0dfdc;
  margin-top: -10px;
  background-color: #333;
  letter-spacing: .1em;
  text-shadow: 0 -1px 0 #fff, 0 1px 0 #2e2e2e, 0 2px 0 #2c2c2c, 0 3px 0 #2a2a2a, 0 4px 0 #282828, 0 5px 0 #262626, 0 6px 0 #242424, 0 7px 0 #222, 0 8px 0 #202020, 0 9px 0 #1e1e1e, 0 10px 0 #1c1c1c, 0 11px 0 #1a1a1a, 0 12px 0 #181818, 0 13px 0 #161616, 0 14px 0 #141414, 0 15px 0 #121212, 0 22px 30px rgba(0, 0, 0, 0.9);
}
  </style>
      
</head>
<body style="background-color:white; font-family: OpenSans;">
    <div class="row" style="margin-top: 0px;">
     <div class="col-md-3">
       
        <h1 class="deepshd"> Share Food  <span class="glyphicon glyphicon-share-alt"></span> </h1>
        
        
        
        </div>
        
        <div class=" col-md-5">
        <form class="navbar-form navbar-header">
        <div class="form-group" id="locationField">
            <input type="text"  style="width: 400px; padding: 5px;"class="form-control" id="autocomplete"  placeholder="Enter the Location to Register"
             onFocus="geolocate()" placeholder="Search">
        </div>
            <button type="submit" class="btn btn-group-vertical" onclick="hello()"><b>Search</b></button>
         </form>
        </div>
        
        
         <% 
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
     
     
            <div class="col-md-2" style="margin-top: 0px;">
                <form action="dashboard.jsp" >
                    <div class="form-group" >
                      <label for="sel1"><b>Select City To Donate :</b></label>
                    <select class="form-control" name="city" id="sel1" >
                      
                      <%
 
Criteria cr = session1.createCriteria(User.class);
ProjectionList projectionList = Projections.projectionList();
ProjectionList projectionList2 = Projections.projectionList();
projectionList2.add(Projections.distinct(projectionList.add(Projections.property("city"), "city")));

cr.setProjection(projectionList2);
cr.setResultTransformer(Transformers.aliasToBean(User.class));
     List list = cr.list();
       
      Iterator iterator = list.iterator(); 
      
      for (int i = 0; i < list.size(); i++)
{
             User user =  (User) iterator.next();
   
    
             %>
             <option  value="<%= user.getCity() %>"><%= user.getCity() %></option>
             
             <%
    
    
}
t.commit();
session1.close();
      %>
                    </select>
                      </div>
                   </div>
                    <div class="col-md-2">
                        <button type="submit" style="margin-top: 20px;" class="btn btn-group-vertical" ><b>Donate</b></button>
                    </div>
               </form>
            
           
        </div> 
</div>
   
      
      
       <%
      
      
   }
        
        
        catch(Exception e){
      
            
        }
   
        %>
     <br>
      <div class="alert alert-danger" id="dbError" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Something went seriously wrong!Please contact the developer.</center>
                    </div>
                    
     <div class="alert alert-danger" id="wrong_login" role="alert">
          <center>This Username not found in Database! Please register and try again!</center>
      </div>
     
                    <div class="alert alert-success" id="sendSuccess" role="alert">
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        <center>Data Stored</center>
                    </div>
                    <br>
    <br>
    
    <div class="row">
		                    <div class="col-md-12">
                                        <div class="card" style="background-color: whitesmoke;">
                                    <ul class="nav nav-tabs" role="tablist" >
                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home&nbsp;<span class="glyphicon glyphicon-home"></span></a></li>
                                        <li role="presentation"><a href="#about" aria-controls="profile" role="tab" data-toggle="tab">About&nbsp;<span class="glyphicon glyphicon-leaf"></span></a></li>
                                        <li role="presentation"><a href="#contact" aria-controls="messages" role="tab" data-toggle="tab">Admin&nbsp;<span class="glyphicon glyphicon-home"></span></a></li>
                                        <li role="presentation"><a href="#registerme" aria-controls="settings" role="tab" data-toggle="tab">Register&nbsp;<span class="glyphicon glyphicon-registration-mark"></span></a></li>
                                    </ul>

                                  
                                        <div class="tab-content" style="background-color: whitesmoke;">
                                        <div role="tabpanel" class="tab-pane active" id="home">
                                            
                                            

                                                            <div class="row">
                                                          <div class="col-md-12">
                                                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                                      <!-- Indicators -->
                                                      <ol class="carousel-indicators">
                                                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                                                        <li data-target="#myCarousel" data-slide-to="1"></li>
                                                      </ol>

                                                      <!-- Wrapper for slides -->
                                                      <div class="carousel-inner" role="listbox">
                                                        <div class="item active">
                                                            <img src="img/p2.png" alt=""/>

                                                        </div>

                                                        <div class="item"><img src="img/p1.png" alt=""/>

                                                        </div>


                                                          <div class="item"><img src="img/p3.jpg" alt=""/>

                                                        </div>
                                                      </div>

                                                      <!-- Left and right controls -->
                                                      <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                                        <span class="sr-only">Previous</span>
                                                      </a>
                                                      <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                                        <span class="sr-only">Next</span>
                                                      </a>
                                                  </div>
                                                          </div>
                                                      </div>
                                            <br>
                                            
                                            
          <% 
              
              
          try{
     Configuration cfg=new Configuration();  
     cfg.configure("hibernate.cfg.xml");//populates the data of the configuration file  
     SessionFactory factory=cfg.buildSessionFactory();  
     Session  session1=factory.openSession();  
     Transaction t = session1.beginTransaction();  
     
     
     %>
        
                      <%
 
Criteria cr = session1.createCriteria(User.class);

   List  list = cr.list();
       
t.commit();



Transaction t1 = session1.beginTransaction();
Criteria cr1 = session1.createCriteria(DonarC.class);

   List  list1 = cr1.list();
       t1.commit();
session1.close();
      %>
       
                                                                    <br>
                                                                     <div class="row">
                                

                                <div class=" col-md-offset-2 col-md-4 ">

                                 <div class="wrapper">

                                     <div id="count-box2"><%= list.size() %></div> 
                                </div>
                                         <h3>People Registered &nbsp;<span class="glyphicon glyphicon-registration-mark"></span></h3>
                                </div>


                                <div class=" col-md-offset-2 col-md-4">
                                 <div class="wrapper">
                                   <div id="count-box3"><%= list1.size() %></div> 
                                </div>
                                     <h3>People Donated &nbsp;<span class="glyphicon glyphicon-tree-deciduous"></span></h3>
                                </div>

                            </div>




                       </div>

                                        
                                        
                                        
                                      
                                        <div role="tabpanel" class="tab-pane" id="about"> </div>
                                        <div role="tabpanel" class="tab-pane" id="contact">
                                        
                                        
                                            <div class="row">
                                                <div class="col-md-offset-1 col-md-4">
                                                    
                                                    

                                                    <form   action="admin"   method="post">
                                                                      <div class="form-group">
                                                                        <label for="email">Email address:</label>
                                                                        <input type="email" class="form-control" name="email">
                                                                      </div>
                                                                      <div class="form-group">
                                                                        <label for="pwd">Password:</label>
                                                                        <input type="password" class="form-control" name="pwd">
                                                                      </div>
                                                                   
                                                                      <button type="submit" class="btn btn-default">Submit</button>
                                                                    </form>
                                                </div>
                                                
                                            </div>
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        
                                        </div>
                                       
                                        
                                        
                                        <div role="tabpanel" class="tab-pane" id="registerme">
                                        <div class="row">
                                                <div class="col-md-5">
                                                    <div class="info" style=" margin-bottom: 15px;padding: 4px 12px;">
                                                    <p><strong>Info!</strong> Please Enter the Location in Above Search Box...</p>
                                                  </div> 
                                                </div>
                                            </div>
      
                                         <div class="row">
                                            <div class="col-md-offset-7 col-md-4" ">
                                                <form action="reg" method="post" id="myregform">


                                        <input type="hidden" class="form-control" id="street_number"  ></input>
                                       <input type="hidden" class="form-control" id="route"></input>

                                     <div class="form-group">
                                   <label for="usr">City:</label>
                                   <input type="text" class="form-control" name="city" id="locality"  placeholder="City" required>
                                 </div>
                                 <div class="form-group">
                                   <label for="pwd">State:</label>
                                   <input type="text" class="form-control" name="state" id="administrative_area_level_1" placeholder=" State" required >
                                 </div>
                                  <div class="form-group">
                                   <label for="pwd">ZipCode:</label>
                                   <input type="text" class="form-control"  name="zip" id="postal_code" placeholder="ZipCode" required>
                                 </div>
                                       <div class="form-group">
                                   <label for="pwd">Country:</label>
                                   <input type="text" class="form-control" name="country" id="country" placeholder="Country" required>
                                 </div>

                                 <div class="form-group has-feedback">
                                <label for="contact">Mobile Phone</label>
                                <div class="input-group has-feedback">
                                   
                                    <span class="input-group-btn">
                                      <button class="btn btn-default" type="button" disabled>+91</button>
                                    </span>
                                    <input type="text" name="mob" id="contact1"  tabindex="10" class="form-control" data-toggle="popover" data-trigger="hover" data-placement="right"
                                           data-content="Your phone number helps us with things like keeping your account secure." placeholder="Example: 9004196353" />
                                    
                                </div>
                            </div>
                                <div class="form-group has-feedback">
                                <label for="gender">Organization:</label>
                                <select class="form-control has-feedback" name="mem"  tabindex="6"   required>
                                    <option name="male">NGOs</option>
                                    <option name="female">Orphanage-Member</option>
                                    <option name="other">Other</option>
                                </select>
                            </div>

                            <div class="form-group">
                       <label for="pwd">Total Person:</label>
                       <input type="Number" class="form-control" name="total" id="number" placeholder="Total Person" required>
                     </div>



                               <div class="form-group has-feedback" style="margin-left: 10px;">
                                                     <label for="rights"></label>
                                                     <div class="checkbox has-feedback">
                                                           <input type="checkbox" id="rights" name="rights"  tabindex="11" value="yes" required>
                                                           <p style="font-size: 14.5px;">I agree to the Share-Free.org <a href="terms.html"><b>Terms of Service and Privacy Policy</b></a>.</p>
                                                     </div>
                                                 </div>

                                                 <div class="form-group" style="margin-bottom: -20px;">
                                                   <div class="col-sm-offset-4 col-sm-12">
                                                       <input type="button" id="reg_button"  value="Register" class="btn btn-success"  tabindex="12">
                                                   </div>
                                                 </div>
                                   </form>
                               </div>
                           </div>



                                </div>
                              </div>
                            </div>
                          </div>    




                         </div>

    
    
    
    <%
      
      
   }
        
        
        catch(Exception e){
      
            
        }
   
        %> 
    
    
    
    <hr>
    <footer style="width: 100%; background-color: black; font-size: 12px; color: white; padding: 10px;">
        <center>
            While using this site, you agree to have read and accepted our terms of use, cookie and privacy policy.
	    <br/>
            &copy; Copyright 2016-2017 by <a href="index.html">ShareFree.Ltd.</a> &reg; All Rights Reserved.
        </center>
    </footer>
    
    
    <script src="js/jquery.countupcircle.js" type="text/javascript"></script>
    
     <script type="text/javascript">
        
        
        
        function validateContact(key1)
        {
            var value = $("#"+key1).val();
            var regex = /[^0-9]/;
            if(value===null||value==="")
            {
                var div = $("#"+key1).closest("div");
                div.addClass("has-warning");
                div.removeClass("has-success");
                div.removeClass("has-error");
                $('#error'+key1).remove();
                
                $("#"+key1).css({"margin-top":"14px"});
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter your contact number.</span>');
                $('#error'+key1).css({"display":"table"});
                $("#glyphcn"+key1).remove();
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
            else if(value.length!==10||regex.test(value))
            {
                var div = $("#"+key1).closest("div");
                div.removeClass("has-warning");
                div.removeClass("has-success");
                div.addClass("has-error");
                $('#error'+key1).remove();
                
                $("#"+key1).css({"margin-top":"14px"});
                div.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter a valid contact number.</span>');
                $('#error'+key1).css({"display":"table"});
                $("#glyphcn"+key1).remove();
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
                return false;
            }
            else
            {
                var div = $("#"+key1).closest("div");
                $('#error'+key1).css({"display":"none"});
                $("#error"+key1).remove();
                $('#glyphcn'+key1).remove();

                div.removeClass("has-warning");
                div.addClass("has-success");
                div.removeClass("has-error");

                $("#"+key1).css({"margin-top":" 0px"});
                div.append('<span id="glyphcn'+key1+'" style="margin-top: 0px;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
                return true;
            }
        }
        $(document).ready(
        
            function()
            {
                $("#reg_button").click(
                    function()
                    {
                        validateContact("contact1");
                        if(validateContact("contact1"))
                            $("form#myregform").submit();
                        else
                            $("#wrong").css({"display": "block"});
                    }
                );
            }
            
        );
    </script>
        
        
     <script>
     
      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'short_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
       autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

         for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

       function geolocate() {
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var geolocation = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
            };
            var circle = new google.maps.Circle({
              center: geolocation,
              radius: position.coords.accuracy
            });
            autocomplete.setBounds(circle.getBounds());
          });
        }
      }
    </script>
    
    
    

    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcXs-7TBRttYlGFHgCYfRFwsUiV1AAWyY&libraries=places&callback=initAutocomplete"
        async defer></script>
        
    
        
      
    <script>
        $('#contact').popover();
        $('#name').popover();
    </script>
    
    <!-- Script for validation of form goes right below, hoss!-->
   

</body>
</html>
