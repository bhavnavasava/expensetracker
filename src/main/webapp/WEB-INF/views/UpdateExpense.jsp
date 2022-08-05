<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<s:form action="updateexpense" method="post" modelAttribute="expense">
	
		Date:<s:input path="date" type="date" />
		<s:errors path="date"></s:errors><br><br>
	
	Payment Type:<s:select path="typeOfPayment">
			<s:option value="cash">Cash</s:option>
			<s:option value="paytm">PayTm</s:option>
			<s:option value="credit card">Credit Card</s:option>
			<s:option value="debit card">Debit Card</s:option>
			</s:select><br><br>
		
	Ammount:<s:input path="ammount" />
		<s:errors path="ammount"></s:errors><br><br>
		<s:hidden path="expenseId"/>
		
		<input type="submit">
	</s:form>
</body>
</html>