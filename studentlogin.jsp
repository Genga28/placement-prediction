<%-- 
    Document   : ex9login
    Created on : 01-Sep-2022, 10:00:29 am
    Author     : kgeng
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page  contentType="text/html" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<% String user=request.getParameter("user");
	String pass=request.getParameter("pass");
	
	
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/erplab","root","");
			PreparedStatement stmt=con.prepareStatement("select * from student_details where username=?");
			stmt.setString(1,user);
			ResultSet rs=stmt.executeQuery();
			if(rs.next()){
				if(pass.equals(rs.getString(2))){
					out.println("Your data validation is completed and it's correct");						
				}
				else
				{
					out.println("Your data validation is completed and it's incorrect<br>");
					if(pass.equals(rs.getString(2))){
						out.println("Your password is correct<br>");
					}
						
				}
			}
		}catch(Exception e){ out.println(e); }
	%>
</body>
</html>
