<%@page import="com.app.mycart.helper.Helper"%>
<%@page import="com.app.mycart.entities.Category"%>
<%@page import="com.app.mycart.dao.CategoryDao"%>
<%@page import="com.app.mycart.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.app.mycart.dao.ProductDao"%>
<%@page import="com.app.mycart.helper.FactroyProvider"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>

<%@include file="component/common_css_js.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<div class="container-fluid">

		<div class="row mt-3 mx-2">
			<%
				String cat = request.getParameter("category");

				ProductDao dao = new ProductDao(FactroyProvider.getFactory());

				List<Product> list = null;

				if (cat == null) {
					list = dao.getAllProducts();
				} else if (cat.trim().equals("all")) {
					list = dao.getAllProducts();
				} else {
					int cid = Integer.parseInt(cat.trim());
					list = dao.getAllProductsById(cid);
				}

				CategoryDao cdao = new CategoryDao(FactroyProvider.getFactory());
				List<Category> clist = cdao.getCategories();
			%>
			<!-- show category -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?category=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>

					<%
						for (Category c : clist) {
					%>
					<a href="index.jsp?category=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>

					<%
						}
						if (list.size() == 0) {
							out.println("<h3>No item found in given category</h3>");
						}
					%>
				</div>
			</div>

			<!-- show products -->
			<div class="col-md-10 ">
				<!-- row -->
				<div class="row mt-4">
					<div class="col-md-10">
						<div class="card-columns">
							<!-- 	traversing products -->
							<%
								for (Product p : list) {
							%>

							<!-- product card -->
							<div class="card product-card">
								<div class="container text-center mt-2">
									<img src="img/products/<%=p.getpPhoto()%>"
										style="max-height: 150px; max-width: 100%; width: auto;"
										class="card-img-top " alt="">
								</div>
								<div class="card-body">
									<h5 class="card-title"><%=p.getpName()%></h5>
									<%-- <p class="card-text"><%=p.getpDesc() %></p> --%>
									<p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>
								</div>
								<div class="card-footer text-center  ">
									<button class=" btn custom-bg text-white" onclick="add_to_cart(<%=p.getpId()%>, '<%=p.getpName()%>', <%=p.getAfterPriceDiscount()%>)" >Add to cart</button>
									<button class=" btn btn-outline-success">
										&#8377;
										<%=p.getAfterPriceDiscount()%>/- <span
											class="text-secondary discount-label">	&#8377;<%=p.getpPrice() %>,  	 	        	        
											<%=p.getpDiscount()%>% off
										</span>
									</button>
								</div>
							</div>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="component/common_models.jsp" %>
</body>
</html>