<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login Page</title>
</head>
<body>
<div align="center">
  <h1>Seller Login Form</h1><br>
  <form action="dashbord.jsp" method="post">
   <table style="with: 100%">
    <tr>
     <td>UserName</td>
     <td><input type="text" name="username" /></td>
    </tr>
    <tr>
     <td>Password</td>
     <td><input type="password" name="password" /></td>
    </tr>

   </table>
   <br>
   <input type="submit" name="submit" value="Login" />
  </form>
  <br>
  <form action="registerSeller.jsp" method="post">
  	<p>Don't have an account?<input  type="submit" name="submit" value="Register here" /></p>
  </form>
  
 </div>
</body>
</html>