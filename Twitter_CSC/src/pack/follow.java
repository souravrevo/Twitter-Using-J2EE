package pack;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class follow extends HttpServlet {

	public follow() {
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
		
		out.println("In follow servlet !!!");
		HttpSession session=request.getSession(true);
		
		String uname=(String)session.getAttribute("username");
		
		try{
			
			String a=ctx.getInitParameter("Driver");
			 String b=ctx.getInitParameter("url");
			String c=ctx.getInitParameter("username");
			String d=ctx.getInitParameter("password");
				 
				 Class.forName(a);
				 Connection con =   DriverManager.getConnection(b,c,d);
				
				 PreparedStatement stmt = con.prepareStatement("INSERT INTO following VALUES (?,?)");
				 
				 stmt.setString(1,uname);
				 stmt.setString(2,followid);
				 int ii = stmt.executeUpdate();
			 
				 System.out.println(ii);
				   
				   if(ii==1)
				   {
					   response.sendRedirect("follow.jsp");
					   System.out.println("Successfully Followed");
					   
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
