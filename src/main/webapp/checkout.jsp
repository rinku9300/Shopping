<%

User user = (User) session.getAttribute("current-user");

if (user == null) {
	session.setAttribute("message", "your not Logged in Please Login first ! to access checkout page");
	response.sendRedirect("login.jsp");
	return;
}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%@include file="component/common_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- card -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-2">Your Selected Items</h3>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<!-- form details -->
				<div class="card">
					<div class="card-body">
						<h3 class="text-center my-2">Your Details for order</h3>
						<form action="">
							<div class="form-group">
								<label for="email">Email Address</label> 
								<input value ="<%= user.getUserEmail()%>" type="email" class="form-control" placeholder="Your Email" id="email">
							</div>
							<div class="form-group">
								<label for="name">Your Name</label> 
								<input value="<%=user.getUserName()%>" type="name" class="form-control" placeholder="Your Name" id="email">
							</div>
							<div class="form-group">
								<label for="name">Your Phone Number</label> 
								<input value="<%=user.getUserPhone()%>" type="phone" class="form-control" placeholder="Your Phone Number" id="email">
							</div>
							<div class="form-group">
								<label  for="name" >Your Shiping Address</label> 
								<textarea value ="<%= user.getUserAddress()%>" rows="4" class="form-control" placeholder="Enter Your Address" id="email"></textarea>	
								
							
							</div>
							<div class="container text-center">
							<button class="btn btn-outline-success">Order Now</button>
							<button class="btn btn-outline-primary">Continue Shopping</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
		"

	</div>
	<%@include file="component/common_models.jsp"%>
</body>
</html>