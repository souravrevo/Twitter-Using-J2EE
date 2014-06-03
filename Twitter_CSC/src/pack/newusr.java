package pack;

import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;
import java.io.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class newusr extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public newusr() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
PrintWriter pw=response.getWriter();

pw.println("Hello user");
		
		String username=(String)request.getParameter("username");
		String password=(String)request.getParameter("password");
		String fullname=(String)request.getParameter("fullname");
		String email=(String)request.getParameter("email");
		
		//GregorianCalendar cal = new GregorianCalendar(2007, 9 - 1, 23);
		long time = System.currentTimeMillis();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(time);
		int active=1;
		
		
		ServletContext ctx=getServletContext();	
		
 try{
		
		String a=ctx.getInitParameter("Driver");
		 String b=ctx.getInitParameter("url");
		String c=ctx.getInitParameter("username");
		String d=ctx.getInitParameter("password");
			 
			 Class.forName(a);
			 Connection con =   DriverManager.getConnection(b,c,d);
			
			 PreparedStatement stmt = con.prepareStatement("INSERT INTO person VALUES (?,?,?,?,?,?)");
			 

			 stmt.setString(1,username);
			 stmt.setString(2,password);
			 stmt.setString(3,fullname);
			 stmt.setString(4,email);
			 stmt.setTimestamp(5,timestamp);
			 stmt.setInt(6,active);
			 
			   int ii = stmt.executeUpdate();
		 
	
			   pw.println(ii);
			   
			   if(ii==1)
			   {
				   response.sendRedirect("page.html");
				   System.out.println("Account Successfully Created");
				   
			   }
		
		
 }
 catch(Exception e)
 {
	 
	 pw.println("Not Entered into database");
 }
	}


		
	

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
