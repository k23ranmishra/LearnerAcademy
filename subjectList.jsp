<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <title>Master Subject List</title>
</head>
<body>
   <center>
       <h1>Subject List</h1>
       <h2>
           <a href="/new">Add New Subject</a>
           &nbsp;&nbsp;&nbsp;
           <a href="/list">List All Subjects</a>
           
       </h2>
   </center>
   <div align="center">
       <table border="1" cellpadding="5">
           <caption><h2>List of Subjects</h2></caption>
           <tr>
               <th>SUBJECT_ID</th>
               <th>SUBJECT_NAME</th>
           </tr>
           <c:forEach var="subject" items="${listSubject}">
               <tr>
                   <td><c:out value="${subject.SUBJECT_ID}" /></td>
                   <td><c:out value="${subject.SUBJECT_NAME}" /></td>
                   <td>
                       <a href="/edit?id=<c:out value='${subject.SUBJECT_ID}' />">Edit</a>
                       &nbsp;&nbsp;&nbsp;&nbsp;
                       <a href="/delete?id=<c:out value='${subject.SUBJECT_ID}' />">Delete</a>                    
                   </td>
               </tr>
           </c:forEach>
       </table>
   </div>  
</body>
</html>