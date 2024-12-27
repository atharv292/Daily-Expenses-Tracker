<%@page import="java.util.Iterator"%>
<%@page import="in.co.daily.expense.Utility.ServletUtility"%>
<%@page import="java.util.List"%>
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
	<br>
	<div class="container mt-2"
		style="position: relative; min-height: 68vh">
		<h2 align="center">User List</h2>
		<br>


		<form action="<%=DETView.USER_LIST_CTL%>" method="post">

			<br>
			<h5 style="color: red;" class="text-center"><%=ServletUtility.getErrorMessage(request)%></h5>
			<h5 style="color: green;" class="text-center"><%=ServletUtility.getSuccessMessage(request)%></h5>

			<table class="table table-striped table-light">
			<thead class="table-dark">
				<tr>

					<th scope="col">First Name</th>
					<th scope="col">Last Name</th>
					<th scope="col">Email</th>
					<th scope="col">Phone No</th>
					<th scope="col">Role Name</th>
					<th scope="col">Action</th>
				</tr>
				</thead>
				<%
					int index = 1;
					List list = ServletUtility.getList(request);
					Iterator it = list.iterator();
					while (it.hasNext()) {
						UserBean bean = (UserBean) it.next();
				%>
				<tr>
					<td><%=bean.getFirstName()%></td>
					<td><%=bean.getLastName()%></td>
					<td><%=bean.getEmail()%></td>
					<td><%=bean.getPhoneNo()%></td>
					<%
						if (bean.getRoleName().equalsIgnoreCase("ADMIN")) {
					%>
					
					<td><%=bean.getRoleName()%></td>
					<td>-------</td>
					<%
						} else {
					%>
					<td><%=bean.getRoleName()%></td>
					<td><a class="btn btn-danger"
						href="<%=DETView.USER_LIST_CTL%>?id=<%=bean.getId()%>"><i
							class='	far fa-trash-alt' style='font-size: 15px;'></i></a></td>
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
</html>