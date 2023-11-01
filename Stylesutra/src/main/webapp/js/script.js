//Add to cart


function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");

	if (cart == null) {
		let products = [];
		let product = { productId: pid, productName: pname, productPrice: price, productQuantity: 1 };
		products.push(product);
		localStorage.setItem("cart", JSON.stringify(products));
		console.log("product added 1st time");
	}
	else {
		let pcart = JSON.parse(cart);

		let oldProduct = pcart.find((item) => item.productId == pid);

		if (oldProduct) {
			oldProduct.productQuantity = oldProduct.productQuantity + 1;
			pcart.map((item) => {
				if (item.productId == oldProduct.productId) {
					item.productQuantity = oldProduct.productQuantity;
				}

			});
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product Qunatity increased..");
		} else {
			let product = { productId: pid, productName: pname, productPrice: price, productQuantity: 1 };
			pcart.push(product);
			localStorage.setItem("cart", JSON.stringify(pcart));
			console.log("product is added");
		}

	}
	updatecart();
}

function updatecart()
{
	console.log("updatecart");
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0)
	{
		console.log("Cart is empty");
		$(".cart-items").html("(0)");
	} 
	else
	{
		$(".cart-items").html(`(${cart.length})`);
		console.log("Cart number increased");
	}
}

$(document).ready(function()
		{
	updatecart();
		});

