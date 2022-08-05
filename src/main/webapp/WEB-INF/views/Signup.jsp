<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<jsp:include page="AllCss.jsp"></jsp:include>

</head>
<body>
	<%-- <s:form action="saveuser" method="post" modelAttribute="user"> --%>


	<%-- FirstName:<s:input path="firstName" />
		<s:errors path="firstName"></s:errors>
		<br>
		
		<br>
	LastName:<s:input path="lastName" />
		<s:errors path="lastName"></s:errors>
		<br>
		<br>
	Email:<s:input path="email" />
		<s:errors path="email"></s:errors>
		<br>
		<br>
	Password:<s:input path="password" />
		<s:errors path="password"></s:errors>
		<br>
		<br>
		<input type="submit">
	</s:form>
	 
	 --%>

	<div class="authincation h-100">
		<div class="container h-100">
			<div class="row justify-content-center h-100 align-items-center">
				<div class="col-md-6">
					<div class="authincation-content">
						<div class="row no-gutters">
							<div class="col-xl-12">
								<div class="auth-form">
									
									<h4 class="text-center mb-4">Sign up your account</h4>
									<s:form action="saveuser" method="post" modelAttribute="user">
										<div class="form-group">

											<s:label path="firstName" class="mb-1"><strong>FirstName</strong></s:label>
											<s:input path="firstName" type="text" class="form-control"
												placeholder="firstName" />
										</div>
										<div class="form-group">
											<s:label path="lastName" class="mb-1">
												<strong>LastName</strong>
											</s:label>
											<s:input type="text" path="lastName" class="form-control"
												placeholder="lastName" />
										</div>
										<div class="form-group">
											<s:label path="email" class="mb-1">
												<strong>Email</strong>
											</s:label>
											<s:input type="email" path="email" class="form-control"
												placeholder="email" />
										</div>
										<div class="form-group">
											<s:label path="password" class="mb-1">
												<strong>Password</strong>
											</s:label>
											<s:input type="password" path="password" class="form-control"
												value="" placeholder="password" />
										</div>
										<div class="text-center mt-4">
											<s:button type="submit" class="btn btn-primary btn-block">Sign me up</s:button>
										</div>
									</s:form>
									<div class="new-account mt-3">
										<p>
											Already have an account? <a class="text-primary"
												href="login">Login</a>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="AllJs.jsp"></jsp:include>

</body>
</html>