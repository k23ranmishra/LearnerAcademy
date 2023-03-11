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
<form method="POST" action="AssignClassesTeacher.jsp">

      <%
		String subject_name=request.getParameter("subjectli");
		String class_name=request.getParameter("classli");
		
	  try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "RANJEET", "RANJEET");
			Statement statement = connection.createStatement();
			String command = "INSERT into CLASS_SUBJECT_ASSIGNED(CLASS_NAME,SUBJECT_NAME) values('"+class_name+"','"+subject_name+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
	  
	  RequestDispatcher view = request.getRequestDispatcher("AssignClassesSubject.jsp");
		view.forward(request , response);
	  
		%>
 
</FORM>
</body> 
</html>