<%-- 
    Document   : hosi
    Created on : 17-Oct-2022, 12:32:55 pm
    Author     : kgeng
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

String user=request.getParameter("user");
String pass=request.getParameter("pass");
String email=request.getParameter("email");
try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/erplab", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into student_details(username,pass,email)values('"+user+"','"+pass+"','"+email+"')");
            %>
            <jsp:include page="login.html" flush="true"/>
            <%
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
    </body>
</html>



