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
<title>JSP List Users Records</title>
</head>
<body>


<form method="POST" action="addSubject.jsp">
    
           <TABLE style="background-color: #ECE5B6;" WIDTH="30%" >

<TR>
<TH width="50%">SUBJECT_ID</TH>
<TD width="50%"><INPUT TYPE="text" NAME="subject_id" ></TD> 	
<TH width="50%">SUBJECT_NAME</TH> 	
<TD width="50%"><INPUT TYPE="text" NAME="subject_name"></TD>

<TD width="50%"><input type="submit" name="add" style="height: 25px; width: 150px" value="Submit" onClick="Submit"></td>
<TD>   <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='welcomeAdmin.jsp';">
</TD>     
</tr>
</TABLE>
    
    <sql:setDataSource
        var="myDS"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />
     
    <sql:query var="listSubjects"   dataSource="${myDS}">
        SELECT SUBJECT_ID, SUBJECT_NAME FROM MASTER_SUBJECT
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of master Subjects</h2></caption>
            <tr>
                <th>SUBJECT ID</th>
                <th>SUBJECT Name</th>
             </tr>
            <c:forEach var="user" items="${listSubjects.rows}">
                <tr>
                    <td><c:out value="${user.SUBJECT_ID}" /></td>
                    <td><c:out value="${user.SUBJECT_NAME}" /></td>
                  </tr>
            </c:forEach>
        </table>
    </div>

     
  </form>     
</body>
</html>