<jsp:include page="AllCss.jsp"></jsp:include>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<c:forEach items="${profile }" var="p">
		<tr>
			<td><img src="${p.imgUrl} " height="200px" width="200px">
			</td>
		</tr>
	</c:forEach>
	
	<a class="navbar-brand" href="#">Navbar</a>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home">Home<span
					class="sr-only"></span></a></li>
			<li class="nav-item active"><a class="nav-link"
				href="createaccount">Create Account <span class="sr-only"></span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="getaccountdetail">View Account Details <span class="sr-only"></span></a>
			</li><li class="nav-item active"><a class="nav-link"
				href="expense">Add Expense <span class="sr-only"></span></a>
			</li><li class="nav-item active"><a class="nav-link"
				href="getallexpense">All Expense <span class="sr-only"></span></a>
			</li><li class="nav-item active"><a class="nav-link"
				href="category">Add category <span class="sr-only"></span></a>
			</li><li class="nav-item active"><a class="nav-link"
				href="subcategory">Add sub Category<span class="sr-only"></span></a>
			</li>
			<li class="nav-item active"><a class="nav-link"
				href="subcategory">Add sub Category<span class="sr-only"></span></a>
			</li><li class="nav-item active"><a class="nav-link"
				href="newprofile">New Profile<span class="sr-only"></span></a>
			</li>
			<li class="nav-item active"><a class="nav-link" href="listallproflesimages">View All Profiles <span class="sr-only"></span>
			</a></li>
			
		</ul>

		<form class="form-inline my-2 my-lg-0" Action="logout">
			<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</button>
		</form>
	</div>
</nav>
<%-- 
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<c:forEach items="${profiles}" var="p">
			<tr>
				<td><img src="${p.imgUrl}" height="200px" width="200px"/></td>		
			</tr>		
		</c:forEach>&nbsp;
		<a class="navbar-brand" href="#">Exp Manager</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="Dashboard.jsp">User<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Amount </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addamount">Add Amount</a> <a
							class="dropdown-item" href="listamount">View Amount</a>
<a class="dropdown-item" href="showbalance">View Amount Balance</a>
						<a class="dropdown-item" href="addexistingamount">Add Amount in existing account</a>
					</div></li>



				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Expense </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addexpense">Add Expense</a> <a
							class="dropdown-item" href="listexpense">View Expense</a>

					</div></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="addcategory">Add Category </a> <a
							class="dropdown-item" href="listcategory">View Category</a> <a
							class="dropdown-item" href="addsubcategory">Add Sub Category</a>
					</div></li>

				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Balance </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="showbalance">View Balance </a>
						</div></li>
						
						
						<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Profile </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="newprofile">Add Profile </a> 
						<a class="dropdown-item" href="listProfile">View Profile</a>
						<a class="dropdown-item" href="mychart">View Chart</a> 
							
					</div></li>
					      <mdb-dropdown tag="li" class="nav-item avatar" anchorClass="p-0">
        <mdb-dropdown-toggle tag="a" navLink color="stylish" slot="toggle" waves-fixed>
          
         			
			<c:forEach items="${profiles }" var="p">
			<tr>
				<td><img src="${p.imgUrl}"		
					
					<!-- <div>
					<li class="dropdown">
					<a href="#" class="dropdown-toggle profile-image" data-toggle="dropdown">
					<img src="http://placehold.it/30x30" class="img-circle special-img"> Test <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="#"><i class="fa fa-cog"></i> Account</a></li>
					</li></div>
					</div>
					</li> -->
			</ul>
			


			<form class="form-inline my-2 my-lg-0">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
			</form>
			<form class="form-inline my-2 my-lg-0">

				<!--  <button class="btn btn-outline-success my-2 my-sm-0" type="submit">My Carts</button>-->
				<a href="logout" class="btn btn-outline-success my-2 my-sm-0">Logout</a>
			</form>
			<form class="form-inline my-2 my-lg-0">

				<!--   <button class="btn btn-outline-success my-2 my-sm-0" type="submit">My Carts</button>-->
				<!-- <a href="DisableController"
					class="btn btn-outline-success my-2 my-sm-0">Ac Disable</a> -->
			</form>
		</div>
	</nav> --%>