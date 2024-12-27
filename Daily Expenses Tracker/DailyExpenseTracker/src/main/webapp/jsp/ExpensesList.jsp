<%@page import="java.util.ArrayList"%>
<%@page import="in.co.daily.expense.Utility.DataUtility"%>
<%@page import="in.co.daily.expense.Controller.ExpenseListCtl"%>
<%@page import="in.co.daily.expense.Bean.ExpensesBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
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
<style>
</style>
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<br>
	<div class="container mt-4"
		style="position: relative; min-height: 66vh">
		<h2 align="center">Expenses List</h2>
		<br>

		<h6 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h6>

		<form action="<%=DETView.EXPENSES_LIST_CTL%>" method="post">

			<table class="text-center mb-4" width="100%">
				<tr>
					<td><label class="form-label">Date</label> <input type="text"
						autocomplete="off" placeholder="Enter  Date" name="date"
						data-provide="datepicker" id="datepicker" class="datepicker">
						&emsp; <input type="submit" name="operation" class="btn btn-primary"
						value="<%=ExpenseListCtl.OP_SEARCH%>"> &emsp; <input
						type="submit" name="operation" class="btn btn-secondary"
						value="<%=ExpenseListCtl.OP_RESET%>"></td>
				</tr>
			</table>



			<table class="table table-striped mb-4" style="background-color: #f7fffe;">
				<thead class="table-dark">
					<%
						List list2 = (ArrayList) ServletUtility.getList(request);
						if (list2 == null) {
					%>

					<%
						} else {
					%>


					<div class="text-center">
						<h4>
							<b><font color="red"><%=ServletUtility.getErrorMessage(request)%></font></b>
						</h4>
					</div>

					<tr>

						<th scope="col">Title</th>
						<th scope="col">Date</th>
						<th scope="col">Price</th>
						<th scope="col">Email</th>
						<th scope="col">Description</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<%
					int index = 1;
						List list = ServletUtility.getList(request);
						Iterator it = list.iterator();
						while (it.hasNext()) {
							ExpensesBean bean = (ExpensesBean) it.next();
				%>
				<tr>

					<td><%=bean.getTitle()%></td>
					<td><%=bean.getDate()%></td>
					<td>&#8377; <%=bean.getPrice()%></td>
						<td><%=bean.getEmail()%></td>
					<td><%=bean.getDescription()%></td>
					<td><a class="btn btn-danger" href="<%=DETView.EXPENSES_LIST_CTL%>?id=<%=bean.getId()%>">
					<i class='	far fa-trash-alt' style='font-size: 15px;'></i></a></td>

				</tr>
				<%
					}
					}
				%>
				</tbody>
			</table>


		</form>
	</div>
	<%@include file="Footer.jsp"%>
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