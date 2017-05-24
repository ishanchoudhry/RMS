<%@page import="org.apache.tomcat.util.codec.binary.StringUtils"%>
<%@page import="Bean.TrainDetails"%>
<%@page import="Bean.StationDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DB.DBModel"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="javax.servlet.http.Cookie"%>
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
  
  <script>
		 $(function() {
    $( "#datepicker" ).datepicker({ minDate: -0, maxDate: "+3M", dateFormat:"yy-mm-dd", altField: "#alternate",
        altFormat: "DD" });
  });
  
  $(function() {
    $( "#datepicker-1" ).datepicker({ minDate: -0, maxDate: "+3M", dateFormat:"yy-mm-dd", altField: "#alternate",
      altFormat: "DD" });
  });
  
  		function plan()
		{
			x=document.getElementById("plan");	
			y=document.getElementById("quick");
			z=document.getElementById("planform");
			a=document.getElementById("quickform");	
				
			x.style.backgroundColor="#900";
			x.style.borderTopLeftRadius="10";
			y.style.backgroundColor="#600";
			y.style.borderTopRightRadius="10";
			z.style.display="block";
			a.style.display="none";
		}
		function quick()
		{
			x=document.getElementById("plan");	
			y=document.getElementById("quick");	
			z=document.getElementById("planform");
			a=document.getElementById("quickform");	
				
			x.style.backgroundColor="#600";
			x.style.borderTopLeftRadius="10";
			y.style.backgroundColor="#900";
			y.style.borderTopRightRadius="10";
			z.style.display="none";
			a.style.display="block";
		}
		
		function searchResult() {
      	document.getElementById("links").style.display = "none";
      	document.getElementById("search").style.display = "block";
}
		
      </script>
</head>

<%String strUser = session.getAttribute("userSession").toString();
String user = session.getAttribute("User").toString();
session.setAttribute("User", user);
ArrayList train = (ArrayList)request.getAttribute("train");
ArrayList seats = (ArrayList)request.getAttribute("seats");
session.setAttribute("train",train);
String from="";
String to="";
String date="";
if(train!=null)
{
	from = request.getAttribute("from").toString();
	to = request.getAttribute("to").toString();
	date = request.getAttribute("date").toString();
	session.setAttribute("from", from);
	session.setAttribute("to", to);
	session.setAttribute("date", date);
%>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" onload="searchResult();">
<%}
else if(seats!=null){%>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60" onload="searchResult();">
<%}else {%>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<%} %>
<jsp:include page="header.jsp">
<jsp:param value="<%=strUser %>" name="username"/>
<jsp:param value="<%=user %>" name="user"/>
</jsp:include>
	
	<%
    DBModel db = new DBModel();
    ArrayList al=db.getStations();
	int tot = al.size();
