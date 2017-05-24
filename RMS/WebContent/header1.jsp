<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<header class="header">
	<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="#myPage"><img src="images/logo.png" class="img-responsive" alt="Logo" width="60" height="60" style="margin-top:-10px;"><span style="position:relative; left:70px; top:-45px;">Rail 'n' Roll</span></a>
    </div>
      <div class="nav navbar-nav navbar-right" style="margin-right:0px; margin-top:20px;">
        
        </div>
  </div>
</nav>


<nav style="margin-top:50px; background-color:#600; z-index:1;">
  <div class="container">
    <div class="custom" id="myNavbar">
      <ul>
        <li><a style="text-decoration:none; color:white;" href="adminpanel.jsp">HOME</a></li>
        <li><a style="text-decoration:none; color:white;" href="adminlogin.jsp">LOGOUT</a></li>
      </ul>
    </div>
  </div>
  
  <div class="content">
       
        <div id="dropdown" style="z-index:999; position:relative; left:0px; margin-left:500px;">
      <ul class="link" id="drop-nav" >

        <li><a href="#">Train</a>
      <ul>
        <li><a href="traininfo.jsp">Add Train</a></li>
        <li><a href="deletetrain.jsp">Delete Train</a></li>
    </ul>
       </li>
      <li><a href="#">Station</a>
     <ul>
      <li><a href="stationinfo.jsp">Add Station</a></li>
      <li><a href="updatestation.jsp">Delete Station</a></li>
    </ul>
      </li>
     <li><a href="#">Route</a>
    <ul>
      <li><a href="addroute.jsp">Add Route</a></li>
      <li><a href="deleteroute.jsp">Delete Delete</a></li>
    </ul>
      <li><a href="#">Reports</a>
    <ul>
      <li><a href="customerreport.jsp">Customer Report</a></li>
      <li><a href="trainreport.jsp">Train Report</a></li>
      </ul>
  
    </ul>
    </div><br/>
    <div class="header"> 
          <h2 style="text-align:center;"> ADMIN PANEL </h2>
       </div>

 </div>
  
  
  
  
</nav> 
</header>
