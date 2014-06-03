<%@ page language="java" import="java.util.*,java.io.*,javax.servlet.*,javax.sql.*,java.sql.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
 <style>
 .scheme1
 {
 color:red;
 font-size:20px;
 font-weight:bold;
 }
 
  .scheme2
 {
 color:red;
 font-size:15px;
 font-weight:bold;
 }
 
</style>
  </head>
  
  <body bgcolor="silver">
    <%
    String uname=(String)session.getAttribute("username");
    
     try{
 
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
			//	Statement stmt = con.createStatement();
			//	ResultSet rs = stmt.executeQuery("select message,created from tweet where userid=\""+uname+"\"order by created DESC");
				 
				
				}
				
			catch(Exception e)	{}
    
     %>
    <table border="1" width="100%" height="100%">
  <tr>
  <td align=right width=1000px><a href="profile.jsp">Home</a> ||
  <a href="logout">Signout</a></td>
  </tr>
  
  <tr><td></td></tr>
  
  <tr><td width=1000px class="scheme1"> Name :
  <%
   try{
 
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select fullname from person where userid=\""+uname+"\"");
				 
				
				while(rs.next())
				{
				out.println(rs.getString(1));
				}
				
				}
				
			catch(Exception e)	{}
  
   %>
  
   </td></tr>
   <tr><td class="scheme1"> Email Id :
   
   <%
   
    try{
 
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select email from person where userid=\""+uname+"\"");
				 
				
				while(rs.next())
				{
				out.println(rs.getString(1));
				}
				
				}
				
			catch(Exception e)	{}
  
   
   
    %>
   
   </td></tr>
   
   <tr><td class="scheme1"> Joining Date :
   
   <%
   
    try{
 
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select joined from person where userid=\""+uname+"\"");
				 
				
				while(rs.next())
				{
				out.println(rs.getTimestamp(1));
				}
				
				}
				
			catch(Exception e)	{}
  
   
   
    %>
   
   </td></tr>
   
   <tr><td class="scheme2"> Tweets : <br><br><br>
   
   <%
   
   try{
 
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select message,created from tweet where userid=\""+uname+"\"");
				 
				int i=1;
				while(rs.next())
				{
				out.println(i+"."+" ");
				out.println(rs.getString(1));
				out.println(" ");
				out.println(rs.getString(2));
				}
				i++;
				}
				
			catch(Exception e)	{}
  
   
   
    %>
   
   </td></tr>
   
    </table>
  </body>
</html>
