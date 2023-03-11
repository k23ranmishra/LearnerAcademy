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
<form method="POST" action="masterClassList.jsp">

      <%
		String class_id=request.getParameter("class_id");
  	    String class_name=request.getParameter("class_name");
		String class_teacher_name=request.getParameter("class_teacher_name");
		
	  try
		{
			Connection connection = null;
            Class.forName("oracle.jdbc.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "RANJEET", "RANJEET");
			Statement statement = connection.createStatement();
			String command = "INSERT into MASTER_CLASSES(CLASS_ID, CLASS_NAME,CLASS_TEACHER_NAME) values('"+class_id+"','"+class_name+"','"+class_teacher_name+"')";
            statement.executeUpdate(command);
			out.println("Data is successfully inserted!");
		}
		catch(Exception e)
		{
		System.out.print(e);
		e.printStackTrace();
		}
	  
	  RequestDispatcher view = request.getRequestDispatcher("masterClassList.jsp");
		view.forward(request , response);
	  
		%>
 
</FORM>
</body> 
</html>