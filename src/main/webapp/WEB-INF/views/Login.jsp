<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>

	<form action="login" method="post">
		
		Email:<input name="email" type="email" /><br><br> 
		Password:<input name="password" type="password"/><br><br>
		<input type="submit" value="login">

	</form>


</body>
</html>