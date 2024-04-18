<%@page import="models.User"%>
<%@page pageEncoding="UTF-8" %>

<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth == null) {
        // If auth is null, redirect to login.jsp
        response.sendRedirect("login.jsp");
        return; // Stop further execution of the JSP
    }

    // If auth is not null, set it as an attribute for further use
    request.setAttribute("auth", auth);
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


        <!-- Breadcrumb Section Begin -->

        <!-- Breadcrumb Form Section Begin -->

        <!-- Register Section Begin -->

        <!-- Register Form Section End -->
        <!-- Breadcrumb Section Begin -->
        <div class="breacrumb-section">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb-text product-more">
                            <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                            <a href="./shop.html">Shop</a>
                            <span>Check Out</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb Section Begin -->

        <!-- Shopping Cart Section Begin -->
        <section class="checkout-section spad">
            <div class="container">
                <form action="OrderController" method="POST" class="checkout-form">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout-content">
                                <a href="#" class="content-btn">Click Here To Login</a>
                            </div>
                            <h4>Biiling Details</h4>
                            <div class="row">

                                <input type="hidden" name="command" value="ADD" />
                                <div class="col-lg-12">
                                    <label for="cun-name">Full name<span>*</span></label>
                                    <input type="text" id="cun-name" value="Nguyễn Nhất Vương">
                                </div>
                                <div class="col-lg-12">
                                    <label for="cun">Email<span>*</span></label>
                                    <input type="text" id="cun" value="<%=auth.getEmail()%>">
                                </div>
                                <div class="col-lg-12">
                                    <label for="street"> Address<span>*</span></label>
                                    <input type="text" name="address" id="street" class="street-first">
                                </div>

                                <div class="col-lg-12">
                                    <label for="phone">Phone<span>*</span></label>
                                    <input type="text" id="phone" name="phone">
                                </div>
                                <input type="hidden" name="quantity" value="" id="quantity-checkout" />
                                <input type="hidden" name="price" value="" id="price-checkout" />
                                <input type="hidden" name="userId" value="<%=auth.getId()%>"  />
                                <input value="" type="hidden" name="cart" id="cart-detail-checkout">

                                <div class="col-lg-12">
                                    <div class="order-btn">
                                        <button type="submit" value="Save" class="site-btn place-btn">Place Order</button>
                                    </div>
                                </div>
                                <!--<button type="submit" value="Save" class="btn btn-success float-right"><i class="fa fa-plus"></i> Create</button>-->

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="checkout-content">
                                <input type="text" placeholder="Enter Your Coupon Code">
                            </div>
                            <div class="place-order">
                                <h4>Your Order</h4>
                                <div class="order-total">
                                    <ul class="order-table" id="order-table">


                                    </ul>

                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Shopping Cart Section End -->
        <!-- Footer Section Begin -->

        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <%@include file="includes/footer.jsp" %>

    </body>

</html>