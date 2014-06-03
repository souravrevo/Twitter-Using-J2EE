<%@ page language="java" import="java.util.*,java.io.*,javax.servlet.*,javax.sql.*,java.sql.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'tweet.jsp' starting page</title>
    

	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
    <body bgcolor="silver">
  <table border="1" width="100%" height="100%">
  <tr>
  <td align=right><a href="profile.jsp">Home</a> ||
  <a href="logout">Signout</a></td>
  </tr>
  
  <tr>
  <td align=center> <h3>My Tweets</h3></td>
  </tr>
  
  <tr>
  <td>
  
  <%
  
 try{
 HttpSession sprofile=request.getSession(true); 
  String uname=(String)sprofile.getAttribute("username");
 
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
				ResultSet rs = stmt.executeQuery("select message,created from tweet where userid=\""+uname+"\"order by created DESC");
				 
  while(rs.next())
				{
					
					  out.print(uname+" " +":");
					 out.println(rs.getString(1));
				 out.println(rs.getString(2));
				  out.println("<br><br>"); 
				 
				 }
				
				}
				
			catch(Exception e)	{}
  
   %>
  
  </td></tr>
  
  <tr>
  <td align=center><h3>Tweets by others</h3></td>
  </tr>
  
  <tr>
  <td>
  <%
  
  	 try{
 HttpSession sprofile=request.getSession(true); 
  String uname=(String)sprofile.getAttribute("username");
 
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
				ResultSet rs = stmt.executeQuery("SELECT DISTINCT t.userid,t.message,t.created FROM following f, tweet t,person p WHERE f.followid=t.userid AND f.followinfid=\""+uname+"\" ORDER BY t.created DESC");
				 
  while(rs.next())
				{
					
					   out.print(rs.getString(1)+" " +":");
					 out.println(rs.getString(2));
				 out.println(rs.getString(3));
				  out.println("<br><br>"); 
				 
				 }
				
				}
				
			catch(Exception e)	{}				
  
  
    %>
    </td>
  </tr>
 
 
  </body>
</html>
