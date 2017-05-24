<%@page import="Bean.TrainDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.DBModel"%>
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
<%
    DBModel db = new DBModel();
    ArrayList al=db.getTrainDetails();
	int tot = al.size();
%>
<div class="container">
 <form method="post" action="userController?id=addroute">
  <br/> 
  <label for="no" style="position:relative;left:355px;">Select Train No.</label><span class="mandatory" id="star">*</span>
              <select style="position:relative;left:380px;" id="no" name="trainno">
              <% for(int y=0;y<tot;y++) 
    {
    	TrainDetails td = (TrainDetails) al.get(y); 
    %>
    <%
    String trainno=td.getTrainno();
    %>
	<option><%=trainno %></option>
	<%} %>
	</select>
  <div id="tidError"></div> <br/> <br/>
  <label for="tnameText" style="position:relative;left:335px;"> Route No. <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="routeno" id="tnameText" placeholder="Enter Route No" 
  style="position:relative;left:360px;"/>
  <div id="tnameError"></div> <br/> <br/>
  <label for="typeText" style="position:relative;left:342px;"> Station <b style="color:red;">*</b> : </label>
  <input type="text" onBlur="checkValidation();" name="station" id="typeText" placeholder="Enter Station Code" 
  style="position:relative;left:366px;"/>
  <div id="typeError"></div> <br/> <br/> 
  <label for="slseat" id="slseat" name="slseat" style="position:relative;left:359px;"> Arrival Time </label> 
  <b style="color:red; position:relative; left:360px;">*</b> <b style="position:relative; left:360px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="arrival" id="sleeperText" placeholder="Arrival Time" 
  style="position:relative;left:387px;"/> 
  <div id="slError"></div> <br/> <br/>
  <label for="3acseat" id="3acseat" name="3acseat" style="position:relative;left:377px;"> Departure Time </label> 
  <b style="color:red; position:relative; left:378px;">*</b> <b style="position:relative; left:378px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="departure" id="3acText" placeholder="Departure Time" 
  style="position:relative;left:405px;"/> 
  <div id="3acError"></div> <br/> <br/>
  <label for="2acseat" id="2acseat" name="2acseat" style="position:relative;left:377px;"> Distance From Source </label> 
  <b style="color:red; position:relative; left:378px;">*</b> <b style="position:relative; left:378px; font-weight:normal;">: </b> 
  <input type="text" onBlur="checkValidation();" name="distance" id="2acText" placeholder="Enter Distance" 
  style="position:relative;left:405px;"/> 
  <div id="2acError"></div> <br/> <br/>
  <input type="submit" style="position:relative; left:380px;" onClick="return checkValidation();" name="submitButton" id="submitButton" value="Add Route" />
  <input type="reset" style="position:relative; left:400px;" onClick="return checkValidation();" name="resetButton" id="resetButton" value="Reset" />
 </form>
</div>


</body>
</html>