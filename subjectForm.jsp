<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <title>Master Subject Management</title>
</head>
<body>
   <center>
       <h1>Subject Management</h1>
       <h2>
           <a href="/new">Add New Subject</a>
           &nbsp;&nbsp;&nbsp;
           <a href="/list">List All Subjects</a>
           
       </h2>
   </center>
   <div align="center">
       <c:if test="${subject != null}">
           <form action="update" method="post">
       </c:if>
       <c:if test="${subject == null}">
           <form action="insert" method="post">
       </c:if>
       <table border="1" cellpadding="5">
           <caption>
               <h2>
                   <c:if test="${subject != null}">
                       Edit Subject
                   </c:if>
                   <c:if test="${subject == null}">
                       Add New Subject
                   </c:if>
               </h2>
           </caption>
               <c:if test="${subject != null}">
                   <input type="hidden" name="subjectId" value="<c:out value='${subject.SUBJECT_ID}' />" />
               </c:if>          
           <tr>
               <th>Title: </th>
               <td>
                   <input type="text" name="subjectName" size="45"
                           value="<c:out value='${subject.SUBJECT_NAME}' />"
                       />
               </td>
           </tr>
           
           <tr>
               <td colspan="2" align="center">
                   <input type="submit" value="Save" />
               </td>
           </tr>
       </table>
       </form>
   </div>  
</body>
</html>