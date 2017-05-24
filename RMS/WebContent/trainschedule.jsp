<%@page import="Bean.BookingDetails"%>
<%@page import="DB.DBModel"%>
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
String user = session.getAttribute("User").toString();
ArrayList train = (ArrayList)request.getAttribute("train");%>
<body>
<jsp:include page="header.jsp">
<jsp:param value="<%=strUser %>" name="username"/>
<jsp:param value="<%=user %>" name="user"/>
</jsp:include>

<%
    DBModel db = new DBModel();
    ArrayList al=db.getTrainDetails();
	int tot = al.size();
%>

<div class="jumbotron" style="margin-top:0px;">
    <div class="container" id="search" style="background-color:#900; padding-bottom:10px; border-radius:10px;">
  <div class="row">
  <div class="col-sm-4"></div>
  <div class="col-sm-4">
  <form role="form" id="" style="display:block; margin-top:10px; margin-bottom:10px;" method="post" action="userController?id=schedule">
    <div class="form-group">
              <label for="no">Select Train No.</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="no" name="no">
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
            </div>
            <button type="submit" class="btn btn-default">Submit</button>
            </div>
            <div class="col-sm-4"></div>
            </div>
            

     <%if(train!=null)
    {
    	if(train.size()>0)
    	{
    	%>
    	<div class="row">
    	    <div class="col-sm-4"></div>
    	<table class="search">
  		<tr>
  		<th>Route No</th>
  		<th>Station</th>
  		<th>Arrival</th>
  		<th>Departure</th>
  		<th>Distance</th>
  		</tr>
    	<%int total = train.size();
    for(int x=0;x<total;x++) 
    {
    	TrainDetails td =(TrainDetails) train.get(x); 
    %>
    <%
    String routeno=td.getRouteno();
    String station=td.getSrc();
    String arrival=td.getArrival();
    String departure=td.getDeparture();
    String distance=td.getDistance();
    %>
    <tr>
        <td><%=routeno%></td>
    <td><%=station%></td>
    <td><%=arrival%></td>
    <td><%=departure%></td>
    <td><%=distance%></td>
    </tr>
    <%} %>
    </table>
    <div class="col-sm-2"></div>
    </div>
    <%}} %>       
</div>
</div>

</body>
</html>