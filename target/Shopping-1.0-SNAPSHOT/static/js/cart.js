document.addEventListener("DOMContentLoaded", function () {
    var cart = JSON.parse(localStorage.getItem("cart")) || [];

    showCartItems()
    function showCartItems() {
        var cartItemsHtml = "";
        cart.forEach(function (item) {
            var total = item.price * item.quantity

            cartItemsHtml += `
            <tr>
                <td class="cart-pic first-row"><img src="${item.image}" alt="" style="width: 100px"></td>
                <td class="cart-title first-row">
                    <h5>${item.name}</h5>
                </td>
                <td class="p-price first-row">$${item.price.toFixed(2)}</td>
                <td class="qua-col first-row">
                    <div class="quantity">
                                        <button class="qty-decrease">-</button>

                       <div class="pro-qty" style="width:86px">
                                <input type="text" value="${item.quantity}" class="qty-input">
                        </div>
                                        <button class="qty-increase">+</button>

                    </div>
                </td>
                            <td class="p-price first-row" id="total-item-${item.id}">$${total.toFixed(2)}</td>

               
        `;
        });
        calculateCartTotals()
        document.getElementById("tbody-cart-detail").innerHTML = cartItemsHtml;


        // Set the generated HTML inside the tbody of the cart table
    }
    function calculateCartTotals() {
        console.log(cart)
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

        console.log("Total Price:", totalPrice);
        console.log("Total Quantity:", totalQuantity);
        document.getElementById("subtotal-span").innerHTML = `$${cart.totalPrice}.00`;
        document.getElementById("total-span").innerHTML = `$${cart.totalPrice}.00`;
    }
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
        var priceItem = cartItem.price;
        var totalItem = cartItem.price * quantity
        var existingProduct = cart.find(item => item.id === cartItem.id);
        existingProduct.quantity= quantity;
        existingProduct.total =totalItem;
        console.log(existingProduct)
        document.getElementById(`total-item-${cartItem.id}`).innerHTML = `$${totalItem.toFixed(2)}`

        saveCartToLocalStorage(cart);
        calculateCartTotals();
    }
    function saveCartToLocalStorage(cartData) {
        localStorage.setItem("cart", JSON.stringify(cartData));
    }
})