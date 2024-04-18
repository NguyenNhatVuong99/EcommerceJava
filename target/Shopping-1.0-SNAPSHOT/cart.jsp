<%@page import="models.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page pageEncoding="UTF-8" %>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }

%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="description" content="Fashi Template">
        <meta name="keywords" content="Fashi, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Fashi | Template</title>

        <%@include file="includes/head.jsp" %>
        <style>
            .username{
                font-size: 16px;
                color: #252525;
                float: left;
                border-right: 1px solid #E5E5E5;
                padding-top: 15px;
                padding-bottom: 15px;
                padding-right: 20px;
            }

            .quantity button {
                width: 46px;
                height: 46px;
                border: none;
                cursor: pointer;
                background-color: #f0f0f0; /* Background color */
                color: #333; /* Text color */
                font-size: 20px;
            }

            .quantity button:hover {
                background-color: #ddd; /* Hover background color */
            }
        </style>
    </head>

    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Header Section Begin -->
        <%@include file="includes/header.jsp" %>

        <!-- Header End -->



        <!-- Register Form Section End -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text product-more">
                            <a href="./home.html"><i class="fa fa-home"></i> Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Shopping Cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Shopping Cart Section Begin -->
        <section class="shopping-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="cart-table">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Image</th>
                                        <th class="p-name">Product Name</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>

                                    </tr>
                                </thead>
                                <tbody id="tbody-cart-detail">


                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="cart-buttons">
                                    <a href="#" class="primary-btn continue-shop">Continue shopping</a>
                                    <a href="#" class="primary-btn up-cart">Update cart</a>
                                </div>
                                <div class="discount-coupon">
                                    <h6>Discount Codes</h6>
                                    <form action="#" class="coupon-form">
                                        <input type="text" placeholder="Enter your codes">
                                        <button type="submit" class="site-btn coupon-btn">Apply</button>
                                    </form>
                                </div>
                            </div>
                            <div class="col-lg-4 offset-lg-4">
                                <div class="proceed-checkout">
                                    <ul>
                                        <li class="subtotal" >Subtotal <span id="subtotal-span">$240.00</span></li>
                                        <li class="cart-total" >Total <span id="total-span">$240.00</span></li>
                                    </ul>
                                    <a href="./checkout.jsp" class="proceed-btn">PROCEED TO CHECK OUT</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <!-- Footer Section Begin -->

        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <%@include file="includes/footer.jsp" %>
        <script src="./static/js/cart.js"></script>
    </body>

</html>