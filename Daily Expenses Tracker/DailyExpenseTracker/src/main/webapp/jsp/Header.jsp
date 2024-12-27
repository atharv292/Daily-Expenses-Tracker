
<%@page import="in.co.daily.expense.Controller.LoginCtl"%>
<%@page import="in.co.daily.expense.Controller.DETView"%>
<%@page import="in.co.daily.expense.Bean.UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HeaderView</title>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css"
	integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<script src='https://kit.fontawesome.com/a076d05399.js'
	crossorigin='anonymous'></script>


</head>
<body>

	<%
		UserBean userBean = (UserBean) session.getAttribute("user");
	%>
	<%
		boolean userLoggedIn = userBean != null;

		String welcomeMsg = "Hello, ";

		if (userLoggedIn) {
			//String lastname =  userBean.getLastName();
			welcomeMsg += userBean.getFirstName();
		} else {
			welcomeMsg += "Guest";
		}
	%>

	<!-- As a heading -->
	<nav class="navbar bg-light">

		<span class="navbar-brand mb-0 h1 text-dark"><i
			class='fas fa-address-card'
			style='font-size: 22px; margin-left: 5px; margin-right: 5px; color: teal'></i>Daily
			Expense Tracker Management</a> </span>
	</nav>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">

				<li class="nav-item active"><a class="nav-link text-white"
					href="<%=DETView.WELCOME_CTL%>"><i class='fas fa-house-user'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Home</a></li>


				<%
					if (userBean != null) {
				%>

				<%
					if (userBean.getRoleId() == 1) {
				%>
				
				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.USER_LIST_CTL%>"><i class='fas fa-user-alt'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>User List</a></li>
				<%-- 
				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.ADMIN_CTL%>"><i
						class='fas fa-chess-board'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>DashBoard</a></li>
				

				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.ADD_EXPENSES_CTL%>"><i
						class='fas fa-plus-circle'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Add
						Expenses</a></li> --%>

				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.EXPENSES_LIST_CTL%>"><i class='fas fa-bars'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>View
						Expenses</a></li>
						
				<%-- 		
				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.MANAGE_EXPENSES_CTL%>"><i class='fa fa-window-maximize'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Manage
						Expenses</a></li> --%>


				<%
					} else if (userBean.getRoleId() == 2) {
				%>
			<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.ADMIN_CTL%>"><i
						class='fas fa-chess-board'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>DashBoard</a></li>
				

				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.ADD_EXPENSES_CTL%>"><i
						class='fas fa-plus-circle'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Add
						Expenses</a></li>

				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.EXPENSES_LIST_CTL%>"><i class='fas fa-bars'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>View
						Expenses</a></li>
						
						
				<li class="nav-item active"><a class="nav-link"
					href="<%=DETView.MANAGE_EXPENSES_CTL%>"><i class='fa fa-window-maximize'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Manage
						Expenses</a></li>
						
					<%-- <li class="nav-item active"><a class="nav-link"
					href="<%=DETView.WALLET_CTL%>"><i class='fas fa-bars'
						style='font-size: 22px; color: teal; margin-right: 5px;'></i>Wallets</a></li>	 --%>	

				<%
					}
				%>
				<%
					}
				%>

			</ul>

		</div>


		<%
			if (userBean == null) {
		%>


		<ul class="nav justify-content-end">

			<li class="nav-item active"><a class="nav-link text-white"
				href="<%=DETView.LOGIN_CTL%>"><i class='fas fa-sign-in-alt'
					style='font-size: 22px; color: teal; margin-right: 5px;'></i>SingIn</a></li>
			<li class="nav-item active"><a class="nav-link text-white"
				href="<%=DETView.USER_REGISTRATION_CTL%>"><i
					class='fa fa-registered'
					style='font-size: 22px; color: teal; margin-right: 5px;'></i>SingUp</a></li>
			</div>
		</ul>
		<%
			} else {
		%>
		<ul class="nav justify-content-end">
			<li class="nav-item active"><a class="nav-link text-white"
				href=""><i class='fas fa-user-alt'
					style='font-size: 22px; color: teal; margin-right: 5px;'></i><%=welcomeMsg%></a></li>
			<li class="nav-item active"><a class="nav-link text-white"
				href="<%=DETView.LOGIN_CTL%>?operation=<%=LoginCtl.OP_LOGOUT%>"><i
					class='fas fa-sign-out-alt'
					style='font-size: 22px; color: teal; margin-right: 5px;'></i>Logout</a></li>
		</ul>


		<%
			}
		%>

		</ul>
	</nav>
</body>
</html>