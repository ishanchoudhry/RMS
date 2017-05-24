

import java.io.IOException;
import java.util.ArrayList;
import java.util.GregorianCalendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.BookingDetails;
import Bean.RegistrationDetails;
import Bean.RouteDetails;
import Bean.StationDetails;
import Bean.TrainDetails;
import DB.DBModel;

/**
 * Servlet implementation class userController
 */
@WebServlet("/userController")
public class userController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String strCheck = request.getParameter("id");
		DBModel db = new DBModel();
		
		if(strCheck.equals("register"))
		{
			String uname = request.getParameter("username");
			String password = request.getParameter("password");
			String security = request.getParameter("security");
			String answer = request.getParameter("answer");
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String gender = request.getParameter("gender");
			String marital = request.getParameter("marital");
			String dob = request.getParameter("date");
			String occupation = request.getParameter("occupation");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");
			String nationality = request.getParameter("nationality");
			String address = request.getParameter("address");
			String country = request.getParameter("country");
			String state = request.getParameter("state");
			String city = request.getParameter("city");
			String pin = request.getParameter("pin");
			
			RegistrationDetails reg = new RegistrationDetails();
			reg.setUsername(uname);
			reg.setPassword(password);
			reg.setSecurity(security);
			reg.setAnswer(answer);
			reg.setFirstname(fname);
			reg.setLastname(lname);
			reg.setGender(gender);
			reg.setMarital(marital);
			reg.setDob(dob);
			reg.setOccupation(occupation);
			reg.setEmail(email);
			reg.setMobile(mobile);
			reg.setNationality(nationality);
			reg.setAddress(address);
			reg.setCountry(country);
			reg.setState(state);
			reg.setCity(city);
			reg.setPin(pin);
			
			int i = db.registerUser(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		else if (strCheck.equals("login"))
		{
			String strUser = request.getParameter("userid");
			String strPassword = request.getParameter("pwd");
			String i=db.checkLogin(strUser, strPassword);
			if(!i.equals("0"))
			{
				HttpSession session = request.getSession(true);
				session.setAttribute("userSession", strUser);
				session.setAttribute("User", i);
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("validate", i);
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}
		}
		
		
		else if (strCheck.equals("adminlogin"))
		{
			String i="0";
			String strUser = request.getParameter("userid");
			String strPassword = request.getParameter("pwd");
			if(strUser.equalsIgnoreCase("admin")&&strPassword.equalsIgnoreCase("admin"))
			{
				i="1";
			}
			if(!i.equals("0"))
			{
				RequestDispatcher rd = request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				request.setAttribute("validate", i);
				RequestDispatcher rd = request.getRequestDispatcher("adminlogin.jsp");
				rd.forward(request, response);
			}
		}
		
		
		
		
		else if (strCheck.equals("search"))
		{
			String src = request.getParameter("from");
			String dst = request.getParameter("to");
			String source = (src.substring(src.lastIndexOf("-")+1));
			String destination = (dst.substring(dst.lastIndexOf("-")+1));
			String date = request.getParameter("date");
			String day = request.getParameter("day");
			db = new DBModel();
		    ArrayList al=db.getTrains(source,destination,day);
			if(al.size()>=0)
			{
				HttpSession session = request.getSession(false);
				request.setAttribute("train", al);
				request.setAttribute("from", src);
				request.setAttribute("to", dst);
				request.setAttribute("date", date);
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
		}	
		else if (strCheck.equals("avl"))
		{
			String clas = request.getParameter("clas");
			String trainno = request.getParameter("no");
			String date = request.getParameter("date");
			String dst = request.getParameter("dst");
			db = new DBModel();
		    ArrayList al=db.getAvailability(trainno,clas,date);
			if(al.size()>=0)
			{
				HttpSession session = request.getSession(false);
				ArrayList train = (ArrayList) session.getAttribute("train");
				String from = session.getAttribute("from").toString();
				String to = session.getAttribute("to").toString();
				request.setAttribute("train", train);
				request.setAttribute("seats", al);
				request.setAttribute("date", date);
				request.setAttribute("from", from);
				request.setAttribute("to", to);
				request.setAttribute("dst", dst);
				RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
				rd.forward(request, response);
			}
		}	
		else if (strCheck.equals("book"))
		{
			String clas = request.getParameter("clas");
			String trainno = request.getParameter("trainno");
			String date = request.getParameter("date");
			String status = request.getParameter("status");
			String temp="";
			String tktsts="";
			String seat = request.getParameter("seat");
			String seatno = "";
			if(status.equalsIgnoreCase("Available"))
			{
				temp="1";
				tktsts="Confirmed";
				seatno=clas+seat;
			}
			else if(status.equalsIgnoreCase("Wait List"))
			{
				temp="2";
				tktsts="WaitListed";
				seatno="";
			}
			
			String fare = request.getParameter("fare");
			HttpSession session = request.getSession(false);
			String source = session.getAttribute("from").toString();
			String src = (source.substring(source.lastIndexOf("-")+1));
			String destination = session.getAttribute("to").toString();
			String dst = (destination.substring(destination.lastIndexOf("-")+1));
			String user = session.getAttribute("userSession").toString();
			String time = session.getAttribute("time").toString();
			
			GregorianCalendar gregorianCalendar=new GregorianCalendar();            
			String month=String.valueOf(gregorianCalendar.get(GregorianCalendar.MONTH)+1);            
			String day=String.valueOf(gregorianCalendar.get(GregorianCalendar.DAY_OF_MONTH));
			String year=String.valueOf(gregorianCalendar.get(GregorianCalendar.YEAR));
			String curdate=year+'-'+month+'-'+day;
			String pnr = trainno+month+day+temp;
			String name="";
			String age="";
			String gender="";
			String mobile="";
			db = new DBModel();
		    ArrayList al=db.getUserDetails(user);
			if(al.size()>=0)
			{
				for(int i=0;i<al.size();i++)
				{
					RegistrationDetails rd = (RegistrationDetails)al.get(i);
					name = rd.getFirstname();
					String dob = rd.getDob().substring(0, 4);
					age = Integer.toString((Integer.parseInt(year)-Integer.parseInt(dob)));
					gender = rd.getGender();
					mobile = rd.getMobile();
				}
			}
			BookingDetails bd = new BookingDetails();
			bd.setUsername(user);
			bd.setPnr(pnr);
			bd.setTrainno(trainno);
			bd.setSeatno(seatno);
			bd.setSrc(src);
			bd.setDst(dst);
			bd.setDoj(date);
			bd.setToj(time);
			bd.setClas(clas);
			bd.setFare(fare);
			bd.setStatus(tktsts);
			bd.setBookingdate(curdate);
			bd.setName(name);
			bd.setAge(age);
			bd.setGender(gender);
			bd.setMobile(mobile);
			
			int i = db.book(bd);
			if(i>0)
			{
				session = request.getSession(false);
				String user1 = session.getAttribute("User").toString();
				session.setAttribute("user", user1);
				RequestDispatcher rd=request.getRequestDispatcher("book.jsp");
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Error");
			}
		}	
		
		
		else if (strCheck.equals("check"))
		{
			String pnr = request.getParameter("pnr");
			db = new DBModel();
		    ArrayList al=db.getBookings(pnr);
			if(al.size()>=0)
			{
				HttpSession session = request.getSession(false);
				request.setAttribute("booking", al);
				RequestDispatcher rd = request.getRequestDispatcher("checkpnr.jsp");
				rd.forward(request, response);
			}
		}	
		
		
		else if (strCheck.equals("check1"))
		{
			String pnr = request.getParameter("pnr");
			db = new DBModel();
		    ArrayList al=db.getBookings(pnr);
			if(al.size()>=0)
			{
				HttpSession session = request.getSession(false);
				request.setAttribute("booking", al);
				RequestDispatcher rd = request.getRequestDispatcher("cancel.jsp");
				rd.forward(request, response);
			}
		}	
		
		
		
		else if (strCheck.equals("schedule"))
		{
			String trainno = request.getParameter("no");
			db = new DBModel();
		    ArrayList al=db.getTrainRoute(trainno);
			if(al.size()>=0)
			{
				HttpSession session = request.getSession(false);
				request.setAttribute("train", al);
				RequestDispatcher rd = request.getRequestDispatcher("trainschedule.jsp");
				rd.forward(request, response);
			}
		}	
		
		
		
		else if (strCheck.equals("cancel"))
		{
			String pnr = request.getParameter("pnr");
			String trainno = request.getParameter("trainno");
			String date = request.getParameter("date");
			String clas = request.getParameter("clas");
			String seatno = request.getParameter("seatno");
			String status = request.getParameter("status");
			db = new DBModel();
		    int i=db.updatePnr(pnr,trainno,date,clas,seatno,status);
			if(i>0)
			{
				HttpSession session = request.getSession(false);
				RequestDispatcher rd = request.getRequestDispatcher("cancelled.jsp");
				rd.forward(request, response);
			}
		}	
		
		
		
		else if(strCheck.equals("addtrain"))
		{
			String monday="0";
			String tuesday="0";
			String wednesday="0";
			String thursday="0";
			String friday="0";
			String saturday="0";
			String sunday="0";
			String trainno = request.getParameter("trainno");
			String trainname = request.getParameter("trainname");
			String traintype = request.getParameter("traintype");
			String monday1 = request.getParameter("monday");
			if(monday1!=null)
			monday="1";
			String tuesday1 = request.getParameter("tuesday");
			if(tuesday1!=null)
				tuesday="1";
			String wednesday1 = request.getParameter("wednesday");
			if(wednesday1!=null)
				wednesday="1";
			String thursday1 = request.getParameter("thursday");
			if(thursday1!=null)
				thursday="1";
			String friday1 = request.getParameter("friday");
			if(friday1!=null)
				friday="1";
			String saturday1 = request.getParameter("saturday");
			if(saturday1!=null)
				saturday="1";
			String sunday1 = request.getParameter("sunday");
			if(sunday1!=null)
				sunday="1";
			String sseats = request.getParameter("sleeper");
			String a3seats = request.getParameter("3ac");
			String a2seats = request.getParameter("2ac");
			String a1seats = request.getParameter("1ac");
			String slfare = request.getParameter("slfare");
			String a3fare = request.getParameter("3acfare");
			String a2fare = request.getParameter("2acfare");
			String a1fare = request.getParameter("1acfare");
			
			TrainDetails reg = new TrainDetails();
			reg.setTrainno(trainno);
			reg.setTrainname(trainname);
			reg.setTraintype(traintype);
			reg.setMonday(monday);
			reg.setTuesday(tuesday);
			reg.setWednesday(wednesday);
			reg.setThursday(thursday);
			reg.setFriday(friday);
			reg.setSaturday(saturday);
			reg.setSunday(sunday);
			reg.setSl(sseats);
			reg.setA1(a1seats);
			reg.setA2(a2seats);
			reg.setA3(a3seats);
			reg.setSlfare(slfare);
			reg.setA1fare(a1fare);
			reg.setA2fare(a2fare);
			reg.setA3fare(a3fare);
			
			int i = db.addTrain(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		
		else if(strCheck.equals("addstation"))
		{
			String stationcode = request.getParameter("stnid");
			String stationname = request.getParameter("stnname");
			
			StationDetails reg = new StationDetails();
			reg.setStationcode(stationcode);
			reg.setStationname(stationname);
					
			int i = db.addStation(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		
		else if(strCheck.equals("deletestn"))
		{
			String stationcode = request.getParameter("stationid");
			
			StationDetails reg = new StationDetails();
			reg.setStationcode(stationcode);
					
			int i = db.deleteStation(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		else if(strCheck.equals("addroute"))
		{
			String trainno = request.getParameter("trainno");
			String routeno = request.getParameter("routeno");
			String station = request.getParameter("station");
			String arrival = request.getParameter("arrival");
			String departure = request.getParameter("departure");
			String distance = request.getParameter("distance");
			
			RouteDetails reg = new RouteDetails();
			reg.setTrainno(trainno);
			reg.setRouteno(routeno);
			reg.setStation(station);
			reg.setArrival(arrival);
			reg.setDeparture(departure);
			reg.setDistance(distance);
			
			int i = db.addRoute(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		
		else if(strCheck.equals("deleteroute"))
		{
			String trainno = request.getParameter("trainno");
			String routeno = request.getParameter("routeno");
			
			RouteDetails reg = new RouteDetails();
			reg.setTrainno(trainno);
			reg.setRouteno(routeno);
			
			int i = db.deleteRoute(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		else if(strCheck.equals("deletetrain"))
		{
			String trainno = request.getParameter("trainno");
			
			TrainDetails reg = new TrainDetails();
			reg.setTrainno(trainno);
			
			int i = db.deleteTrain(reg);
			if(i>0)
			{
				RequestDispatcher rd=request.getRequestDispatcher("adminpanel.jsp");
				rd.forward(request, response);
			}
			else
			{
				
			}
		}
		
		
		else if(strCheck.equals("logout"))
		{
			HttpSession session=request.getSession(true);
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
