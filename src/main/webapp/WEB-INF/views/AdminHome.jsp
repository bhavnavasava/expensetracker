<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Home</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">


</head>
<body>

<jsp:include page="AdminNavbar.jsp"></jsp:include>
<a href="newprofile">New Profile</a>
		<a href="getaccountdetail">View Account Details</a>
	
	 <div class="nav-item active">
        <a class="nav-link" href="createaccount">Create Account <span class="sr-only"></span></a>
      </div>
      
      <div class="col-6">
		<a href="expense" type="submit" class="btn btn-outline-primary">Add
			Expense</a> <br> <br>

	</div>
	<div class="col-6"><a href="getallexpense" button type="submit"
			class="btn btn-outline-danger"> All Expense</a> <br> <br></div>
	
	
</body>
</html>