<%@page import="in.co.daily.expense.Controller.AddExpenseCtl"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
<%@page import="in.co.daily.expense.Utility.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
	$('.datepicker').datepicker();
</script>
<title>Insert title here</title>
</head>
<body style="background-color: #f0f1f2">

	<%
		UserBean User = (UserBean) session.getAttribute("user");
	%>

	<%@include file="Header.jsp"%>
	<br>
	
	<div class="container" style="position: relative; min-height: 40vh">
	
		<form action="<%=DETView.ADD_EXPENSES_CTL%>" method="post">

			<div class="row">
				<div class="col-4"></div>
				<div class="col-4">


					<h6 style="color: red;" class="text-center"><%=ServletUtility.getErrorMessage(request)%></h6>
					<h6 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h6>

					<jsp:useBean id="bean" scope="request"
						class="in.co.daily.expense.Bean.ExpensesBean" />

					<p class="h4 mb-4 text-center">Add Expenses</p>

					<div class="card" style="background-color: background;">
						<div class="card-body">

							<label class="form-label">Item</label> <input type="text"
								class="form-control mb-4" name="title" placeholder="Enter Item">
							<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("title", request)%></div>

							<label class="form-label">Date</label> <input type="text"
								autocomplete="off" placeholder="Enter  Date" name="date"
								data-provide="datepicker" id="datepicker"
								class="form-control mb-4 datepicker" required="required">

							<label class="form-label">Price</label> <input type="number"
								class="form-control mb-4" name="price" placeholder="Enter Price">
							<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("price", request)%></div>

							<label class="form-label">Description</label>
							<textarea name="description" id="msg" class="form-control"
								placeholder="Write your Description" cols="30" rows="4"></textarea>
							<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("description", request)%></div>

						</div>
					</div>


					<div class="container mt-4 text-center">
						<input type="submit" class="btn btn-primary" name="operation"
							value="<%=AddExpenseCtl.OP_SUBMIT%>">
					</div>
				</div>

			</div>
			<div class="col-4"></div>
		</form>
		<br>
	</div>
	<%@ include file="Footer.jsp"%>

</body>
<script type="text/javascript">
	$('.datepicker').datepicker({
		autoclose : true,
		changeYear : true,
		orientation : "top",
		endDate : "today",
		// yearRange : "-20:",
		defaultDate : "01/01/2021"
	});
</script>
</html>