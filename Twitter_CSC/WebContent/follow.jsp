<%@ page language="java" import="java.util.*,java.sql.*,javax.sql.*,javax.servlet.*,javax.servlet.http.*;" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <script type="text/javascript">
    
    function showall()
    {
   var a=document.getElementById("searchuser").value;
    
    document.location.href="/tweetr/showall"+"?a="+a;
    }
    
     function search1()
    {
    var a=document.getElementById("searchuser").value;
    
    document.location.href="/tweetr/search1"+"?a="+a;
    }
    
    </script>
   
  </head>
  
  <body bgcolor="silver">
   
   <table border="1" width="100%" height="100%">
  <tr><td></td>
  <td align=right width=1000px><a href="profile.jsp">Home</a> ||
  <a href="logout">Signout</a></td>
  </tr>
  
  <tr><td></td>
  
  <td align= width=1000px>
 
   <h3>Enter the user to be searched   :
   <form method="get" action="follow.jsp">
  <input type="text" name="searchuser"/>
  <input type="submit" value="Search"   />
  </form>

  </td>
  </tr>
  <tr>
  <td></td>
  <td width=1000px><% 
  
  String uname=(String)request.getParameter("searchuser");
  	String user=(String)session.getAttribute("username");
  
  try{
			 out.println();
			 RequestDispatcher rd;
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
			
				ResultSet rs = stmt.executeQuery("select userid,fullname from person where fullname=\""+uname+"\"or userid=\""+uname+"\" ");
				
				
		
					if(!(rs.next()))
			{
			out.println("No user found for current search !!!");
			}
			
			rs.previous();
				int i=1;
				
			
			if((uname==null)||(uname==""))
				{
				out.println("Please Enter a name to search for !!!");
				
				}
				
				
					while(rs.next())
				{
					
					  out.println("<h4>");
					  out.print(i+"."+"   ");
						 out.println(rs.getString(2));
						  out.println("<form method=\"get\" action=\"followprecheck\" ");
					//	  out.println("<input type=\"text\" name=\"text1\" value=\""+rs.getString(2)+"\" /");
						 	  out.println("</td><td width=100px> ");
						 	  
						 	  ctx.setAttribute("uname",rs.getString(1));	 
					
					 	 	  out.println("<input type=\"submit\" value=\"Follow\"/ >");
					 	 	  	  out.println("</form> ");
				
					    out.println("<a href=\"viewother.jsp\"> View Profile </a>");
					 
					 	 
			 		out.println("</h4><br>");
				 i++;
				   out.println("</td> ");
				 }
		
						
				
				
				
				
				}
			catch(Exception e)
		{}
  
   %></td>
  </tr>
  
  
   </table>
   
  </body>
</html>
