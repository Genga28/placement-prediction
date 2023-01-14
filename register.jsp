<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Student form</h1>
    <%
        String uname=request.getParameter("txtName");
        String age=request.getParameter("txtAge");
        String gender = request.getParameter("txtGender");
        String address = request.getParameter("txtAddress");
        String city = request.getParameter("txtCity");
        String pincode=request.getParameter("txtPincode");
        String ctry = request.getParameter("txtCon");
        String phno = request.getParameter("txtPh");
        String inst=request.getParameter("txtInst");
        String degree=request.getParameter("txtDegree");
        String course=request.getParameter("txtCourse");
        String cgpa=request.getParameter("txtCgpa");
        String company=request.getParameter("txtCompany");
     
        try{	
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/erplab","root","");
    PreparedStatement stmt = con.prepareStatement("insert into register values (?,?,?,?,?,?,?,?,?,?,?,?,?)");
    stmt.setString(1, uname);    stmt.setString(2, age);
    stmt.setString(3, gender);    stmt.setString(4, address);  
    stmt.setString(5, city);      stmt.setString(6, pincode);
    stmt.setString(7, ctry);      stmt.setString(8, phno);
    stmt.setString(9, inst);      stmt.setString(10, degree);
    stmt.setString(11, course);   stmt.setString(12, cgpa);
    stmt.setString(13, company);
    int row = stmt.executeUpdate();
    if(row==1) { 
    	out.println("Registration Successful");
        out.println("<br><br><a href='mainpage.html'><button>Home Page</button></a><br>");
        }
    else {    
        out.println("Registration Fail!!!!");
        %>
         <jsp:include page="register.html" ></jsp:include>
        <%
    
        }
    }catch(Exception e){out.println(e);}
        %>


</body>
</html>