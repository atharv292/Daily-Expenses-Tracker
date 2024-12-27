<%@page import="java.util.Date"%>
<%@page import="in.co.daily.expense.Bean.ExpensesBean"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="in.co.daily.expense.Model.ExpenseModel"%>
<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
.custom-bg {
	background: #673ab7!impotant;
}

.admin .card {
	border: 1px solid #673ab7;
	background: #9f9f9f;
}

.admin .card:hover {
	background: #e2e2e2;
	cursor: pointer;
}

.list-group-item.active {
	background: #673ab7!impotant;
	border-color: #673ab7!impotant;
}

.discount-label {
	font-size: 10px!impotant;
	font-style: italic !important;
	/* //text-decoration: line-through!important; */
	white-space: nowrap;
}

.product-card:hover {
	background: #e2e2e2;
	cursor: pointer;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.3.min.js"
	integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU="
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>

	<%
		UserBean user = (UserBean) session.getAttribute("user");
	%>

	<%
		ExpenseModel model = new ExpenseModel();
		ExpensesBean bean = new ExpensesBean();
	%>

	<%
		List list = model.list(user.getId());
		long totalPrice = 0;
		Iterator it = list.iterator();
		totalPrice = totalPrice + bean.getPrice();
		while (it.hasNext()) {
			bean = (ExpensesBean) it.next();
			totalPrice = totalPrice + bean.getPrice();
		}
	%>
	<%
		List list1 = model.TodayExpensesSearch(bean,user.getId());
		long TodayExpenses = 0;
		Iterator it1 = list1.iterator();
		while (it1.hasNext()) {
			bean = (ExpensesBean) it1.next();
			TodayExpenses = TodayExpenses + bean.getPrice();
		}
	%>
	<%
		List list2 = model.YesterDayExpensesSearch(bean, user.getId());
		long YesterDayExpenses = 0;
		Iterator it2 = list2.iterator();
		while (it2.hasNext()) {
			bean = (ExpensesBean) it2.next();
			YesterDayExpenses = YesterDayExpenses + bean.getPrice();
		}
	%>
	<%
		List list3 = model.WeeklyExpensesSearch(bean,user.getId());
		long weeklyExpenses = 0;
		Iterator it3 = list3.iterator();
		while (it3.hasNext()) {
			bean = (ExpensesBean) it3.next();
			weeklyExpenses = weeklyExpenses + bean.getPrice();
		}
	%>
	<%
	List list4 = model.CurrentYearExpensesSearch(bean,user.getId());
		long CurrentYearExpenses = 0;
		Iterator it4 = list4.iterator();
		while (it4.hasNext()) {
			bean = (ExpensesBean) it4.next();
			CurrentYearExpenses = CurrentYearExpenses + bean.getPrice();
		}
	%>


	<%@include file="Header.jsp"%>
	<div class="container pt-5 pb-4 mb-5 align-items-center"
		style="position: relative; min-height: 63vh">

		<div class="container admin">
			<div class="container-fluid">
				<h5 style="color: red;" class="text-center"><%=ServletUtility.getErrorMessage(request)%></h5>
				<h5 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h5>

			</div>

			<div class="row">

				<div class="row mt-3">
					<div class="col-md-6">
						<div class="card">
							<div class="card-body text-center">
								<%-- <form action="<%=DETView.TODAY_EXPENSES_CTL%>" method="post"> --%>
								<%-- <h1><%=d%></h1> --%>
								<div class="container">
									<img alt="" src="img/calendar (1).png"
										class="img-fluid rounded-circle" style="max-width: 100px">
								</div>
							<!-- 	<p class="mt-2 text-muted">Click Here to Check Today
									Expenses</p> -->
								<h1 class="text-uppercase text-muted text-primary"> &#8377;<%=TodayExpenses%></h1>
									<h1 class="text-uppercase text-muted">Today Expenses</h1>
								<%-- <h1><b><input type="submit" class="text-uppercase text-muted" style="font-weight:500;" name="operation" value="<%=TodayExpensesCtl.OP_Today_Expenses%>"></b></h1> --%>
								<%-- <a href="<%=DETView.TODAY_EXPENSES_CTL%>" 
									style="text-decoration: none;"> </a>--%>
								<!-- </form> -->
							</div>
						</div>
					</div>

					<div class="col-md-6">
						<div class="card" data-toggle="modal" data-target="#Yesterday">
							<div class="card-body text-center">
								<a href="" style="text-decoration: none;">
									<div class="container">
										<img alt="" src="img/return-to-the-past.png"
											class="img-fluid rounded-circle" style="max-width: 100px">
									</div>
								<!-- 	<p class="mt-2 text-muted">Click Here to Check YesterDay
										Expenses</p> -->
									<h1 class="text-uppercase text-muted text-primary">
										&#8377;
										<%=YesterDayExpenses%></h1>
									<h1 class="text-uppercase text-muted">YesterDay Expenses</h1>
								</a>
							</div>

						</div>
					</div>


					<div class="col-md-6 mt-4">
						<div class="card" data-toggle="modal" data-target="#courseModal">
							<div class="card-body text-center">
								<a href="" style="text-decoration: none;">
									<div class="container">
										<img alt="" src="img/7-days.png"
											class="img-fluid rounded-circle" style="max-width: 100px">
									</div>
									<!-- <p class="mt-2 text-muted">Click Here to Check Last 7 Day's
										Expenses</p> -->
									<h1 class="text-uppercase text-muted text-primary">
										&#8377;
										<%=weeklyExpenses%></h1>
									<h1 class="text-uppercase text-muted">Last 7 Day's
										Expenses</h1>
								</a>
							</div>

						</div>
					</div>

					<div class="col-md-6 mt-4">
						<div class="card" data-toggle="modal" data-target="#courseModal">
							<div class="card-body text-center">
								<a href="" style="text-decoration: none;">
									<div class="container">
										<img alt="" src="img/calendar.png"
											class="img-fluid rounded-circle" style="max-width: 100px">
									</div>
									<!-- <p class="mt-2 text-muted">Click Here to Check Current Year
										Expenses</p> -->
									<h1 class="text-uppercase text-muted text-primary">
										&#8377;
										<%=CurrentYearExpenses%></h1>
									<h1 class="text-uppercase text-muted">Current Year
										Expenses</h1>
								</a>
							</div>

						</div>
					</div>

					<div class="col-md-6 mt-4">
						<div class="card">
							<div class="card-body text-center">
								<a href="" style="text-decoration: none;">
									<div class="container">
										<img alt="" src="img/all.png" class="img-fluid rounded-circle"
											style="max-width: 100px">
									</div>
									<!-- <p class="mt-2 text-muted">Here Total Expenses</p> -->
									<h1 class="text-uppercase text-muted text-primary">
										&#8377;
										<%=totalPrice%></h1>
									<h1 class="text-uppercase text-muted">Total Expenses</h1>
								</a>
							</div>

						</div>
					</div>


				</div>

			</div>
		</div>

	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>