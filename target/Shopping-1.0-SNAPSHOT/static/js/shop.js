document.addEventListener("DOMContentLoaded", function () {
    var cart = JSON.parse(localStorage.getItem("cart")) || [];

    var addToCartButtons = document.querySelectorAll(".add-to-cart");
    var tempProduct
    addToCartButtons.forEach(function (button) {
        button.addEventListener("click", function (event) {
            var productItem = event.target.closest(".product-item");
            var productId = productItem.getAttribute("data-product-id");
            var productName = productItem.querySelector(".pi-text h5").textContent;
            var productPrice = parseFloat(productItem.querySelector(".product-price").textContent.trim().replace("$", ""));
            var productImage = productItem.querySelector(".pi-pic img").src; // Get the image URL

            // Check if the product already exists in the cart
            var existingProductIndex = cart.findIndex(item => item.id === productId);
            if (existingProductIndex !== -1) {
                // If the product exists, increase its quantity by 1
                cart[existingProductIndex].quantity++;
                cart[existingProductIndex].total = cart[existingProductIndex].quantity * cart[existingProductIndex].price;
            } else {
                // If the product doesn't exist, add it to the cart with quantity 1
                var product = {
                    id: productId,
                    name: productName,
                    price: productPrice,
                    quantity: 1,
                    image: productImage
                };
                tempProduct = product
                cart.push(tempProduct);
            }

            // Calculate cart totals after updating the cart
            calculateCartTotalsTemp(product);
            miniCart();

            // Update local storage with the updated cart data
            saveCartToLocalStorage(cart);
        });
    });

    function calculateCartTotalsTemp(tempProduct) {
        console.log(tempProduct)
        var totalPrice = cart.totalPrice || 0;
        var totalQuantity = cart.totalQuantity || 0;
        totalPrice += tempProduct.price;
        totalQuantity += tempProduct.quantity
//        cart.forEach(function (item) {
//            // Calculate the total price for each product and add it to the overall total
//            item.total = item.quantity * item.price;
//            totalPrice += item.total;
//
//            // Add the quantity of each product to the overall total quantity
//            totalQuantity += item.quantity;
//        });

        // Set cart totals directly into the cart object
        console.log(totalPrice+totalQuantity)
        cart.totalPrice = totalPrice;
        cart.totalQuantity = totalQuantity;

    }


    function saveCartToLocalStorage(cartData) {
        localStorage.setItem("cart", JSON.stringify(cartData));
    }

    function miniCart() {
        var content = ""
        cart.forEach(function (item) {
            content += `
                <tr>
                    <td class="si-pic"><img src="${item.image}" alt="" style="width:50px"></td>
                    <td class="si-text">
                        <div class="product-selected">
                            <p>$${item.price.toFixed(2)} x ${item.quantity}</p>
                            <h6>${item.name}</h6>
                        </div>
                    </td>
                    <td class="si-close">
                        <i class="ti-close"></i>
                    </td>
                </tr>
            `;
        });

// Append the generated HTML to the cart-items tbody
        document.getElementById("cart-items").innerHTML = content;
        document.getElementById("total-quantity-span").innerHTML = cart.totalQuantity;
        document.getElementById("total-price").innerHTML = `$${cart.totalPrice}`;


    }
    miniCart()


// Call the function to show cart items when the page loads or when cart is updated

    document.querySelectorAll(".quantity").forEach(function (proQty) {
        var input = proQty.querySelector(".qty-input");
        var increaseBtn = proQty.querySelector(".qty-increase");
        var decreaseBtn = proQty.querySelector(".qty-decrease");

        increaseBtn.addEventListener("click", function () {
            input.value = parseInt(input.value) + 1;
            updateCartItemQuantity(input.value, proQty);
        });

        decreaseBtn.addEventListener("click", function () {
            if (parseInt(input.value) > 1) {
                input.value = parseInt(input.value) - 1;
                updateCartItemQuantity(input.value, proQty);
            }
        });
    });

    function updateCartItemQuantity(quantity, proQty) {
        var rowIndex = proQty.closest("tr").rowIndex; // Get the index of the row
        var cartItem = cart[rowIndex - 1]; // Subtract 1 because rowIndex is 1-based

        cartItem.quantity = quantity;

        // Update the total price for this item
        var totalPriceCell = proQty.closest("tr").querySelector(".total-price");
        var totalPrice = (cartItem.price * quantity).toFixed(2);
        totalPriceCell.textContent = "$" + totalPrice;

        // Update the cart total
        calculateCartTotals();
        saveCartToLocalStorage(cart);
    }
    // Assuming each close icon has a class of "ti-close"
    var closeIcons = document.querySelectorAll(".btn-remove-cart");

    closeIcons.forEach(function (icon) {
        icon.addEventListener("click", function (event) {

            // Find the parent row of the clicked close button
            var row = event.target.closest("tr");

            // Get the product ID from the data attribute or any other attribute of the row
            var productId = row.getAttribute("data-product-id");

            // Find the index of the product in the cart array
            var index = cart.findIndex(function (item) {
                return item.id === productId;
            });

            // Remove the product from the cart array if found
            if (index !== -1) {
                cart.splice(index, 1);

                // Recalculate cart totals and update the mini cart
                calculateCartTotals();
                miniCart();

                // Update local storage with the updated cart data
                saveCartToLocalStorage(cart);
            }
        });
    });



    function yourOrder() {
        var cartItemsHtml = " <li>Product <span>Total</span></li>";
        cart.forEach(function (item) {
            cartItemsHtml += `
             <li class="fw-normal">${item.name} x ${item.quantity} <span>$${item.price.toFixed(2)}</span></li>
           
               
        `;


        });
        cartItemsHtml += `
 <li class="fw-normal" >Subtotal <span id="subtotal-order">$240.00</span></li>
                                        <li class="total-price" >Total <span id="total-order">$240.00</span></li>
`
        document.getElementById("order-table").innerHTML = cartItemsHtml;

        calculateCartTotals()

    }
    function calculateCartTotals() {
        var totalPrice = 0;
        var totalQuantity = 0;

        cart.forEach(function (item) {
            // Calculate the total price for each product and add it to the overall total
            item.total = item.quantity * item.price;
            totalPrice += item.total;

            // Add the quantity of each product to the overall total quantity
            totalQuantity += item.quantity;
        });

        // Set cart totals directly into the cart object
        cart.totalPrice = totalPrice;
        cart.totalQuantity = totalQuantity;

        document.getElementById("subtotal-order").innerHTML = `$${cart.totalPrice}.00`;
        document.getElementById("total-order").innerHTML = `$${cart.totalPrice}.00`;
        document.getElementById("quantity-checkout").value = cart.totalQuantity
        document.getElementById("price-checkout").value = cart.totalPrice
        document.getElementById("cart-detail-checkout").value = cart
    }
    yourOrder();

});
