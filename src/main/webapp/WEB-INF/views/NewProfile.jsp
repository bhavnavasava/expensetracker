<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>
<jsp:include page="Navbar.jsp"></jsp:include>

<form action="saveprofile" enctype="multipart/form-data" method="post">
		Choose Profile:<input type="file" name="profile">
		<input	type="submit" value="upload">
	</form>

</body>
</html>