<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="ISO-8859-1">
<script type="text/javascript"
	href="//cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"></script>

<title>All Expense</title>
</head>
<body>
	<jsp:include page="SimpleNavbar.jsp"></jsp:include>
	<br>
	<br>

	<table border="1" class="table table-striped" id="allexpense">
		<tr>
			<th scope="col">expenseId</th>
			<th scope="col">Category</th>
			<th scope="col">Sub Category</th>
			<th scope="col">Date</th>
			<th scope="col">Payment Type</th>
			<th scope="col">Amount</th>
			<th scope="col">Action</th>
		</tr>
		<c:forEach items="${expense}" var="e">
			<tr>
				<td>${e.expenseId}</td>
				<td>${e.cId}</td>
				<th>${e.subCategory}</th>
				<td>${e.date}</td>
				<td>${e.typeOfPayment}</td>
				<td>${e.ammount}</td>
				<td><a href="deleteexpense?expenseId=${e.expenseId}">Delete</a>
					|<a href="editexpense?expenseId=${e.expenseId}">Update</a></td>
			</tr>
		</c:forEach>
	</table>

	<jsp:include page="AllJs.jsp"></jsp:include>
	
</body>
</html>