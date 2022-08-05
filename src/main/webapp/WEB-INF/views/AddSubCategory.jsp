<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sub Category</title>
</head>
<body>
	<s:form action="savesubcategory" method="post"
		modelAttribute="subcategory">

		
	Category : <s:select path="cId">
			<c:forEach items="${categories}" var="c">
				<s:option value="${c.cId }">${c.category}</s:option>
			</c:forEach>
		</s:select><br><br>
	
	Sub	Category :<s:input path="subCategory" />
		<br>
		<br>
		<input type="submit" value="save category">

	</s:form>
</body>
</html>