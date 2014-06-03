package pack;

import java.io.IOException;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.io.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public update() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher rd;
		PrintWriter out=response.getWriter();
		
		ServletContext ctx=getServletContext();	
		HttpSession statsession=request.getSession(true);
		String uname=(String)statsession.getAttribute("username");
		
		String status=(String)request.getParameter("status");
		
		long time = System.currentTimeMillis();
		java.sql.Timestamp timestamp = new java.sql.Timestamp(time);
	
		
		try{
			
			String a=ctx.getInitParameter("Driver");
			 String b=ctx.getInitParameter("url");
			String c=ctx.getInitParameter("username");
			String d=ctx.getInitParameter("password");
				 
				 Class.forName(a);
				 Connection con =   DriverManager.getConnection(b,c,d);
				
				 PreparedStatement stmt = con.prepareStatement("INSERT INTO tweet (userid,message,created) VALUES (?,?,?)");
				 

				 stmt.setString(1,uname);
				 stmt.setString(2,status);
				 stmt.setTimestamp(3,timestamp);
				
				   int ii = stmt.executeUpdate();
			 
				   
				   if(ii==1)
				   {
					   response.sendRedirect("profile.jsp");
					   System.out.println("Status successfully saved ");
					   
				   }
			
			
	 }
	 catch(Exception e)
	 {
		 
		 out.println("Not Entered into database");
	 }
		
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
