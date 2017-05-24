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
String user = session.getAttribute("User").toString();%>
<body>
<jsp:include page="header.jsp">
<jsp:param value="<%=strUser %>" name="username"/>
<jsp:param value="<%=user %>" name="user"/>
</jsp:include>

<%
    DBModel db = new DBModel();
    ArrayList al=db.getAllReservations(strUser);
	int tot = al.size();
%>

<div class="jumbotron" style="margin-top:0px;">
    <div class="container" id="search" style="background-color:#900; padding-bottom:10px; border-radius:10px;">
  <div class="row">
  <div class="col-sm-1"></div>
  <div class="col-sm-11">
    	<table class="search">
  		<tr>
  		<th>PNR</th>
  		<th>Train No</th>
  		<th>Seat No</th>
  		<th>Source</th>
  		<th>Destination</th>
  		<th>Date of Journey</th>
  		<th>Time of Journey</th>
  		<th>Class</th>
  		<th>Fare</th>
  		<th>Status</th>
  		<th>Booking Date</th>
  		</tr>
    	<%for(int x=0;x<tot;x++) 
    {
    	BookingDetails bd =(BookingDetails) al.get(x); 
    %>
    <%
    String pnr=bd.getPnr();
    String trainno=bd.getTrainno();
    String seatno=bd.getSeatno();
    String source=bd.getSrc();
    String destination=bd.getDst();
    String date=bd.getDoj();
    String time=bd.getToj();
    String clas=bd.getClas();
    String fare = bd.getFare();
    String status=bd.getStatus();
    String bdate=bd.getBookingdate();
    %>
    <tr>
        <td><%=pnr%></td>
    <td><%=trainno%></td>
    <td><%=seatno%></td>
    <td><%=source%></td>
    <td><%=destination%></td>
    <td><%=date%></td>
    <td><%=time%></td>
    <td><%=clas%></td>
    <td><%=fare%></td>
    <td><%=status%></td>
    <td><%=bdate%></td>
    </tr>
    <%} %>
    </table>
    </div>
    
          
</div>
</div>
</div>

</body>
</html>