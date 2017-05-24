<%@page import="Bean.TrainDetails"%>
<%@page import="java.util.ArrayList"%>
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
<%String strUser = session.getAttribute("userSession").toString();
String user = session.getAttribute("User").toString();%>
<body>
<jsp:include page="header.jsp">
<jsp:param value="<%=strUser %>" name="username"/>
<jsp:param value="<%=user %>" name="user"/>
</jsp:include>


<div class="jumbotron" style="margin-top:0px;">
    <div class="container" id="search" style="background-color:#900; padding-bottom:10px; border-radius:10px;">
  <div class="row">
    <div class="col-sm-12" align="center" style="margin-top:50px; margin-bottom:50px;"><h4 style="color:#FFF;">Ticket Cancelled !</h4></div>
  </div>
</div>
</div>

</body>
</html>