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
<title>Master STUDENT List</title>
</head>
<body>


<form method="POST" action="addStudent.jsp">
<TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<TR>
<TH width="50%">STUDENT_ID</TH>
<TD width="50%"><INPUT TYPE="text" NAME="student_id" ></TD> 	
<TH width="50%">STUDENT_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="student_name"></TD>
<TH width="50%">CLASS_Assigned</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="class_assigned"></TD>

<TD width="50%"><input type="Submit" name="addNewStudent" style="height: 25px; width: 150px" value="Add new Studnet" onClick="Submit"></td>
<TD>   <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='welcomeAdmin.jsp';">
</TD>     
</tr>
</TABLE>

    <sql:setDataSource
        var="myDSStudent"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />
     
    <sql:query var="listStudent"   dataSource="${myDSStudent}">
        SELECT STUDENT_ID, STUDENT_NAME, CLASS_ASSIGNED FROM MASTER_STUDENT
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of master Students</h2></caption>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Assigned CLass</th>
             </tr>
            <c:forEach var="student" items="${listStudent.rows}">
                <tr>
                    <td><c:out value="${student.STUDENT_ID}" /></td>
                     <td><c:out value="${student.STUDENT_NAME}" /></td>
                    <td><c:out value="${student.CLASS_ASSIGNED}" /></td>
                  </tr>
            </c:forEach>
        </table>
    </div>
     
  </form>   
  
     
  
</body>
</html>