%>
	
	
    <div class="jumbotron" style="margin-top:0px;">
    <div class="row">
    <div class="col-sm-3">
  <div class="container" style="background-color:#900; padding-bottom:10px; border-radius:10px;">
  <div class="row" style="background-color:#600; border-top-left-radius:10px; border-top-right-radius:10px;">
  <div class="col-sm-6" style="background-color:#900; border-top-left-radius:10px;" id="plan"><span><h5><a href="#" style="text-decoration:none; color:#FFF;" onclick="plan();">Plan My Journey</a></h5></span></div>
  <div class="col-sm-6" style="background-color:#600; border-top-right-radius:10px;" id="quick"><span><h5><a href="#" style="text-decoration:none; color:#FFF;" onclick="quick();">Quick Book</a></h5></span></div>
  </div>
  <form role="form" id="planform" style="display:block; margin-top:10px; margin-bottom:10px;" method="post" action="userController?id=search">
    <div class="form-group">
              <label for="from">From Station</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="from" name="from">
              <option>Select Source Station</option>
              <% for(int y=0;y<tot;y++) 
    {
    	StationDetails sd = (StationDetails) al.get(y); 
    %>
    <%
    String stnname=sd.getStationname();
    String stncode=sd.getStationcode();
    String entry=stnname+"-"+stncode;
	%>
	<option><%=entry %></option>
	<%} %>
	</select><span id="tempfrom" style="display:none;"><%=from %></span>
            </div>
    <div class="form-group">
              <label for="to">To Station</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="to" name="to">
              <option>Select Destination Station</option>
              <% for(int y=0;y<tot;y++) 
    {
    	StationDetails sd = (StationDetails) al.get(y); 
    %>
    <%
    String stnname=sd.getStationname();
    String stncode=sd.getStationcode();
    String entry=stnname+"-"+stncode;
	%>
	<option><%=entry %></option>
	<%} %>
	</select><span id="tempto" style="display:none;"><%=to %></span>
            </div>
    <div class="form-group">
              <label for="date">Journey Date</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="datepicker" name="date" placeholder="yyyy-mm-dd">
              <input type="text" id="alternate" name="day" size="1" style="color: black; display: none;">
              <span id="tempdate" style="display:none;"><%=date %></span>
            </div>        
    <button type="submit" class="btn btn-default" onclick="searchResult();">Submit</button>
    <button type="reset" class="btn btn-default">Reset</button>
  </form>
  
  
  
  <form role="form" id="quickform" style="display:none; margin-top:10px; margin-bottom:10px;" action="#">
    <div class="form-group">
              <label for="trainno">Train No.</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="trainno" name="trainno" placeholder="Train No.">
            </div>
    <div class="form-group">
              <label for="from">From Station</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="from" name="from" placeholder="Enter Source Station">
            </div>
    <div class="form-group">
              <label for="to">To Station</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="to" name="to" placeholder="Enter Destination Station">
            </div>
    <div class="form-group">
              <label for="date">Journey Date</label><span class="mandatory" id="star">*</span>
              <input type="text" class="form-control" id="datepicker-1" name="date" placeholder="yyyy-mm-dd">
              <input type="text" id="alternate" name="day" size="1" style="color: black; display: none;">
            </div>   
    <div class="form-group">
              <label for="class">Class</label><span class="mandatory" id="star">*</span>
              <select class="form-control" id="class" name="class"><option>Select Class</option><option>Sleeper</option><option>First AC</option><option>Second AC</option><option>Third AC</option></select>
            </div>              
    <button type="submit" class="btn btn-default" onclick="searchResult();">Submit</button>
    <button type="reset" class="btn btn-default">Reset</button>
  </form>
</div>
</div>


<div class="col-sm-9">
<div class="container" id="links" style="background-color:#900; padding-bottom:10px; border-radius:10px;">
  <div class="row">
  <div class="col-sm-6" align="center" style="margin-top:50px; margin-bottom:50px;"><h4><a href="cancel.jsp" style="text-decoration:none; color:#FFF;">Cancel Ticket</a></h4></div>
  <div class="col-sm-6" align="center" style="margin-top:50px; margin-bottom:50px;"><h4><a href="checkpnr.jsp" style="text-decoration:none; color:#FFF;">Check PNR Status</a></h4></div>
  </div>
  <div class="row">
  <div class="col-sm-6" align="center" style="margin-top:50px; margin-bottom:50px;"><h4><a href="past.jsp" style="text-decoration:none; color:#FFF;">Past Reservations</a></h4></div>
  <div class="col-sm-6" align="center" style="margin-top:50px; margin-bottom:50px;"><h4><a href="trainschedule.jsp" style="text-decoration:none; color:#FFF;">Check Train Schedule</a></h4></div>
  </div>
</div>




