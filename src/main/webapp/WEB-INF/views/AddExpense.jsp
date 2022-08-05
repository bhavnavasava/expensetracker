<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
</head>
<body>

	<jsp:include page="Navbar.jsp"></jsp:include>
	<br>
	<s:form action="saveexpense" method="post" modelAttribute="expense">
	Category : <s:select path="cId" id="category">
			<c:forEach items="${categories}" var="c">
				<s:option value="${c.cId }">${c.category}</s:option>

			</c:forEach>
		</s:select>
		<br>
		<br>
		
		
		Sub	Category:<s:select path="subCategoryId" id="subCategory">
			<s:option value="">Select sub Category</s:option>
		</s:select>
		<br>
		<br>
		
		
		Date:<s:input path="date" type="date" />
		<s:errors path="date"></s:errors>
		<br>
		<br>
		
		
	
	Payment Type:<s:select path="typeOfPayment" id="typeOfPayment">
			<c:forEach items="${acTypes}" var="a">
				<s:option value="${a.acType}">${a.acType}</s:option>

			</c:forEach>
		</s:select>
		<br>
		<br>
		
	Ammount:<s:input path="ammount" />
		<s:errors path="ammount"></s:errors>
		<br>
		<br>

		<input type="submit">
	</s:form>

	<script>
		$(document)
				.ready(
						function() {
							$("#category")
									.change(
											function() {
												var id = document
														.getElementById("category").value;
												let url = "http://localhost:9898/subcategories?cId="
														+ id;

												$
														.get(url)
														.done(
																function(data) {
																	console
																			.log("gj"
																					+ data);
																	let subcategory = $("#subCategory");
																	subcategory
																			.empty()
																	for (let i = 0; i < data.length; i++) {
																		if (data[i].cId == id) {
																			subcategory
																					.append(`<option value=`+data[i].subCategoryId+`>`
																							+ data[i].subCategory
																							+ `</option>`);
																		}
																	}

																})
														.fail(
																function() {
																	console
																			.log("something went wrong");
																});
											})
						})
	</script>


</body>
</html>