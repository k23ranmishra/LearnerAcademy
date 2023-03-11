<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>


<HTML>
<head>
<title>Master Teacher List</title>
</head>
<body>
<form method="POST" action="masterTeacherList.jsp">

      <%
		String teacher_id=request.getParameter("teacher_id");
  	    String teacher_name=request.getParameter("teacher_name");
		String subject_name=request.getParameter("subject_name");
		
	  try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "RANJEET", "RANJEET");
			Statement statement = connection.createStatement();
			String command = "INSERT into MASTER_TEACHER(TEACHER_ID, TEACHER_NAME,SUBJECT_NAME) values('"+teacher_id+"','"+teacher_name+"','"+subject_name+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
	  
	  RequestDispatcher view = request.getRequestDispatcher("masterTeacherList.jsp");
		view.forward(request , response);
	  
		%>
 
</FORM>
</body> 
</html>