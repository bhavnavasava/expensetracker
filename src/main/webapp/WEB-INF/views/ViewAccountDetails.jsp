<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="AllCss.jsp"></jsp:include>
<meta charset="ISO-8859-1">
<title>Account Details</title>
</head>
<body>

	<h3>Total Amount: ${total}</h3>

	<label>Type Of Payment :</label>
	<select name="acType" id="type">
		<option disabled="disabled" selected="selected">--Select
			type--</option>
		<option value="cash">Cash</option>
		<option value="paytm">Paytm</option>
		<option value="creditcard">Credit Card</option>
		<option value="debitcard">Debit Card</option>
	</select>
	<br>
	<br>


	<%-- <table border="2">
		<tr>
			<th>Account Type</th>
			<th>Card Number</th>
			<th>UPI Id</th>
			<th>Total Amount</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${accounts}" var="a">
			<tr>
				<td>${a.acType}</td>
				<td>${a.cardNo}</td>
				<td>${a.upiId}</td>
				<td>${a.ammount}</td>
				<td>${t.total}</td>
				
				<td><a href="addmoney?acId=${a.acId}"  type="submit"
			class="btn btn-outline-success">Add Amount</a></td>
		</tr>
		</c:forEach>
	</table>
	<h4>Total Amount:	${total}</h4> --%>
	<%-- <c:forEach items="${total}">
				
			<h4>Total Amount:	${total}</h4>
		</c:forEach> --%>
		
		
	<div id="cash">
		<table border="3" class="table">
		<thead class="thead-dark">
			<tr>
				<th>Account Type</th>
				<th>Total Amount</th>
				<th>Action</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${cashAcType}" var="a">
				<tr>
					<td>${a.acType}</td>
					<td>${a.ammount}</td>

					<td><a href="addmoney?acId=${a.acId}" type="submit"
						class="btn btn-outline-success">Add Amount</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div><br><br>
	
	
	<div id="creditcard">
	<table border="3" class="table">
	<thead class="thead-dark">
			<tr>
				<th>Account Type</th>
				<th>Card No</th>
				<th>Total Amount</th>
				<th>Action</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${creditCardAcType}" var="a">
				<tr>
					<td>${a.acType}</td>
					<td>${a.cardNo}</td>
					<td>${a.ammount}</td>

					<td><a href="addmoney?acId=${a.acId}" type="submit"
						class="btn btn-outline-success">Add Amount</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div><br><br>
	<%-- 	<c:if test="${(debitCardAcType != 0)}"> --%>


	<div id="debitcard">
		<table border="3" class="table">
		<thead class="thead-dark">
			<tr>
				<th>Account Type</th>
				<th>Card No</th>
				<th>Total Amount</th>
				<th>Action</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${debitCardAcType}" var="a">
				<tr>
					<td>${a.acType}</td>
					<td>${a.cardNo}</td>
					<td>${a.ammount}</td>

					<td><a href="addmoney?acId=${a.acId}" type="submit"
						class="btn btn-outline-success">Add Amount</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div><br><br>
	

	<div id="paytm">
		<table border="3" class="table">
		<thead class="thead-dark">
			<tr>
				<th>Account Type</th>
				<th>UPI Id</th>
				<th>Total Amount</th>
				<th>Action</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach items="${payTmAcType}" var="a">
				<tr>
					<td>${a.acType}</td>
					<td>${a.upiId}</td>
					<td>${a.ammount}</td>

					<td><a href="addmoney?acId=${a.acId}" type="submit"
						class="btn btn-outline-success">Add Amount</a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>

	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded', function() {

			document.querySelector("#type").onchange = function() {
			
				if (this.value == 'creditcard' || this.value == 'debitcard') {
					document.querySelector("#creditcard").style.display = 'block';
					document.querySelector("#cash").style.display = 'none';
					document.querySelector("#paytm").style.display = 'none';
					document.querySelector("#debitcard").style.display = 'none';

				}
				if (this.value == "cash") {
					document.querySelector("#creditcard").style.display = 'none';
					document.querySelector("#cash").style.display = 'block';
					document.querySelector("#paytm").style.display = 'none';
					document.querySelector("#debitcard").style.display = 'none';

				}
				if (this.value == "paytm") {
					document.querySelector("#creditcard").style.display = 'none';
					document.querySelector("#cash").style.display = 'none';
					document.querySelector("#paytm").style.display = 'block';
					document.querySelector("#debitcard").style.display = 'none';

				}
				if (this.value == "debitcard") {
					document.querySelector("#creditcard").style.display = 'none';
					document.querySelector("#cash").style.display = 'none';
					document.querySelector("#paytm").style.display = 'none';
					document.querySelector("#debitcard").style.display = 'block';
				}
			}
		})
	</script>
</body>
</html>