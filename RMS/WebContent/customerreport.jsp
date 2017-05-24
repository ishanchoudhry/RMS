<%@page import="Bean.RegistrationDetails"%>
<%@page import="Bean.RouteDetails"%>
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
    ArrayList al=db.getUsers();
	int tot = al.size();
	%>
 
    	<table class="search" style="margin-right:20px;">
  		<tr>
  		<th>Username</th>
  		<th>Password</th>
  		<th>Security</th>
  		<th>Answer</th>
  		<th>Firstname</th>
  		<th>Lastname</th>
  		<th>Gender</th>
  		<th>Marital</th>
  		<th>Dob</th>
  		<th>Occupation</th>
  		<th>Email</th>
  		<th>Mobile</th>
  		<th>Nationality</th>
  		<th>City</th>
  		</tr>
    	<%
    for(int x=0;x<tot;x++) 
    {
    	RegistrationDetails td =(RegistrationDetails) al.get(x); 
    %>
    <%
    String username=td.getUsername();
    String password=td.getPassword();
    String security=td.getSecurity();
    String answer=td.getAnswer();
    String firstname=td.getFirstname();
    String lastname=td.getLastname();
    String gender=td.getGender();
    String marital=td.getMarital();
    String dob=td.getDob();
    String occupation=td.getOccupation();
    String email=td.getEmail();
    String mobile=td.getMobile();
    String nationality=td.getNationality();
    String city=td.getCity();
    %>
    <tr>
    <td><%=username%></td>
    <td><%=password%></td>
    <td><%=security%></td>
    <td><%=answer%></td>
    <td><%=firstname%></td>
    <td><%=lastname%></td>
    <td><%=gender%></td>
    <td><%=marital%></td>
    <td><%=dob%></td>
    <td><%=occupation%></td>
    <td><%=email%></td>
    <td><%=mobile%></td>
    <td><%=nationality%></td>
    <td><%=city%></td>
    </tr>
    <%} %>
    </table>  



</body>
</html>