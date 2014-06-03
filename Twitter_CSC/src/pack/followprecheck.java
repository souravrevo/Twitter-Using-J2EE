package pack;

import java.io.IOException;
import java.sql.*;
import javax.sql.*;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class followprecheck extends HttpServlet {

	
	public followprecheck() {
		super();
	}

	
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		ServletContext ctx=getServletContext();	
		
		String followid=(String)ctx.getAttribute("uname");
		
		HttpSession session=request.getSession(true);
		
		String uname=(String)session.getAttribute("username");
		
			
		try{
			
			String a=ctx.getInitParameter("Driver");
			 String b=ctx.getInitParameter("url");
			String c=ctx.getInitParameter("username");
			String d=ctx.getInitParameter("password");
				 
				 Class.forName(a);
				 Connection con =   DriverManager.getConnection(b,c,d);
				 
			 Statement stmt = con.createStatement();
					
			ResultSet rs = stmt.executeQuery("select p.fullname from person p where not exists(select * from following f where f.followinfid=\""+uname+"\" and f.followid=\""+followid+"\")");
				 
			 
			if(rs.next())
			{
				response.sendRedirect("follow");
				System.out.println("Not Already Following");	
			}
			else
			{
				out.println("<body bgcolor='silver'>");
				
		
				out.println("Already following this person.....");	
				System.out.println("Already Following");
				out.println("Want to unfollow him/her ?  ");
				
				out.println("<form method='get' action='unfollow'>");
				out.println("<input type='radio' name='option' value='Yes'> Yes </input>");
				out.println("<input type='radio' name='option' value='No'> No </input>");
				out.println("<input type='submit' name='submit' value='submit'></input>");
				out.println("</form>");
				
				out.println("</body>");
				
			}
			 
		
				 
			
		}
		catch(Exception e)
		{}
		
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		
	}

	public void init() throws ServletException {
		// Put your code here
	}

}
