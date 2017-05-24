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
<body bgcolor="#99CC66" >
<div class="content">

    <form method="post" action="userController?id=addstation">
  <br/><h3 align="center"> Station's Details </h3>
  <label for="stidText" style="position:relative;left:355px;"> Station ID <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="stnid" id="stidText" placeholder="Enter Station ID" 
  style="position:relative;left:380px;"/>
  <div id="stidError"></div> <br/> <br/>
  <label for="stnameText" style="position:relative;left:335px;"> Station Name <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="stnname" id="stnameText" placeholder="Enter Station Name" 
  style="position:relative;left:360px;"/>
  <div id="stnameError"></div> <br/> <br/>
 <input type="submit" style="position:relative; left:380px;" onClick="return checkValidation();" name="submitButton" id="submitButton" value="Add Station" />
  <input type="reset" style="position:relative; left:400px;" onClick="return checkValidation();" name="resetButton" id="resetButton" value="Reset" />
    </form>
  </div>

</body>
</html>