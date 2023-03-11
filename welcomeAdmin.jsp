<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page language="java" import="java.util.*, java.lang.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %> 
<HTML>  
<HEAD><TITLE>Welcome <%= session.getAttribute("username")%> </TITLE></HEAD>  
<BODY bgcolor="WHITE"  >
<DIV ID="welcomeAdmin" style="width:700px">
<DIV ID="HEADER" style="height:80px;width:600px;float:right;">
&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
Welcome <%= session.getAttribute("username")%> . Logged in as  <%= session.getAttribute("userrolename")%>
<%
    java.util.Date date = new java.util.Date();
    out.println( String.valueOf( date ));
%>

<sql:setDataSource
        var="myDS"
        driver="oracle.jdbc.OracleDriver"
        url="jdbc:oracle:thin:@localhost:1521:XE"
        user="RANJEET" password="RANJEET"
    />

</DIV>
<DIV ID="CONTENT" style="background-color:#FFA500;height:350;width:700;float:center;">
<hr>
<table border=1 bordercolor="GREEN" bgcolor="CREME" align="right" scroll="TRUE">

<DIV ID="FOOTER" height="150px" width="900px">
 <FORM name="System Administration" action="NewUser.jsp" method="post">

<table align="center"  bgcolor="Silver"   height="30px" width="700px" >

<tr>
<td>
<input type="button" name="masterlistofSubjects" style="height: 25px; width: 200px" value="master list of Subjects" onClick="document.location.href='masterSubjectList.jsp';"> 
  
</td>
</tr>
<tr>
<td>
<input type="button" name="masterlistofTeachers" style="height: 25px; width: 200px" value="master list of Teachers" onClick="document.location.href='masterTeacherList.jsp';"> 
   
</td>
</tr>

<tr>
<td>
<input type="button" name="masterlistofClasses" style="height: 25px; width: 200px" value="master list of Classes" onClick="document.location.href='masterClassList.jsp';"> 
    
</td>
</tr>

<tr>
<td>
<input type="button" name="masterlistofStudents" style="height: 25px; width: 200px" value="master list of Students" onClick="document.location.href='masterStudentList.jsp';"> 
      
</td>
</tr>
<tr>
<td>
 <input type="button" name="AssignTeacher" style="height: 25px; width: 200px" value="assign teacher to Class" onClick="document.location.href='AssignTeacher.jsp';"> 
       
</td>
</tr>
<tr>
<td>
 <input type="button" name="AssignClass" style="height: 25px; width: 200px" value="assign subjects to class" onClick="document.location.href='AssignClassesSubject.jsp';"> 
      
</td>
</tr>
<tr>
  <td >

  <input type="button" name="exit" style="height: 25px; width: 100px" value="exit" onClick="document.location.href='login.jsp';"></td>
</tr>

</table>

 <FORM>
 </div>
 </div>
</body>
</html>
