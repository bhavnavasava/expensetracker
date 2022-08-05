<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>
	<div class="nav-header">
		<h2>Expense Tracker</h2>
	</div>
	<div class="header">
		<div class="header-content">
			<nav class="navbar navbar-expand">
				<div class="collapse navbar-collapse justify-content-between">
					<div class="header-left"></div>
					<ul class="navbar-nav header-right main-notification">


						<li class="nav-item dropdown header-profile"><a
							class="nav-link" href="#" role="button" data-toggle="dropdown">
								<img src="images\2\33e0a8de-c30c-4bbd-b357-7d3d53b6dfe5.jpg"
								width="20" alt="">
								<div class="header-info">
									<span>Johndoe</span> <small>Super Admin</small>
								</div>
						</a></li>
					</ul>
				</div>
			</nav>
		</div>
	</div>
	<jsp:include page="Navbar.jsp"></jsp:include>
	<br>
	<br>

	<div class="col-6">
		<a href="expense" type="submit" class="btn btn-outline-primary">Add
			Expense</a> <br> <br>

	</div>
	
	<div class="col-6"><a href="getallexpense" button type="submit"
			class="btn btn-outline-danger"> All Expense</a> <br> <br></div>

	<div class="col-6">
		<a href="category" button type="submit"
			class="btn btn-outline-success">Add category</a> <br> <br>
	</div>
	<div class="col-6">
		<a href="subcategory" button type="submit"
			class="btn btn-outline-warning">Add sub Category</a> <br> <br>
	</div>

	<a href="newprofile">New Profile</a>
		<a href="getaccountdetail">View Account Details</a>
	

	<jsp:include page="AllJs.jsp"></jsp:include>

</body>
</html>