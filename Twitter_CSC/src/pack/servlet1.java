package pack;


import java.io.IOException;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.PrintWriter;
import java.sql.*;
import javax.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public final class servlet1 extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public servlet1() {
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
		
		String uname=request.getParameter("a");
		String pwd=request.getParameter("b");
		int flag=0;
	
		
		try{
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				HttpSession session=request.getSession(true);
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from person");
				ResultSetMetaData rsmd = rs.getMetaData();
				int count=rsmd.getColumnCount();
				
				for(int i=0;i<count;i++)
				{
				while(rs.next())
				{
					
					if( pwd.equals(rs.getString(2)) && uname.equals(rs.getString(1))){
			                    
						session.setAttribute("username",uname);
			                    flag=1;
			                }else{
			                	session.setAttribute("status","USERNAME OR PASSWORD INCORRECT");			                    
			                }	
				}
				}
				
				if(flag==1)
				{		 
	                    rd=request.getRequestDispatcher("profile.jsp");
	                    rd.forward(request,response);
	                    out.println("Correct Match");			
				}
				else
				{
				out.println("Incorrect Match");
              // rd=request.getRequestDispatcher("./Error.jsp");
               response.sendRedirect("page.html");
                out.println("Invalid Username and Password");
				}
				
								
			/*	while(rs.next())
				{
					
					 out.println("<html><body><table border='1' width='3'><tr><td>");	 
					 out.println(rs.getString(1));
					 out.println("</td><td>"); 
				 out.println(rs.getString(2));
				 out.println("</td></tr></table></body></table>");
				 }
				*/
				
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
