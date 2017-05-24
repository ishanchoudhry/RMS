<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Rail 'n' Roll</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/main.css">
  <script src="js/scroll.js"></script>
  <link href="http://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="http://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <link href="css/jquery-ui.css" rel="stylesheet">
  <link href="http://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
  <script src="js/jquery-1.10.2.js"></script>
  <script src="js/jquery-ui.js"></script>
  
  <style type="text/css">
  ul.link {list-style: none;padding: 0px;margin: 0px;}
  ul.link li {display: block;position: relative;float: left;border:1px solid #99CC66}
  li ul {display: none;}
  ul.link li a {display: block;background:#99CC66;padding: 10px 38px 5px 10px;text-decoration: none;
           white-space: nowrap;color:white;}
  ul.link li a:hover {background:red;}
  li:hover ul {display: block; position: absolute;}
  li:hover li {float: none;}
  li:hover a {background:green; color:#99CC66; position:relative; z-index:1;}
  li:hover li a:hover {background: red;}
  #drop-nav li ul li {border-top: 0px;}
</style>
</head>
<jsp:include page="header1.jsp"></jsp:include>
<body bgcolor="#99CC66">
<div class="container">
 <form method="post" action="userController?id=addtrain">
  <br/><h3 align="center"> Train's Details </h3> 
  <label for="tidText" style="position:relative;left:355px;"> Train ID <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="trainno" id="tidText" placeholder="Enter Train ID" 
  style="position:relative;left:380px;"/>
  <div id="tidError"></div> <br/> <br/>
  <label for="tnameText" style="position:relative;left:335px;"> Train Name <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="trainname" id="tnameText" placeholder="Enter Train Name" 
  style="position:relative;left:360px;"/>
  <div id="tnameError"></div> <br/> <br/>
  <label for="typeText" style="position:relative;left:342px;"> Train Type <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="traintype" id="typeText" placeholder="Enter Train Type" 
  style="position:relative;left:366px;"/>
  <div id="typeError"></div> <br/> <br/> <hr/>
  <h3 align="center"> Train's Schedule Details </h3> 
  <label for="dayText" style="position:relative;left:50px;"> Available At Days <b style="color:red;">*</b> : </label>
  <label for="monText" style="position:relative;left:50px;"> &nbsp; &nbsp; Monday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="monday" id="monbox" value="monday" />
  <label for="tueText" style="position:relative;left:50px;"> &nbsp; &nbsp; Tuesday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="tuesday" id="tuesbox" value="tuesday" />
  <label for="wedText" style="position:relative;left:50px;"> &nbsp; &nbsp; Wednesday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="wednesday" id="wedsbox" value="wednesday" />
  <label for="thuText" style="position:relative;left:50px;"> &nbsp; &nbsp; Thursday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="thursday" id="thursbox" value="thursday" />
  <label for="friText" style="position:relative;left:50px;"> &nbsp; &nbsp; Friday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="friday" id="fribox" value="friday" />
  <label for="satText" style="position:relative;left:50px;"> &nbsp; &nbsp; Saturday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="saturday" id="satbox" value="saturday" />
  <label for="sunText" style="position:relative;left:50px;"> &nbsp; &nbsp; Sunday </label>
  <input type="checkbox" style="position:relative; left:50px;" name="sunday" id="sunbox" value="sunday" /> <br/> <br/> <hr/> 
  <h3 align="center"> Train's Seat Details </h3> 
  <label for="slseat" id="slseat" name="slseat" style="position:relative;left:359px;"> Sleeper </label> 
  <b style="color:red; position:relative; left:360px;">*</b> <b style="position:relative; left:360px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="sleeper" id="sleeperText" placeholder="No. of Sleeper Seates" 
  style="position:relative;left:387px;"/> 
  <div id="slError"></div> <br/> <br/>
  <label for="3acseat" id="3acseat" name="3acseat" style="position:relative;left:377px;"> 3AC </label> 
  <b style="color:red; position:relative; left:378px;">*</b> <b style="position:relative; left:378px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="3ac" id="3acText" placeholder="No. of 3AC Seates" 
  style="position:relative;left:405px;"/> 
  <div id="3acError"></div> <br/> <br/>
  <label for="2acseat" id="2acseat" name="2acseat" style="position:relative;left:377px;"> 2AC </label> 
  <b style="color:red; position:relative; left:378px;">*</b> <b style="position:relative; left:378px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="2ac" id="2acText" placeholder="No. of 2AC Seates" 
  style="position:relative;left:405px;"/> 
  <div id="2acError"></div> <br/> <br/>
  <label for="1acseat" id="1acseat" name="1acseat" style="position:relative;left:377px;"> 1AC </label> 
  <b style="color:red; position:relative; left:378px;">*</b> <b style="position:relative; left:378px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="1ac" id="1acText" placeholder="No. of 1AC Seates" 
  style="position:relative;left:405px;"/> 
  <div id="1acError"></div> <br/> <br/> <hr/>
  <h3 align="center"> Train's Fare Details </h3> 
  <label for="slfareText" style="position:relative;left:320px;"> Sleeper's Fare <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="slfare" id="slfareText" placeholder="Enter Sleeper's Fare" 
  style="position:relative;left:344px;"/>
  <div id="slfareError"></div> <br/> <br/> 
  <label for="3acfareText" style="position:relative;left:338px;"> 3AC's Fare <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="3acfare" id="3acfareText" placeholder="Enter 3AC's Fare" 
  style="position:relative;left:362px;"/>
  <div id="3acfareError"></div> <br/> <br/> 
  <label for="2acfareText" style="position:relative;left:338px;"> 2AC's Fare <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="2acfare" id="2acfareText" placeholder="Enter 2AC's Fare" 
  style="position:relative;left:362px;"/>
  <div id="2acfareError"></div> <br/> <br/> 
  <label for="1acfareText" style="position:relative;left:338px;"> 1AC's Fare <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="1acfare" id="1acfareText" placeholder="Enter 1AC's Fare" 
  style="position:relative;left:362px;"/>
  <div id="1acfareError"></div> <br/> <br/> 
  <input type="submit" style="position:relative; left:380px;" onClick="return checkValidation();" name="submitButton" id="submitButton" value="Add Train" />
  <input type="reset" style="position:relative; left:400px;" onClick="return checkValidation();" name="resetButton" id="resetButton" value="Reset" />
 </form>
</div>


</body>
</html>