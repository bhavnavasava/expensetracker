<%@page import="com.bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Account</title>
</head>
<body>

<%-- 	<s:form action="saveaccount" method="post" modelAttribute="account">
 --%>	
	
	
	<% UserBean user=(UserBean)session.getAttribute("user"); %>
	<form method="post" action="saveaccount">
		<label>Type Of Payment :</label> 
		<select name="acType" id="type">
			<option disabled="disabled" selected="selected">--Select type--</option>
			<option value="cash">Cash</option>
			<option value="paytm">Paytm</option>
			<option value="creditcard">Credit Card</option>
			<option value="debitcard">Debit Card</option>
		</select><br><br>
		
		<div id="ammount">
			<label>Amount :</label>
			<input type = "text" name="ammount"><br><br>
		</div>
		
		<div id="cardno">
			<label>Card Number(Last 4 digit) :</label>
			<input type="text" name="cardNo"><br><br>
		</div>
		
		<div id="upiid">
			<label>UPI ID :</label>
			<input type="text" name="upiId"><br><br> 
		</div>
		
		<input type="submit" value="saveaccount" />	
		<input type="hidden" name="userId" value="<%=user.getUserId() %>" />	
	</form>
	
	<script type="text/javascript">
	document.addEventListener('DOMContentLoaded',function(){
        document.querySelector("#type").onchange=function(){
        	
        	if(this.value == 'creditcard' || this.value == 'debitcard' ){
                document.querySelector("#upiid").style.display='none';
                document.querySelector("#cardno").style.display='block';
                document.querySelector("#ammount").style.display='block';
        	}
        	if(this.value == "cash"){
        		document.querySelector("#upiid").style.display='none';
                document.querySelector("#cardno").style.display='none';
                document.querySelector("#ammount").style.display='block';
        	}
        	if(this.value == "paytm"){
        		document.querySelector("#upiid").style.display='block';
                document.querySelector("#cardno").style.display='none';
                document.querySelector("#ammount").style.display='block';
        	}
		}
	})
	</script>
	
</body>
</html>