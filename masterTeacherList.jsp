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
<title>Master Teacher List</title>
</head>
<body>


<form method="POST" action="addTeacher.jsp">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<TR>
<TH width="50%">TEACHER_ID</TH>
<TD width="50%"><INPUT TYPE="text" NAME="teacher_id" ></TD> 	
<TH width="50%">TEACHER_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="teacher_name"></TD>
<TH width="50%">SUBJECT_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="subject_name"></TD>

<TD width="50%"><input type="Submit" name="addNewTeacher" style="height: 25px; width: 150px" value="Add new Teacher" onClick="Submit"></td>
<TD>   <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='welcomeAdmin.jsp';">
</TD>     
</tr>
</TABLE>

    <sql:setDataSource
        var="myDSTeacher"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />
     
    <sql:query var="listTeachers"   dataSource="${myDSTeacher}">
        SELECT TEACHER_ID, TEACHER_NAME, SUBJECT_NAME FROM MASTER_TEACHER
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of master Subjects</h2></caption>
            <tr>
                <th>Teacher ID</th>
                <th>Teacher Name</th>
                <th>Subject Name</th>
             </tr>
            <c:forEach var="teacher" items="${listTeachers.rows}">
                <tr>
                    <td><c:out value="${teacher.TEACHER_ID}" /></td>
                     <td><c:out value="${teacher.TEACHER_NAME}" /></td>
                    <td><c:out value="${teacher.SUBJECT_NAME}" /></td>
                  </tr>
            </c:forEach>
        </table>
    </div>
     
  </form>   
  
     
  
</body>
</html>