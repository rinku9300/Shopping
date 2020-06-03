<%@page import="java.util.List"%>
<%@page import="com.app.mycart.helper.FactroyProvider"%>
<%@page import="com.app.mycart.dao.CategoryDao"%>
<%@page import="com.app.mycart.entities.Category"%>
<%@page import="com.app.mycart.entities.User"%>
<%
	User user = (User) session.getAttribute("current-user");

	if (user == null) {
		session.setAttribute("message", "your not Logged in Please Login first");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("normal")) {
			session.setAttribute("message", "sorry! you don't have access");
			response.sendRedirect("login.jsp");
			return;
		}

	}
%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin User</title>
<%@include file="component/common_css_js.jsp"%>

</head>
<body>
	<%@include file="component/navbar.jsp"%>


	<div class="container admin">
	
	<div class="container-fluid">
	<%@include file="component/message.jsp" %>
	
	</div>

		<div class="row mt-3">

			<!-- first column -->

			<div class="col-md-4">
				<!-- first box -->
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid"
								src="img/seo-and-web.png" alt="user_icon">
						</div>
						<h1>3250</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>
			</div>

			<!-- second column -->

			<div class="col-md-4">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 175px;" class="img-fluid"
								src="img/list.png" alt="user_icon">
						</div>
						<h1>2598</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>

			<!-- third column -->

			<div class="col-md-4 ">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 160px;" class="img-fluid"
								src="img/product.jpg" alt="user_icon">
						</div>
						<h1>40250</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>
		</div>

		<div class="row mt-3">
			<div class="col-md-6">
				<div class="card" data-toggle="modal"
					data-target="#add-category-model">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid"
								src="img/Categorys.png" alt="user_icon">
						</div>

						<p class="mt-2">Click here to add new Category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
			</div>

			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product-model">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid"
								src="img/products.jpg" alt="user_icon">
						</div>
						<p class="mt-2">Click here to add new Product</p>

						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- add category model -->

	<!-- Modal -->
	<div class="modal fade" id="add-category-model" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Fill category
						details</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<form action="ProductOperationServlet" method="post">
							<input type="hidden" name="operation" value="addCategory">
							
							<div class="form-group">
	
								<input type="text" class="form-control" name="catTitle"
									placeholder="Enter category title" required />
	
							</div>
							<div class="form-group">
								<textarea style="height: 300px" class="form-control"
									placeholder="Enter category description" name="catDescription"
									required></textarea>
							</div>
							<div class="container text-center">
								<button class="btn btn-outline-success ">Add Category</button>
								<button type="button" class="btn btn-secondary"
									data-dismiss="modal">Close</button>
							</div>
						</form>
				</div>

			</div>
		</div>
	</div>

	<!-- end category model -->
	
	<!-- Product Model -->

<!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg">
        <h5 class="modal-title " id="exampleModalLabel" custom-bg>Product Details</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
     <!-- Category form -->
      <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
      <input type="hidden" name="operation" value="addProduct"/>
      <!-- title -->
      
      <div class="form-group">
      <input type="text" class="form-control" placeholder="Enter product title" name="pName" required>
      </div>
      
      <!-- Description -->
       <div class="form-group">
       <textarea style="height:150px" class="form-control" placeholder="Enter prouct description" name="pDesc" required></textarea>
      </div>
      
       <!-- Price -->
       <div class="form-group">
      <input type="number" class="form-control" placeholder="Enter product price" name="pPrice" required>
      </div>
      
      <!-- Discout -->
       <div class="form-group">
      <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required>
      </div>
      
       <!-- Discout -->
       <div class="form-group">
      <input type="number" class="form-control" placeholder="Enter product quantity" name="pQuantity" required>
      </div>
      
      
      <!-- Categories dropdow -->
      
      
      <%
      CategoryDao cdao=new CategoryDao(FactroyProvider.getFactory());
      List<Category> list=cdao.getCategories();
      
      %>
     <div class="form-group">
      <select name="catId" class="form-control" id="">
      <%
      for(Category c:list){
      %>
       <option value="<%= c.getCategoryId() %>"><%=c.getCategoryTitle() %></option>
     
      <% }%>
       
      </select>
      </div>
      
      <!-- Product file -->
		<div class="form-group">
		<Label for="" >Select Product Piture</Label>
		<br>
		<input type="file" name="pPic" required/>
		</div>
     
      <!--  Submit button -->
		<div class="container text-center">
		<button  class="btn btn-outline-success">Add Product</button>
		<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
		</div>
      
       </form>
      
    </div>
  </div>
</div>


<!-- end Product modal -->
</body>
</html>