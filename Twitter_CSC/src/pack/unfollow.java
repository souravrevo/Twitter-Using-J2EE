package pack;

import java.io.IOException;
import javax.sql.*;
import java.sql.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class unfollow extends HttpServlet {

		public unfollow() {
		super();
	}

	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(true);
	String option=(String)request.getParameter("option");
	String uname=(String)session.getAttribute("username");
	
	if(option.equals("Yes"))
	{
		
		try{
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				String followid=(String)ctx.getAttribute("uname");
		
				System.out.println(uname+","+followid);				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
			//	ResultSet rs = stmt.executeQuery("delete from following where followinfid=\""+uname+"\" and followid=\""+followid+"\"");
				
		//		PreparedStatement stmt = con.prepareStatement("delete from following where followinfid=\""+uname+"\" and followid=\""+followid+"\"");
				 
				int i = stmt.executeUpdate("delete from following where followinfid=\""+uname+"\" and followid=\""+followid+"\"");
				
				
			
				response.sendRedirect("follow.jsp");				
			
				System.out.println("Successfully Unfollowed !!!");
				
				}	
		
		catch(Exception e)
		{}
	}
	
	else if(option.equals("No"))
	{
		
		response.sendRedirect("follow.jsp");
		System.out.println("Not Unfollowed !!!");
	}
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	
	public void init() throws ServletException {
		// Put your code here
	}

}
