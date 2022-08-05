<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category</title>
</head>
<body>
	<button> <a href="category">Add Category</a></button>

	<table border="1">
		<tr>
			<th>category Id</th>
			<th>category</th>
			<th>UserId</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${categories}" var="c">
			<tr>
				<td>${c.cId}</td>
				<td>${c.category}</td>
				<td>${c.userId}</td>
				<td><a href="deletecategory?cId=${c.cId}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>