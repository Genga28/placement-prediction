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

String name=request.getParameter("name");
String company=request.getParameter("company");
String cgpa=request.getParameter("cgpa");
String lpa=request.getParameter("lpa");

try
{
         Class.forName("com.mysql.jdbc.Driver");
           Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/erplab", "root", "");
           Statement st=conn.createStatement();
           int i=st.executeUpdate("insert into placed(name,company,cgpa,lpa)values('"+name+"','"+company+"','"+cgpa+"','"+lpa+"')");
        out.println("<h3>Data is successfully inserted!");
        out.println("<br><br><a href='homepage.html'><button>Home Page</button></a><br>");
        }
        catch(Exception e)
        {
        System.out.print(e);
        e.printStackTrace();
        }
 %>
    </body>
</html>



