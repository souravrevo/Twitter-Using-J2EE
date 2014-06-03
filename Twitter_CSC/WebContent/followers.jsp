<%@ page language="java" import="java.util.*,java.sql.*,javax.sql.*,javax.servlet.*,javax.servlet.http.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'followers.jsp' starting page</title>
    
	
  </head>
  
 <body bgcolor="silver">

<table border="1" width="100%" height="100%">
  <tr>
  <td align=right><a href="profile.jsp">Home</a> ||
  <a href="logout">Signout</a></td>
  </tr>

<tr>
<td align=center><h3>Your followers are :</h3></td>
</tr>

<tr>
<td align=left>
<% 
try{
			 out.println();
			 //Class.forName("com.mysql.jdbc.Driver");
				//Connection con =   DriverManager.getConnection("jdbc:mysql://localhost:3306/devinder","root","root");
					 
				ServletContext ctx=getServletContext();	
				
				HttpSession sprofile=request.getSession(true); 
  String uname=(String)sprofile.getAttribute("username");
		
				 
				
				String a=ctx.getInitParameter("Driver");
				 String b=ctx.getInitParameter("url");
				String c=ctx.getInitParameter("username");
				String d=ctx.getInitParameter("password");
					 
					 Class.forName(a);
					 Connection con =   DriverManager.getConnection(b,c,d);
					
				
				 
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select distinct followinfid from following where followid=\""+uname+"\"");
				
				int i=1;
				
					while(rs.next())
				{
					
					  out.println("<h4>");
					  out.print(i+"."+"   ");
					 out.println(rs.getString(1));
			 		out.println("</h4><br>");
				 i++;
				 }
				
				}
				
			catch(Exception e)
		{}


 %>
</td></tr>

  </body>
</html>
