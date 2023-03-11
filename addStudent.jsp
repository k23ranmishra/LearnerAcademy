<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<HTML>
<head>
<title>Master Class List</title>
</head>
<body>
<form method="POST" action="masterStudentList.jsp">

      <%
		String student_id=request.getParameter("student_id");
  	    String student_name=request.getParameter("student_name");
		String class_assigned=request.getParameter("class_assigned");
		
	  try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "RANJEET", "RANJEET");
			Statement statement = connection.createStatement();
			String command = "INSERT into MASTER_STUDENT(STUDENT_ID, STUDENT_NAME,CLASS_ASSIGNED) values('"+student_id+"','"+student_name+"','"+class_assigned+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
	  
	  RequestDispatcher view = request.getRequestDispatcher("masterStudentList.jsp");
		view.forward(request , response);
	  
		%>
 
</FORM>
</body> 
</html>