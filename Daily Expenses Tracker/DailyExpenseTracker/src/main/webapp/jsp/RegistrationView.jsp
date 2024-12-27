<%@page import="in.co.daily.expense.Controller.UserRegistrationCtl"%>
<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="Header.jsp"%>


	<div class="container-fluid"
		style="position: relative; min-height: 70vh">
		<div class="row mt-5">

			<h6 style="color: red;" class="text-center"><%=ServletUtility.getErrorMessage(request)%></h6>
			<h6 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h6>

			<div class="col-md-4 offset-md-4">
				<h3 class="text-center my-3">Sign up Here</h3>

				<form action="<%=DETView.USER_REGISTRATION_CTL%>" method="post">
					<div class="card">

						<div class="card-body px-5">

							<div class="form-group">
								<label>First Name</label> <input type="text"
									class="form-control" placeholder="Enter First Name"
									name="fName">
									<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("fName", request)%></div>
							</div>
							
								<div class="form-group">
								<label>Last Name</label> <input type="text"
									class="form-control" placeholder="Enter Last Name"
									name="lName">
									<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("lName", request)%></div>
							</div>


							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" placeholder="Enter email"
									name="email">
									<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("email", request)%></div>
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" aria-describedby="password"
									placeholder="Enter Password" name="password">
									<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("password", request)%></div>
							</div>
							
								<div class="form-group">
								<label>Phone No</label> <input type="text"
									class="form-control" placeholder="Enter Phone No"
									name="phoneNo">
									<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("phoneNo", request)%></div>
							</div>

							<div class="container text-center mt-4">
								<input type="submit" class="btn btn-outline-success"
									name="operation" value="<%=UserRegistrationCtl.OP_SUBMIT%>">
									<input type="submit" class="btn btn-outline-warning"
									name="operation" value="<%=UserRegistrationCtl.OP_RESET%>">
							</div>


						</div>

					</div>

				</form>
			</div>

		</div>


	</div>

	<%@ include file="Footer.jsp"%>

</body>
</html>