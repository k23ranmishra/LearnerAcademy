<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<HTML>
<head>
<title>Assign Teacher</title>
</head>
<body>
<form method="POST" action="AssignTeacher.jsp">

      <%
		String teacher_name=request.getParameter("teacherli");
		String class_name=request.getParameter("classli");
		
	  try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "RANJEET", "RANJEET");
			Statement statement = connection.createStatement();
			String command = "INSERT into TEACHER_ASSIGNED(TEACHER_NAME,CLASS_NAME) values('"+teacher_name+"','"+class_name+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
	  
	  RequestDispatcher view = request.getRequestDispatcher("AssignTeacher.jsp");
		view.forward(request , response);
	  
		%>
 
</FORM>
</body> 
</html>