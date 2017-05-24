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
</head>
<jsp:include page="header2.jsp"></jsp:include>

<body bgcolor="#99CC66">

<%
String strError="";
		if(request.getAttribute("validate")!=null)
		{
int i = Integer.parseInt(request.getAttribute("validate").toString());
if (!(i>0))
{
	strError="Incorrect Username or Password !";
}
		}
%>

<div class="jumbotron" style="margin-bottom:50px; margin-top:-10px; background-image:url(images/cover.jpeg); background-repeat:no-repeat; color: #ffffff; height:400px; padding: 100px 25px; font-family: Montserrat, sans-serif;"> 
	<div class="container" align="center" style="margin-top:-20px;">
  	<h1>Rail 'n' Roll</h1> 
  	<h2> ADMIN PANEL </h2>
  	</div>
  <div class="container" style="background-color:#900; width:300px; padding-bottom:10px; border-radius:10px; margin-top:5px;">
  <h2>Sign in</h2>
  <span><%=strError %></span>
  <form role="form" method="post" action="userController?id=adminlogin">
    <div class="form-group">
      <label for="userid">User ID:</label>
      <input type="text" class="form-control" id="userid" name="userid" placeholder="Enter username">
    </div>
    <div class="form-group">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" name="pwd" placeholder="Enter password">
    </div>
    <button type="submit" class="btn btn-default">Login</button>
  </form>
</div>
</div>



</body>
</html>