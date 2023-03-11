<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Master Class List</title>
</head>
<body>


<form method="POST" action="AddClass.jsp">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<TR>
<TH width="50%">CLASS_ID</TH>
<TD width="50%"><INPUT TYPE="text" NAME="class_id" ></TD> 	
<TH width="50%">CLASS_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="class_name"></TD>
<TH width="50%">CLASS_TEACHER_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="class_teacher_name"></TD>

<TD width="50%"><input type="Submit" name="addNewClass" style="height: 25px; width: 150px" value="Add new Class" onClick="Submit"></td>
<TD>   <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='welcomeAdmin.jsp';">
</TD>     
</tr>
</TABLE>

    <sql:setDataSource
        var="myDSClass"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />
     
    <sql:query var="listClass"   dataSource="${myDSClass}">
        SELECT CLASS_ID, CLASS_NAME, CLASS_TEACHER_NAME FROM MASTER_CLASSES
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of master Subjects</h2></caption>
            <tr>
                <th>Class ID</th>
                <th>Class Name</th>
                <th>Class Teacher Name</th>
             </tr>
            <c:forEach var="teacher" items="${listClass.rows}">
                <tr>
                    <td><c:out value="${teacher.CLASS_ID}" /></td>
                     <td><c:out value="${teacher.CLASS_NAME}" /></td>
                    <td><c:out value="${teacher.CLASS_TEACHER_NAME}" /></td>
                  </tr>
            </c:forEach>
        </table>
    </div>
     
  </form>   
  
     
  
</body>
</html>