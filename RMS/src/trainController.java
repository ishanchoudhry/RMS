

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.DBModel;

/**
 * Servlet implementation class trainController
 */
@WebServlet("/trainController")
public class trainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public trainController() {
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
		
	    if (strCheck.equals("search"))
		{
			
			String src = request.getParameter("from");
			String dst = request.getParameter("to");
			String source = (src.substring(src.lastIndexOf("-")+1));
			String destination = (dst.substring(dst.lastIndexOf("-")+1));
			//String date = request.getParameter("date");
			String day = request.getParameter("day");
			db = new DBModel();
		    ArrayList al=db.getTrains(source,destination,day);
			if(!al.isEmpty())
			{
				HttpSession session=request.getSession(true);
				request.setAttribute("train", al);
				response.sendRedirect("home.jsp");
			}
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