<div class="container" id="search" style="background-color:#900; padding-bottom:10px; border-radius:10px; display:none;">
    
    <%if(train!=null)
    {
    	if(train.size()>0)
    	{
    	%>
    	<div class="row">
    	<table class="search">
  		<tr>
  		<th>Train No.</th>
  		<th>Train Name</th>
  		<th>From</th>
  		<th>Departure</th>
  		<th>To</th>
  		<th>Arrival</th>
  		<th>Dist.(Km)</th>
  		<th>M</th>
  		<th>T</th>
  		<th>W</th>
  		<th>T</th>
  		<th>F</th>
  		<th>S</th>
  		<th>S</th>
  		<th>Class</th>
  		</tr>
    	<%int total = train.size();
    for(int x=0;x<total;x++) 
    {
    	TrainDetails td =(TrainDetails) train.get(x); 
    %>
    <%
    String trainno=td.getTrainno();
    String trainname=td.getTrainname();
    String src=td.getSrc();
    String departure=td.getDeparture().substring(0, 5);
    session.setAttribute("time", departure);
    String dst=td.getDst();
    String arrival=td.getArrival().substring(0, 5);
    String distance=td.getDistance();
    String mon=td.getMonday();
    String tues=td.getTuesday();
    String wed=td.getWednesday();
    String thu=td.getThursday();
    String fri=td.getFriday();
    String sat=td.getSaturday();
    String sun=td.getSunday();
    if(mon.equalsIgnoreCase("1"))
    	mon="Y";
    else
    	mon="N";
    if(tues.equalsIgnoreCase("1"))
    	tues="Y";
    else
    	tues="N";
    if(wed.equalsIgnoreCase("1"))
    	wed="Y";
    else
    	wed="N";
    if(thu.equalsIgnoreCase("1"))
    	thu="Y";
    else
    	thu="N";
    if(fri.equalsIgnoreCase("1"))
    	fri="Y";
    else
    	fri="N";
    if(sat.equalsIgnoreCase("1"))
    	sat="Y";
    else
    	sat="N";
    if(sun.equalsIgnoreCase("1"))
    	sun="Y";
    else
    	sun="N";
    String a1=td.getA1();
    String a2=td.getA2();
    String a3=td.getA3();
    String sl=td.getSl();
	%>
    <tr>
        <td><%=trainno%></td>
    <td><%=trainname%></td>
    <td><%=src%></td>
    <td><%=departure%></td>
    <td><%=dst%></td>
    <td><%=arrival%></td>
    <td><%=distance%></td>
    <td><%=mon%></td>
    <td><%=tues%></td>
    <td><%=wed%></td>
    <td><%=thu%></td>
    <td><%=fri%></td>
    <td><%=sat%></td>
    <td><%=sun%></td>
    <td><a href="userController?id=avl&clas=1a&no=<%=trainno%>&date=<%=date %>&dst=<%=distance %>" style="color:aqua;"><%=a1 %></a> <a href="userController?id=avl&clas=2a&no=<%=trainno%>&date=<%=date %>&dst=<%=distance %>" style="color:aqua;"><%=a2 %></a> 
    <a href="userController?id=avl&clas=3a&no=<%=trainno%>&date=<%=date %>&dst=<%=distance %>" style="color:aqua;"><%=a3 %></a> <a href="userController?id=avl&clas=sl&no=<%=trainno%>&date=<%=date %>&dst=<%=distance %>" style="color:aqua;"><%=sl %></a></td>
    </tr>
    <%} %>
    </table>
    </div>
    <%} else{%>
    <div class="row">
  <div class="col-sm-12" align="center" style="margin-top:50px; margin-bottom:50px;"><h4 style="color:#FFF;">No Results Found !</h4></div>
  </div> 
  <%}}%>
  
  
  
  <%if(seats!=null)
    {
    	if(seats.size()>0)
    	{
    	%>
    	<div class="row" style="margin-top:50px;">
    	<table class="search">
  		<tr>
  		<th>Date</th>
  		<th>Train No</th>
  		<th>Class</th>
  		<th>Availability</th>
  		<th>Fare(Rs.)</th>
  		</tr>
    	<%int total = seats.size();
    	String s="";
    	String link="";
    for(int a=0;a<total;a++) 
    {
    	TrainDetails td =(TrainDetails) seats.get(a); 
    %>
    <%
    String trainno=td.getTrainno();
    String clas = td.getCls();
    String status=td.getStatus();
    int fare=Integer.parseInt(td.getFare());
    int distance=Integer.parseInt(request.getAttribute("dst").toString());
    int totfare = ((fare)*(distance));
    if(!status.equalsIgnoreCase("Not Available"))
    {
    if(clas.equalsIgnoreCase("1A"))
    	s=td.getA1();
	else if(clas.equalsIgnoreCase("2A"))
		s=td.getA2();
	else if(clas.equalsIgnoreCase("3A"))
		s=td.getA3();
	else if(clas.equalsIgnoreCase("SL"))
		s=td.getSl();
    link="Book Now";
    }
	%>
    <tr>
        <td><%=date%></td>
    <td><%=trainno%></td>
    <td><%=clas %></td>
    <td><%=status%> <%=s%><br/><a href="userController?id=book&trainno=<%=trainno%>&clas=<%=clas%>&status=<%=status%>&seat=<%=s%>&fare=<%=totfare%>&date=<%=date%>" style="color:aqua;"><%=link %></a></td>
    <td><%=totfare %></td>
    </tr>
    <%} %>
    </table>
    </div>
    <%} else{%>
    <div class="row">
  <div class="col-sm-12" align="center" style="margin-top:50px; margin-bottom:50px;"><h4 style="color:#FFF;">No Results Found !</h4></div>
  </div> 
  <%}}%>
  
    
  
  
  
</div>

</div>






</div>

</div>


</body>
</html>
