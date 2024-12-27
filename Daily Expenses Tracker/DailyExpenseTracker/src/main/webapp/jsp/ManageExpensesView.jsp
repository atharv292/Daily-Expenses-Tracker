<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="in.co.daily.expense.Controller.ManageExpenseCtl"%>
<%@page import="in.co.daily.expense.Bean.ExpensesBean"%>
<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
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
<body>
	<%@ include file="Header.jsp"%>
	<br>
	<%
		UserBean user = (UserBean) session.getAttribute("user");
	%>
	<form action="<%=DETView.MANAGE_EXPENSES_CTL%>" method="post">
		<div class="container mt-4 "
			style="position: relative; min-height: 84vh">
			<div class="cotainer">
				<div class="row justify-content-center">
					<div class="col-md-8">
						<div class="card mt-4">
							<div class="card-header text-success font-weight-bold">
								Datewise Expenses Report
							</div>
								<h6 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h6>
							<div class="card-body">


								<div class="container text-center">

									<label class="form-label">From Date </label> <input type="text"
										autocomplete="off" placeholder="Enter  Date" name="thisDate"
										autocomplete="off" data-provide="datepicker" id="datepicker"
										class="datepicker"> &nbsp; <label class="form-label">To
										Date</label> <input type="text" autocomplete="off"
										placeholder="Enter  Date" name="todate"
										data-provide="datepicker" id="datepicker" class="datepicker">
									<h5>
										<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("thisDate", request)%></div>
									</h5>
									<h5>
										<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("todate", request)%></div>
									</h5>
								</div>
							</div>
							<br>
							<div class="col-md-6 offset-md-3 text-center">
								<input type="submit" name="operation" class="btn btn-primary"
									value="<%=ManageExpenseCtl.OP_SEARCH%>">&nbsp;&nbsp;&nbsp;<input
									type="submit" class="btn btn-secondary" name="operation"
									value="<%=ManageExpenseCtl.OP_RESET%>">
							</div>

							<table class="table table-striped mt-4" style="background-color: #f7fffe;">
							<thead class="table-dark">
							<%ExpensesBean bean = new ExpensesBean(); %>
								<%
									List list2 = (ArrayList) ServletUtility.getList(request);
									if (list2 == null) {
								%>

								<%
									} else {
								%>
								<div class="text-center mt-4">
									<h4>
										<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
									</h4>
								</div>
								<tr>
									<th scope="col">Title</th>
									<th scope="col">Date</th>
									<th scope="col">Price</th>
								</tr>
								</thead>
								<%
									long totalPrice = 0;
								%>
								<%
									int index = 1;
										List list = ServletUtility.getList(request);
										Iterator it = list.iterator();
										while (it.hasNext()) {
											 bean = (ExpensesBean) it.next();
											totalPrice = totalPrice + bean.getPrice();
								%>

								<tr>
									<td><%=bean.getTitle()%></td>
									<td><%=bean.getDate()%></td>
									<td>&#8377; <%=bean.getPrice()%></td>
									<%
										}
									%>
								<tr>
									<td></td>	
									<td class='font-weight-bold text-dark'>Total Expenses</td>
									<td class='font-weight-bold  text-dark' style="color: blue;">&#8377; <%=totalPrice%></td>
								</tr>
								<%
									}
								%>
							</table>



						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
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