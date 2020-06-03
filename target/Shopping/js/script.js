function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		// no cart add
		let products = [];
		let product = {
			productId : pid,
			productName : pname,
			productQuantity : 1,
			productPrice : price
		}
		products.push(product);

		// convert Object into string
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("product is first time added")
		showToast("item is added to cart");
	} else { 
		// cart is already available
		let pcart = JSON.parse(cart);
		
		let oldproduct=pcart.find((item) => item.productId == pid)
		if(oldproduct)
		{
			// we have to increase the quantity
			oldproduct.productQuantity=oldproduct.productQuantity + 1
			
			pcart.map((item)=>{
				if(item.productId == oldproduct.productId)
				{ 
					 item.productQuantity=oldproduct.productQuantity;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("product quantity is increased")
			showToast(oldproduct.productName + "quantity is increased , Quantity : "+ oldproduct.productQuantity);
		}else{
			// we have add the product
			let product = {
					productId : pid,
					productName : pname,
					productQuantity : 1,
					productPrice : price
					}
					pcart.push(product)
					localStorage.setItem("cart", JSON.stringify(pcart));
					console.log("product is added")
					
					showToast("Product is added to cart");	
		}	
		}
		updateCart()
}


function updateCart(){
	 let cartString=localStorage.getItem("cart");
	 // convert string to object
	 let cart=JSON.parse(cartString); 
	 if(cart==null || cart.length==0){
		 console.log("Cart is empty !!")
		 $(".cart-items").html("(0)");
		 $(".cart-body").html("<h3>Cart does not have any items</h3>")
		 $(".checkout-btn").attr('disabled' , true)
	 }
	 
	 else{
		 // there is something on cart
		 console.log(cart);
		 $(".cart-items").html(`(${cart.length})`);
		 
		 let table=`
	     <table class='table'>
		 <thead class='thead-light'>
		 <tr>
		 	<th> Item Name</th>
		 	<th> Price</th>
		 	<th> Quantity</th>
		 	<th> Total Price</th>
		 	<th> Action</th>
		 </tr>
		 </thead>
		 `;	 
		 let totalPrice=0;
			 cart.map((item)=>{
				 
				 table +=`
					 <tr>
					 	<td> ${item.productName} </td>
					 	<td> ${item.productPrice}</td>
					 	<td> ${item.productQuantity}</td>
					 	<td> ${item.productQuantity * item.productPrice}</td>
					 	<td><button onclick="deleteItemFromCart(${item.productId})" class="btn btn-danger btn-sm">Remove</button</td>
					 	
					 </tr>
					`
					 totalPrice +=item.productPrice * item.productQuantity
			 })
			 table  = table +  `
			 <tr>
			 
			 	<td colspan='6' class='text-right font-weight-bold' style="color:blue"> Total Price:${totalPrice}</td>
			 </tr>
			 </table>`
			 $(".cart-body").html(table);
			 $(".checkout-btn").attr('disabled', false)
	 }
} 

// delete item
 function deleteItemFromCart(pid){
	 let cart=JSON.parse(localStorage.getItem('cart'));
	 let newcart=cart.filter((item) => item.productId != pid)
	 localStorage.setItem('cart',JSON.stringify(newcart) )	 
	 updateCart();
	 showToast("item is removed from cart");
}
 
$(document).ready(function(){
	updateCart()
})
  
 
 function showToast(content){
          $('#toast').addClass('display');
        $('#toast').html(content);
          setTimeout(()=>{
              $('#toast').removeClass("display");
          },2000);
 }