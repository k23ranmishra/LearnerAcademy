<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Assign Teacher</title>
</head>
<body>
<form method="POST" action="addAssignTeacher.jsp">
           <TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

    <sql:setDataSource
        var="myDSAssign"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />
     
    <sql:query var="v_teachers"   dataSource="${myDSAssign}">
        SELECT DISTINCT TEACHER_NAME FROM MASTER_TEACHER
    </sql:query>
	
	<sql:query var="v_classes"   dataSource="${myDSAssign}">
        SELECT DISTINCT CLASS_NAME FROM MASTER_CLASSES
    </sql:query>
    
	    
<Table border=1> 
<TR>
<TH>Select  Teacher:&nbsp;</TH>
<TD>    
    <select name="teacherli">
        <c:forEach  var="teacher" items="${v_teachers.rows}" >
            <option value="${teacher.TEACHER_NAME}" >"${teacher.TEACHER_NAME}" </option>

        </c:forEach>
    </select>
</TD>
<TH>  Select Class:&nbsp;</TH>
<TD>
    <select name="classli">
        <c:forEach  var="cl" items="${v_classes.rows}" >
            <option value="${cl.CLASS_NAME}" >"${cl.CLASS_NAME}" </option>
        </c:forEach>
    </select>
<TD>    
<TD>
<input type="submit" name="add" style="height: 25px; width: 150px" value="Submit" onClick="Submit">
</TD>
<TD>
 <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='welcomeAdmin.jsp';">
<TD>
<TR>
</Table>
    

    
    <sql:query var="listAssign"   dataSource="${myDSAssign}">
        SELECT TEACHER_NAME, CLASS_NAME FROM TEACHER_ASSIGNED
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of Assigned Teacher</h2></caption>
            <tr>
                <th>TEACHER NAME</th>
                <th>CLASS Name</th>
             </tr>
            <c:forEach var="user" items="${listAssign.rows}">
                <tr>
                    <td><c:out value="${user.TEACHER_NAME}" /></td>
                    <td><c:out value="${user.CLASS_NAME}" /></td>
                  </tr>
            </c:forEach>
        </table>
    </div>

     
  </form>     
</body>
</html>