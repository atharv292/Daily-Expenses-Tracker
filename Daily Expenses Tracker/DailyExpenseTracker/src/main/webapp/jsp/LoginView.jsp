<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
<%@page import="in.co.daily.expense.Utility.DataUtility"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="Header.jsp"%>
	<div class="container-fluid"
		style="position: relative; min-height: 70vh">
		<div class="row mt-5">
			<div class="col-md-4 offset-md-4">
				<form action="<%=DETView.LOGIN_CTL%>" method="post">

					<jsp:useBean id="bean" scope="request"
						class="in.co.daily.expense.Bean.UserBean" />

					<input type="hidden" name="id" value="<%=bean.getId()%>"> 
					<h6 style="color: red;"  class="text-center"><%=ServletUtility.getErrorMessage(request)%></h6>
			        <h6 style="color: green;"  class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h6>
					<div class="card" style="margin-top: 10%;">

						<div class="card-body px-5">

							<div class="container">
								<div class="row">
									<div class="col-2"></div>
									<div class="col-8" style="margin-top: 10%;">
										<h3 class="text-center my-3">
											<p class="h4 mb-4 text-center">
												Sign In Here<i class='fas fa-sign-in-alt'
													style='font-size: 25px; color: teal; margin-left: 5px;'></i>
										</h3>
										<input type="email" id="defaultLoginFormEmail"
											class="form-control mb-4" name="email"
											placeholder="Enetr E-mail"
											value="<%=DataUtility.getStringData(bean.getEmail())%>">
										<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("email", request)%></div>


										<input type="password" id="defaultLoginFormPassword"
											class="form-control mb-4" name="password"
											placeholder="Enter Password"
											value="<%=DataUtility.getStringData(bean.getPassword())%>">
										<div class="form-text" style="color: red"><%=ServletUtility.getErrorMessage("password", request)%></div>

										<div class="form-grp text-center">
											<input type="submit" class="btn btn-primary" name="operation"
												value="<%=LoginCtl.OP_SIGN_IN%>">
										</div>
										<div>
											<div class="col-2"></div>
										</div>
									</div>
									</div>
									</div>
								</div>
							</div>
				</form>
				<br>
			</div>
		</div>
	</div>
	<%@include file="Footer.jsp"%>
</body>
</html>