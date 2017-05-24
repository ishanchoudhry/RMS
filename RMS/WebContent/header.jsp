<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String strUser = session.getAttribute("userSession").toString();
String user = request.getParameter("user").toString();
DateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
Calendar cal = Calendar.getInstance();%>
<header class="header">
	<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#myPage"><img src="images/logo.png" class="img-responsive" alt="Logo" width="60" height="60" style="margin-top:-10px;"><span style="position:relative; left:70px; top:-45px;">Rail 'n' Roll</span></a>
    </div>
      <div class="nav navbar-nav navbar-right" style="margin-right:0px; margin-top:20px;">
        <Span style="color:white; margin-right:35px;"><%=dateFormat.format(cal.getTime()) %></span>
        <span style="color:white;">Welcome <%=user %></span>
        </div>
  </div>
</nav>


<nav style="margin-top:50px; background-color:#600; z-index:1;">
  <div class="container">
    <div class="custom" id="myNavbar">
      <ul>
        <li><a style="text-decoration:none; color:white;" href="home.jsp">HOME</a></li>
        <li><a style="text-decoration:none; color:white;" href="#">MY PROFILE</a></li>
        <li><a style="text-decoration:none; color:white;" href="userController?id=logout">LOGOUT</a></li>
      </ul>
    </div>
  </div>
</nav> 
</header>
