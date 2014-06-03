<%@ page language="java" import="java.util.*,java.sql.*,javax.sql.*,javax.servlet.*,javax.servlet.http.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Welcome to Profile Page !!!</title>
    
	<style>
	
	.st1
	{
	color:blue;
	}
	.st2
	{
	color:red;
	}
	
	.status
{
    width:600px;
    height:100px;
    font-size:14pt;
}

.update{
width:80px;
height:30px;
}
	
	.scheme1 {
 background-color: silver;
}
	
	</style>
  </head>
  
  <body class="scheme1">
  <% HttpSession sprofile=request.getSession(true); 
  String uname=(String)sprofile.getAttribute("username");
   %>
  <table border="3" width="100%" height="100%">
  
  <tr>
  <td width="200"><td>
  <td class="st2">Welcome to my Twitter</td>
  <td width="150">Welcome  <%= uname %> </td>
  <td width="100" align=right> <a href="profile.jsp"><b>Home</b></a>||</td>
  <td width="100" align=right> <a href="viewprofile.jsp"><b>Profile</b></a>||</td>
  <td width="100" align=right> <a href="logout"><b>Signout</b></a>||</td>
  <td></td>
  </tr> 
  
  <tr>
  <td rowspan="3"><br><br><br><a href="tweet.jsp"><b>Tweets<b></a>
  <br><br>
  <a href="following.jsp"><b>Following<b></a><br><br>
  <a href="followers.jsp"><b>Followers<b></a><br><br>
  <a href="follow.jsp"><b>Follow<b></a>
  </td>
  <td colspan="6" align=left><br><br><br><br><b>Whats on your mind ???</b><br><br>
  <form method="get" action="update">
  <input type="text" name="status" class="status"/>
 <input type="submit" name="submit" value="Update" class="update" />
  </form>
  </td>
  </tr>
  
  <tr>
  <td></td>
  <td colspan="5"><h3><b> Tweets: </b></h3> </td></tr><tr><td></td><td colspan="5">
  <br><br><br><br> 
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
				ResultSet rs = stmt.executeQuery("select message,created from tweet where userid=\""+uname+"\"order by created DESC");
				
				%>
				
				
				<%
				while(rs.next())
				{
					
					  out.print(uname+" " +":");
					 out.println(rs.getString(1));
				 out.println(rs.getString(2));
				  out.println("<br><br>"); 
				 
				 }
				
				}
				
			catch(Exception e)
		{}
  
   %> 
  </td>
  </tr>
  <tr><td><td>
  <td colspan="5"><h3>Tweets by others</h3></td>
  </tr>
  
  <tr><td></td>
  <td colspan="5">
  
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
  
  %></td>  
  </table>
  
  </body>
</html>
