package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Bean.BookingDetails;
import Bean.RegistrationDetails;
import Bean.RouteDetails;
import Bean.StationDetails;
import Bean.TrainDetails;

public class DBModel {
	Connection con;
	PreparedStatement ps,ps1;
	ResultSet rs,rs1;
		public DBModel() {
				String url = "jdbc:mysql://localhost:3306/"; 
				String dbName = "RMS";
				String driver = "com.mysql.jdbc.Driver";
				String userName = "root";
				String password = "root";
				try { 
					Class.forName(driver).newInstance(); 
					con = DriverManager.getConnection(url+dbName,userName,password);
					} catch (Exception e) {System.out.println(e);}
		}
		
		public String checkLogin(String strUser, String strPassword)
		{
			String i="0";
			try
			{
				ps=con.prepareStatement("Select * from userdetails where username=? and password=?");
				ps.setString(1, strUser);
				ps.setString(2, strPassword);
				rs=ps.executeQuery();
				if (rs.next())
				{
					i=rs.getString("firstname")+" "+rs.getString("lastname");
				}
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		public int registerUser(RegistrationDetails rd)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("select * from citydetails where city=?");
				ps.setString(1,rd.getCity());
				rs=ps.executeQuery();
				if(rs.next())
				{
				ps=con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				ps.setString(1,rd.getUsername());
				ps.setString(2,rd.getPassword());
				ps.setString(3,rd.getSecurity());
				ps.setString(4,rd.getAnswer());
				ps.setString(5,rd.getFirstname());
				ps.setString(6,rd.getLastname());
				ps.setString(7,rd.getGender());
				ps.setString(8,rd.getMarital());
				ps.setString(9,rd.getDob());
				ps.setString(10,rd.getOccupation());
				ps.setString(11,rd.getEmail());
				ps.setString(12,rd.getMobile());
				ps.setString(13,rd.getNationality());
				ps.setString(14,rd.getAddress());
				ps.setString(15,rd.getCity());
				i=ps.executeUpdate();
				}
				else
				{
					ps=con.prepareStatement("insert into citydetails values(?,?,?,?)");
					ps.setString(1,rd.getCity());
					ps.setString(2,rd.getPin());
					ps.setString(3,rd.getState());
					ps.setString(4,rd.getCountry());
					int j=ps.executeUpdate();
					if(j>0)
					{
						ps=con.prepareStatement("insert into userdetails values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,rd.getUsername());
						ps.setString(2,rd.getPassword());
						ps.setString(3,rd.getSecurity());
						ps.setString(4,rd.getAnswer());
						ps.setString(5,rd.getFirstname());
						ps.setString(6,rd.getLastname());
						ps.setString(7,rd.getGender());
						ps.setString(8,rd.getMarital());
						ps.setString(9,rd.getDob());
						ps.setString(10,rd.getOccupation());
						ps.setString(11,rd.getEmail());
						ps.setString(12,rd.getMobile());
						ps.setString(13,rd.getNationality());
						ps.setString(14,rd.getAddress());
						ps.setString(15,rd.getCity());
						i=ps.executeUpdate();
					}
				}
			}catch(Exception e){System.out.println(e);}
			return i;
		}

		
		
		public int book(BookingDetails bd)
		{
			int i=0,j=0,x=0;
			try
			{
				ps1=con.prepareStatement("select count(*) from ticketbooking");
				rs1=ps1.executeQuery();
				while(rs1.next())
				{
					x=Integer.parseInt(rs1.getString(1))+1;
				}
				ps=con.prepareStatement("select * from passengerbooking where username=?");
				ps.setString(1,bd.getUsername());
				rs=ps.executeQuery();
				if(rs.next())
				{
					ps1=con.prepareStatement("insert into ticketbooking values(?,?,?,?,?,?,?,?,?,?,?,?)");
					ps1.setString(1,bd.getUsername());
					ps1.setString(2,bd.getPnr()+Integer.toString(x));
					ps1.setString(3,bd.getTrainno());
					ps1.setString(4,bd.getSeatno());
					ps1.setString(5,bd.getSrc());
					ps1.setString(6,bd.getDst());
					ps1.setString(7,bd.getDoj());
					ps1.setString(8,bd.getToj());
					ps1.setString(9,bd.getClas());
					ps1.setString(10,bd.getFare());
					ps1.setString(11,bd.getStatus());
					ps1.setString(12,bd.getBookingdate());
					i=ps1.executeUpdate();
					if(i>0)
					{
						if(bd.getStatus().equalsIgnoreCase("Confirmed"))
						{
							ps=con.prepareStatement("select seats from datewisetrain where trainno=? and date=? and class=?");
							ps.setString(1,bd.getTrainno());
							ps.setString(2,bd.getDoj());
							ps.setString(3,bd.getClas());
							rs=ps.executeQuery();
							while(rs.next())
							{
								int seats = Integer.parseInt(rs.getString(1));
								seats=seats-1;
								ps=con.prepareStatement("update datewisetrain set seats=? where trainno=? and date=? and class=?");
								ps.setString(1,Integer.toString(seats));
								ps.setString(2,bd.getTrainno());
								ps.setString(3,bd.getDoj());
								ps.setString(4,bd.getClas());
								ps.executeUpdate();
							}
						}
						else if(bd.getStatus().equalsIgnoreCase("WaitListed"))
						{
							ps=con.prepareStatement("select seats from datewisewaiting where trainno=? and date=? and class=?");
							ps.setString(1,bd.getTrainno());
							ps.setString(2,bd.getDoj());
							ps.setString(3,bd.getClas());
							rs=ps.executeQuery();
							while(rs.next())
							{
								int seats = Integer.parseInt(rs.getString(1));
								seats=seats-1;
								ps=con.prepareStatement("update datewisewaiting set seats=? where trainno=? and date=? and class=?");
								ps.setString(1,Integer.toString(seats));
								ps.setString(2,bd.getTrainno());
								ps.setString(3,bd.getDoj());
								ps.setString(4,bd.getClas());
								ps.executeUpdate();
							}
						}
					}
				}
				else
				{
					ps=con.prepareStatement("insert into passengerbooking values(?,?,?,?,?)");
					ps.setString(1,bd.getName());
					ps.setString(2,bd.getUsername());
					ps.setString(3,bd.getAge());
					ps.setString(4,bd.getGender());
					ps.setString(5,bd.getMobile());
					j=ps.executeUpdate();
					if(j>0)
					{
						ps=con.prepareStatement("insert into ticketbooking values(?,?,?,?,?,?,?,?,?,?,?,?)");
						ps.setString(1,bd.getUsername());
						ps.setString(2,bd.getPnr()+Integer.toString(x));
						ps.setString(3,bd.getTrainno());
						ps.setString(4,bd.getSeatno());
						ps.setString(5,bd.getSrc());
						ps.setString(6,bd.getDst());
						ps.setString(7,bd.getDoj());
						ps.setString(8,bd.getToj());
						ps.setString(9,bd.getClas());
						ps.setString(10,bd.getFare());
						ps.setString(11,bd.getStatus());
						ps.setString(12,bd.getBookingdate());
						i=ps.executeUpdate();
						if(i>0)
						{
							if(bd.getStatus().equalsIgnoreCase("Confirmed"))
							{
								ps=con.prepareStatement("select seats from datewisetrain where trainno=? and date=? and class=?");
								ps.setString(1,bd.getTrainno());
								ps.setString(2,bd.getDoj());
								ps.setString(3,bd.getClas());
								rs=ps.executeQuery();
								while(rs.next())
								{
									int seats = Integer.parseInt(rs.getString(1));
									seats=seats-1;
									ps=con.prepareStatement("update datewisetrain set seats=? where trainno=? and date=? and class=?");
									ps.setString(1,Integer.toString(seats));
									ps.setString(2,bd.getTrainno());
									ps.setString(3,bd.getDoj());
									ps.setString(4,bd.getClas());
									ps.executeUpdate();
								}
							}
							else if(bd.getStatus().equalsIgnoreCase("WaitListed"))
							{
								ps=con.prepareStatement("select seats from datewisewaiting where trainno=? and date=? and class=?");
								ps.setString(1,bd.getTrainno());
								ps.setString(2,bd.getDoj());
								ps.setString(3,bd.getClas());
								rs=ps.executeQuery();
								while(rs.next())
								{
									int seats = Integer.parseInt(rs.getString(1));
									seats=seats-1;
									ps=con.prepareStatement("update datewisewaiting set seats=? where trainno=? and date=? and class=?");
									ps.setString(1,Integer.toString(seats));
									ps.setString(2,bd.getTrainno());
									ps.setString(3,bd.getDoj());
									ps.setString(4,bd.getClas());
									ps.executeUpdate();
								}
							}
						}
					}
				}
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		
		public ArrayList getStations()
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from station");
				rs=ps.executeQuery();
				while(rs.next())
				{
					StationDetails station=new StationDetails();
					station.setStationcode(rs.getString(1));
					station.setStationname(rs.getString(2));
					al.add(station);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		public ArrayList getTrainDetails()
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from traindetails");
				rs=ps.executeQuery();
				while(rs.next())
				{
					TrainDetails td = new TrainDetails();
					td.setTrainno(rs.getString(1));
					al.add(td);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getTrainRoute(String no)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from route where trainno=? order by routeid; ");
				ps.setString(1, no);
				rs=ps.executeQuery();
				while(rs.next())
				{
					TrainDetails td = new TrainDetails();
					td.setRouteno(rs.getString(2));
					td.setArrival(rs.getString(4));
					td.setDeparture(rs.getString(5));
					td.setSrc(rs.getString(6));
					td.setDistance(rs.getString(7));
					al.add(td);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		
		public ArrayList getUserDetails(String username)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select firstname,dob,gender,mobile from userdetails where username=?");
				ps.setString(1, username);
				rs=ps.executeQuery();
				while(rs.next())
				{
					RegistrationDetails reg=new RegistrationDetails();
					reg.setFirstname(rs.getString(1));
					reg.setDob(rs.getString(2));
					reg.setGender(rs.getString(3));
					reg.setMobile(rs.getString(4));
					al.add(reg);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getTrains(String source, String destination, String day)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("SELECT * FROM trains a INNER JOIN trains b ON a.routeno = b.routeno AND (a.distance<b.distance ) WHERE a.stn=? AND b.stn=? AND a."+day+"=1;");
				ps.setString(1, source);
				ps.setString(2, destination);
				rs=ps.executeQuery();
				while(rs.next())
				{
					TrainDetails train=new TrainDetails();
					train.setTrainno(rs.getString(1));
					train.setTrainname(rs.getString(2));
					train.setSrc(rs.getString(5));
					train.setDeparture(rs.getString(6));
					train.setDst(rs.getString(27));
					train.setArrival(rs.getString(26));
					train.setDistance(Integer.toString((Integer.parseInt(rs.getString(29))-Integer.parseInt(rs.getString(7)))));
					train.setMonday(rs.getString(8));
					train.setTuesday(rs.getString(9));
					train.setWednesday(rs.getString(10));
					train.setThursday(rs.getString(11));
					train.setFriday(rs.getString(12));
					train.setSaturday(rs.getString(13));
					train.setSunday(rs.getString(14));
					String a1="";
					String a2="";
					String a3="";
					String sl="";
					ps1=con.prepareStatement("SELECT class FROM trainseats WHERE trainno=?;");
					ps1.setString(1, rs.getString(1));
					rs1=ps1.executeQuery();
					while(rs1.next())
					{
						String cls=rs1.getString(1);
						if(cls.equalsIgnoreCase("1a"))
						a1="1A";
						else if(cls.equalsIgnoreCase("2a"))
							a2="2A";
							else if(cls.equalsIgnoreCase("3a"))
							a3="3A";
							else if(cls.equalsIgnoreCase("sl"))
							sl="SL";
					}
					train.setA1(a1);
					train.setA2(a2);
					train.setA3(a3);
					train.setSl(sl);
					al.add(train);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getAvailability(String trainno, String clas, String date)
		{
			ArrayList al=new ArrayList();
			String s="";
			try {
				ps=con.prepareStatement("select * from datewisetrain where trainno=? and date=? and class=?");
				ps.setString(1, trainno);
				ps.setString(2, date);
				ps.setString(3, clas);
				rs=ps.executeQuery();
				if(rs.next())
				{
					TrainDetails train=new TrainDetails();
					train.setTrainno(rs.getString(1));
					train.setCls(rs.getString(3).toUpperCase());
					if(rs.getString(3).equalsIgnoreCase("1a"))
					{
						train.setA1(rs.getString(4));
						s=rs.getString(4);
					}
					else if(rs.getString(3).equalsIgnoreCase("2a"))
					{
						train.setA2(rs.getString(4));
						s=rs.getString(4);
					}
					else if(rs.getString(3).equalsIgnoreCase("3a"))
					{
						train.setA3(rs.getString(4));
						s=rs.getString(4);
					}
					else if(rs.getString(3).equalsIgnoreCase("sl"))
					{
						train.setSl(rs.getString(4));
						s=rs.getString(4);
					}
					if(Integer.parseInt(s)>0)
					{
						s="Available";
						train.setStatus(s);
						ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
						ps1.setString(1, trainno);
						ps1.setString(2, clas);
						rs1=ps1.executeQuery();
						while(rs1.next())
						{
							String fare=rs1.getString(1);
							train.setFare(fare);
						}
						al.add(train);
					}
					else
					{
						ps=con.prepareStatement("select * from datewisewaiting where trainno=? and date=? and class=?");
						ps.setString(1, trainno);
						ps.setString(2, date);
						ps.setString(3, clas);
						rs1=ps.executeQuery();
						if(rs1.next())
						{
							TrainDetails train1=new TrainDetails();
							train1.setTrainno(rs1.getString(1));
							train1.setCls(rs1.getString(3).toUpperCase());
							if(rs1.getString(3).equalsIgnoreCase("1a"))
							{
								train1.setA1(rs1.getString(4));
								s=rs1.getString(4);
							}
							else if(rs1.getString(3).equalsIgnoreCase("2a"))
							{
								train1.setA2(rs1.getString(4));
								s=rs1.getString(4);
							}
							else if(rs1.getString(3).equalsIgnoreCase("3a"))
							{
								train1.setA3(rs1.getString(4));
								s=rs1.getString(4);
							}
							else if(rs1.getString(3).equalsIgnoreCase("sl"))
							{
								train1.setSl(rs1.getString(4));
								s=rs1.getString(4);
							}
							if(Integer.parseInt(s)>0)
							{
								s="Wait List";
								train1.setStatus(s);
								ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
								ps1.setString(1, trainno);
								ps1.setString(2, clas);
								rs1=ps1.executeQuery();
								while(rs1.next())
								{
									String fare=rs1.getString(1);
									train1.setFare(fare);
								}
								al.add(train1);
							}
							else
							{
								s="Not Available";
								train1.setStatus(s);
								ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
								ps1.setString(1, trainno);
								ps1.setString(2, clas);
								rs1=ps1.executeQuery();
								while(rs1.next())
								{
									String fare=rs1.getString(1);
									train1.setFare(fare);
								}
								al.add(train1);
							}
						}
						else
						{
							ps=con.prepareStatement("INSERT INTO datewisewaiting (trainno,date,class,seats) values(?,?,?,(SELECT seats FROM trainseats where trainno=? and class=?));");
							ps.setString(1, trainno);
							ps.setString(2, date);
							ps.setString(3, clas);
							ps.setString(4, trainno);
							ps.setString(5, clas);
							int i=ps.executeUpdate();
							if(i>0)
							{
								ps=con.prepareStatement("select * from datewisewaiting where trainno=? and date=? and class=?");
								ps.setString(1, trainno);
								ps.setString(2, date);
								ps.setString(3, clas);
								rs1=ps.executeQuery();
								if(rs1.next())
								{
									TrainDetails train1=new TrainDetails();
									train1.setTrainno(rs1.getString(1));
									train1.setCls(rs1.getString(3).toUpperCase());
									if(rs1.getString(3).equalsIgnoreCase("1a"))
									{
										train1.setA1(rs1.getString(4));
										s=rs1.getString(4);
									}
									else if(rs1.getString(3).equalsIgnoreCase("2a"))
									{
										train1.setA2(rs1.getString(4));
										s=rs1.getString(4);
									}
									else if(rs1.getString(3).equalsIgnoreCase("3a"))
									{
										train1.setA3(rs1.getString(4));
										s=rs1.getString(4);
									}
									else if(rs1.getString(3).equalsIgnoreCase("sl"))
									{
										train1.setSl(rs1.getString(4));
										s=rs1.getString(4);
									}
									if(Integer.parseInt(s)>0)
									{
										s="Wait List";
										train1.setStatus(s);
										ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
										ps1.setString(1, trainno);
										ps1.setString(2, clas);
										rs1=ps1.executeQuery();
										while(rs1.next())
										{
											String fare=rs1.getString(1);
											train1.setFare(fare);
										}
										al.add(train1);
									}
									else
									{
										s="Not Available";
										train1.setStatus(s);
										ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
										ps1.setString(1, trainno);
										ps1.setString(2, clas);
										rs1=ps1.executeQuery();
										while(rs1.next())
										{
											String fare=rs1.getString(1);
											train1.setFare(fare);
										}
										al.add(train1);
									}
								}
							}
						}
					}
				}
				else
				{
					ps=con.prepareStatement("INSERT INTO datewisetrain (trainno,date,class,seats) values(?,?,?,(SELECT seats FROM trainseats where trainno=? and class=?));");
					ps.setString(1, trainno);
					ps.setString(2, date);
					ps.setString(3, clas);
					ps.setString(4, trainno);
					ps.setString(5, clas);
					int i=ps.executeUpdate();
					if(i>0)
					{
						ps=con.prepareStatement("select * from datewisetrain where trainno=? and date=? and class=?");
						ps.setString(1, trainno);
						ps.setString(2, date);
						ps.setString(3, clas);
						rs=ps.executeQuery();
						if(rs.next())
						{
							TrainDetails train=new TrainDetails();
							train.setTrainno(rs.getString(1));
							train.setCls(rs.getString(3).toUpperCase());
							if(rs.getString(3).equalsIgnoreCase("1a"))
							{
								train.setA1(rs.getString(4));
								s=rs.getString(4);
							}
							else if(rs.getString(3).equalsIgnoreCase("2a"))
							{
								train.setA2(rs.getString(4));
								s=rs.getString(4);
							}
							else if(rs.getString(3).equalsIgnoreCase("3a"))
							{
								train.setA3(rs.getString(4));
								s=rs.getString(4);
							}
							else if(rs.getString(3).equalsIgnoreCase("sl"))
							{
								train.setSl(rs.getString(4));
								s=rs.getString(4);
							}
							if(Integer.parseInt(s)>0)
							{
								s="Available";
								train.setStatus(s);
								ps1=con.prepareStatement("SELECT fare FROM trainseats where trainno=? and class=?");
								ps1.setString(1, trainno);
								ps1.setString(2, clas);
								rs1=ps1.executeQuery();
								while(rs1.next())
								{
									String fare=rs1.getString(1);
									train.setFare(fare);
								}
							al.add(train);
							}
					}
				}
			} 
		}catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		
		public ArrayList getReservations(String user)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from ticketbooking where username=?");
				ps.setString(1, user);
				rs=ps.executeQuery();
				while(rs.next())
				{
					BookingDetails bd=new BookingDetails();
					bd.setPnr(rs.getString(2));
					al.add(bd);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		public ArrayList getAllReservations(String user)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from ticketbooking where username=?");
				ps.setString(1, user);
				rs=ps.executeQuery();
				while(rs.next())
				{
					BookingDetails bd=new BookingDetails();
					bd.setPnr(rs.getString(2));
					bd.setTrainno(rs.getString(3));
					bd.setSeatno(rs.getString(4));
					bd.setSrc(rs.getString(5));
					bd.setDst(rs.getString(6));
					bd.setDoj(rs.getString(7));
					bd.setToj(rs.getString(8));
					bd.setClas(rs.getString(9));
					bd.setFare(rs.getString(10));
					bd.setStatus(rs.getString(11));
					bd.setBookingdate(rs.getString(12));
					al.add(bd);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getBookings(String pnr)
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from ticketbooking where pnr=?");
				ps.setString(1, pnr);
				rs=ps.executeQuery();
				while(rs.next())
				{
					BookingDetails bd=new BookingDetails();
					bd.setPnr(rs.getString(2));
					bd.setTrainno(rs.getString(3));
					bd.setSeatno(rs.getString(4));
					bd.setSrc(rs.getString(5));
					bd.setDst(rs.getString(6));
					bd.setDoj(rs.getString(7));
					bd.setClas(rs.getString(9));
					bd.setStatus(rs.getString(11));
					al.add(bd);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		
		
		public int updatePnr(String pnr,String trainno, String date, String clas, String seatno, String status)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("update ticketbooking set status='Cancelled',seatno='' where pnr=?");
				ps.setString(1,pnr);
				i=ps.executeUpdate();
				if(i>0)
				{
					if(status.equalsIgnoreCase("Confirmed"))
					{
					ps=con.prepareStatement("update ticketbooking set status='Confirmed',seatno=? where status='WaitListed' and doj=? Limit 1");
					ps.setString(1, seatno);
					ps.setString(2, date);
					if((ps.executeUpdate()>0))
					{
						ps=con.prepareStatement("select seats from datewisewaiting where trainno=? and date=? and class=?");
						ps.setString(1,trainno);
						ps.setString(2,date);
						ps.setString(3,clas);
						rs=ps.executeQuery();
						while(rs.next())
						{
							int seats = Integer.parseInt(rs.getString(1));
							seats=seats+1;
							ps=con.prepareStatement("update datewisewaiting set seats=? where trainno=? and date=? and class=?");
							ps.setString(1,Integer.toString(seats));
							ps.setString(2,trainno);
							ps.setString(3,date);
							ps.setString(4,clas);
							ps.executeUpdate();
						}
					}
					else
					{
						ps=con.prepareStatement("select seats from datewisetrain where trainno=? and date=? and class=?");
						ps.setString(1,trainno);
						ps.setString(2,date);
						ps.setString(3,clas);
						rs=ps.executeQuery();
						while(rs.next())
						{
							int seats = Integer.parseInt(rs.getString(1));
							seats=seats+1;
							ps=con.prepareStatement("update datewisetrain set seats=? where trainno=? and date=? and class=?");
							ps.setString(1,Integer.toString(seats));
							ps.setString(2,trainno);
							ps.setString(3,date);
							ps.setString(4,clas);
							ps.executeUpdate();
						}
					}
					}
					else
					{
						ps=con.prepareStatement("select seats from datewisewaiting where trainno=? and date=? and class=?");
						ps.setString(1,trainno);
						ps.setString(2,date);
						ps.setString(3,clas);
						rs=ps.executeQuery();
						while(rs.next())
						{
							int seats = Integer.parseInt(rs.getString(1));
							seats=seats+1;
							ps=con.prepareStatement("update datewisewaiting set seats=? where trainno=? and date=? and class=?");
							ps.setString(1,Integer.toString(seats));
							ps.setString(2,trainno);
							ps.setString(3,date);
							ps.setString(4,clas);
							ps.executeUpdate();
						}
					}
				}
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		
		
		public int addTrain(TrainDetails rd)
		{
			int i=0,j=0,k=0;
			try
			{
				ps=con.prepareStatement("insert into traindetails values(?,?,?)");
				ps.setString(1,rd.getTrainno());
				ps.setString(2,rd.getTrainname());
				ps.setString(3,rd.getTraintype());
				i=ps.executeUpdate();
				if(i>0)
				{
					ps=con.prepareStatement("select distinct day from days");
					rs=ps.executeQuery();
					while (rs.next())
					{
						ps=con.prepareStatement("insert into days values(?,?,?)");
						ps.setString(1,rd.getTrainno());
						ps.setString(2,rs.getString(1));
						if(rs.getString(1).equalsIgnoreCase("monday"))
						ps.setString(3,rd.getMonday());
						else if(rs.getString(1).equalsIgnoreCase("tuesday"))
						ps.setString(3,rd.getTuesday());
						else if(rs.getString(1).equalsIgnoreCase("wednesday"))
							ps.setString(3,rd.getWednesday());
						else if(rs.getString(1).equalsIgnoreCase("thursday"))
							ps.setString(3,rd.getThursday());
						else if(rs.getString(1).equalsIgnoreCase("friday"))
							ps.setString(3,rd.getFriday());
						else if(rs.getString(1).equalsIgnoreCase("saturday"))
							ps.setString(3,rd.getSaturday());
						else if(rs.getString(1).equalsIgnoreCase("sunday"))
							ps.setString(3,rd.getSunday());
						j=ps.executeUpdate();
					}
						if(j>0)
						{
							ps=con.prepareStatement("select distinct class from trainseats");
							rs=ps.executeQuery();
							while (rs.next())
							{
								ps=con.prepareStatement("insert into trainseats values(?,?,?,?)");
								ps.setString(1,rd.getTrainno());
								ps.setString(2,rs.getString(1));
								if(rs.getString(1).equalsIgnoreCase("1a")){
								ps.setString(3,rd.getA1());
								ps.setString(4,rd.getA1fare());}
								else if(rs.getString(1).equalsIgnoreCase("2a")){
									ps.setString(3,rd.getA2());
									ps.setString(4,rd.getA2fare());}
								else if(rs.getString(1).equalsIgnoreCase("3a")){
									ps.setString(3,rd.getA3());
									ps.setString(4,rd.getA3fare());}
								else if(rs.getString(1).equalsIgnoreCase("sl")){
									ps.setString(3,rd.getSl());
									ps.setString(4,rd.getSlfare());}
								k=ps.executeUpdate();
						}
					}
				}
			}catch(Exception e){System.out.println(e);}
			return k;
		}
		
		
		
		public int addStation(StationDetails rd)
		{
			int i=0,j=0,k=0;
			try
			{
				ps=con.prepareStatement("insert into station values(?,?)");
				ps.setString(1,rd.getStationcode());
				ps.setString(2,rd.getStationname());
				i=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		
		public int deleteStation(StationDetails rd)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("delete from station where stncode=?");
				ps.setString(1,rd.getStationcode());
				i=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		public int addRoute(RouteDetails rd)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("insert into route(routeno,trainno,arrival,departure,stn,distance) values(?,?,?,?,?,?)");
				ps.setString(1,rd.getRouteno());
				ps.setString(2,rd.getTrainno());
				ps.setString(3,rd.getArrival());
				ps.setString(4,rd.getDeparture());
				ps.setString(5,rd.getStation());
				ps.setString(6,rd.getDistance());
				i=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		public int deleteRoute(RouteDetails rd)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("delete from route where trainno=? and routeno=?");
				ps.setString(1,rd.getTrainno());
				ps.setString(2,rd.getRouteno());
				i=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		public int deleteTrain(TrainDetails rd)
		{
			int i=0;
			try
			{
				ps=con.prepareStatement("delete from traindetails where trainno=?");
				ps.setString(1,rd.getTrainno());
				i=ps.executeUpdate();
			}catch(Exception e){System.out.println(e);}
			return i;
		}
		
		
		public ArrayList getRouteDetails()
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select distinct routeno from route");
				rs=ps.executeQuery();
				while(rs.next())
				{
					RouteDetails td = new RouteDetails();
					td.setRouteno(rs.getString(1));
					al.add(td);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getUsers()
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from userdetails");
				rs=ps.executeQuery();
				while(rs.next())
				{
					RegistrationDetails td = new RegistrationDetails();
					td.setUsername(rs.getString(1));
					td.setPassword(rs.getString(2));
					td.setSecurity(rs.getString(3));
					td.setAnswer(rs.getString(4));
					td.setFirstname(rs.getString(5));
					td.setLastname(rs.getString(6));
					td.setGender(rs.getString(7));
					td.setMarital(rs.getString(8));
					td.setDob(rs.getString(9));
					td.setOccupation(rs.getString(10));
					td.setEmail(rs.getString(11));
					td.setMobile(rs.getString(12));
					td.setNationality(rs.getString(13));
					td.setCity(rs.getString(15));
					al.add(td);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
		
		
		public ArrayList getTrainDetails2()
		{
			ArrayList al=new ArrayList();
			try {
				ps=con.prepareStatement("select * from traindetails");
				rs=ps.executeQuery();
				while(rs.next())
				{
					TrainDetails td = new TrainDetails();
					td.setTrainno(rs.getString(1));
					td.setTrainname(rs.getString(2));
					td.setTraintype(rs.getString(3));
					al.add(td);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return al;
		}
		
	}
