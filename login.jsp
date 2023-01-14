<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<body>

    <%
        String uname=request.getParameter("txtName");
        String pass = request.getParameter("txtPass");
       

        try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/erplab", "root", "");
    PreparedStatement stmt = conn.prepareStatement("select password from admin where username=?");
    stmt.setString(1, uname);  
    ResultSet rs = stmt.executeQuery();
    if(rs.next()){
        if(pass.equals(rs.getString(1)))
        {
        %>
        <jsp:include page="adminview.html" flush="true"/>
        <%
        }
        }
    else{
    out.println("<h1>User Name not exist !!!!!</h1>");
    %>
        <%
    }
        }catch(Exception e){out.println(e);}
   %>

</body>
</html>