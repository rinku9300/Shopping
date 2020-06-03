<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration Page</title>
<%@include file="component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
<div class="container-fluid">

	<div class="row mt-4">
		<div class="col-md-4 offset-md-4 ">
			<div class="card ">
			<%@include file="component/message.jsp" %>
				<div class="card-body">


					<img src="img/seo-and-web.png " class="rounded mx-auto d-block"
						alt="Computer man" style="width: 48px; height: 48px;">
					<!-- <img src="img/loginpage.jpg" class="rounded mx-auto d-block"   width="75" height="50"> -->
					<h3 class="text-center">Sign Up here</h3>
					<form action="RegisterServlet" method="post">
						<div class="form-group">
							<label for="name">User Name</label> 
							<input type="text" name="user_name" class="form-control" id="name" palceholder="Enter here"
								aria-describedby="emailHelp" placeholder="Enter User Name">

							<label for="email">User Email</label> 
							<input type="email" name="user_email"
								class="form-control" id="email" palceholder="Enter Email"
								aria-describedby="emailHelp" placeholder="Enter email">

							<label for="password">User Password</label> <input
								type="password" name="user_password" class="form-control" id="password"
								placeholder="Enter Password"> 
								
							<label for="phone">User Phone</label>
							 <input type="number" name="user_phone" class="form-control" id="phone"
								placeholder="Enter Phone No"">
								
							 <label for="address">User Address</label>
							<textarea style="height: 100px" name="user_address" class="form-control"
								placeholder="Enter Address"></textarea>

							<div class="container mt-3 text-center">
								<button type= "submit" class="btn btn-outline-success">Success</button>
								<button type="reset"  class="btn btn-outline-warning">Reset</button>
								
								
							</div>

						</div>
					</form>
				</div>

			</div>
		</div>
	</div>
</div>
</body>
</html>