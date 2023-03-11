 	 	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<script language='javascript' type='text/javascript' src='gen_validatorv4.js'   xml:space="preserve"></script>
</head>
<body >

<form name="loginform" method="POST" action="loginServlet">

<br><br>
<table align="center"><tr><td><h2>Welcome to Ranjeet Learners Academy</h2></td></tr>
<tr></tr>
<tr></tr>
<tr><td><h2><center>Login Page</center></h2></td></tr>
</table>

<table width="300px" align="center" style="border:1px solid #000000;background-color:#efefef;">
<tr><td colspan=2></td></tr>
<tr><td colspan=2> </td></tr>
  <tr>
  <td><b>User Name</b></td>
  <td><input type="text" name="username" value=""></td>
  </tr>
  <tr>
  <td><b>Password</b></td>
  <td><input type="password" name="password" value=""></td>
  </tr>
  <tr>
  <td></td>
  <td><input type="submit" name="Submit" value="Submit"></td>
  <td> <input type="submit" name="Exit" value="Exit" onClick="javascript:window.close();"></td>
  </tr>
 
  <tr><td colspan=2> </td></tr>
 
</table>
</form>
<script language='javascript' type='text/javascript' >;
var frmvalidator = new 	 Validator("loginform");
frmvalidator.addValidation("username","req","Please enter username");
frmvalidator.addValidation("password","req","Please enter password");
</script>

</body>
</html>