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
        <meta name="description" content="MVC Shop">
        <meta name="keywords" content="MVC, unica, creative, html">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="icon" type="image/x-icon" href="./static/img/logo99.png">

        <title>MVC Shop</title>

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

        <!-- Hero Section Begin -->
        <section class="hero-section">
            <div class="hero-items owl-carousel">
                <div class="single-hero-items set-bg" data-setbg="./static/img/hero-1.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <span>Bag,kids</span>
                                <h1>Black friday</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore</p>
                                <a href="#" class="primary-btn">Shop Now</a>
                            </div>
                        </div>
                        <div class="off-card">
                            <h2>Sale <span>50%</span></h2>
                        </div>
                    </div>
                </div>
                <div class="single-hero-items set-bg" data-setbg="./static/img/hero-2.jpg">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-5">
                                <span>Bag,kids</span>
                                <h1>Black friday</h1>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore</p>
                                <a href="#" class="primary-btn">Shop Now</a>
                            </div>
                        </div>
                        <div class="off-card">
                            <h2>Sale <span>50%</span></h2>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->

        <!-- Banner Section Begin -->
        <div class="banner-section spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="./static/img/banner-1.jpg" alt="">
                            <div class="inner-text">
                                <h4>Men’s</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="./static/img/banner-2.jpg" alt="">
                            <div class="inner-text">
                                <h4>Women’s</h4>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="single-banner">
                            <img src="./static/img/banner-3.jpg" alt="">
                            <div class="inner-text">
                                <h4>Kid’s</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->

        <!-- Women Banner Section Begin -->
        <section class="women-banner spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="product-large set-bg" data-setbg="./static/img/products/women-large.jpg">
                            <h2>Women’s</h2>
                            <a href="#">Discover More</a>
                        </div>
                    </div>
                    <div class="col-lg-8 offset-lg-1">
                        <div class="filter-control">
                            <ul>
                                <li class="active">Clothings</li>
                                <li>HandBag</li>
                                <li>Shoes</li>
                                <li>Accessories</li>
                            </ul>
                        </div>
                        <div class="product-slider owl-carousel">
                            <c:forEach var="item" items="${productList}">

                                <div class="product-item">
                                    <div class="pi-pic">
                                        <img src="${item.image}" alt="">
                                        <div class="sale">Sale</div>
                                        <div class="icon">
                                            <i class="icon_heart_alt"></i>
                                        </div>
                                        <ul>
                                            <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                            <li class="quick-view"><a href="#">+ Quick View</a></li>
                                            <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="pi-text">
                                        <div class="catagory-name">${item.category}</div>
                                        <a href="#">
                                            <h5>${item.name}</h5>
                                        </a>
                                        <div class="product-price">
                                            ${item.price}
                                            <span>$35.00</span>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>


                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Women Banner Section End -->

        <!-- Deal Of The Week Section Begin-->
        <section class="deal-of-week set-bg spad" data-setbg="./static/img/time-bg.jpg">
            <div class="container">
                <div class="col-lg-6 text-center">
                    <div class="section-title">
                        <h2>Deal Of The Week</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed<br /> do ipsum dolor sit amet,
                            consectetur adipisicing elit </p>
                        <div class="product-price">
                            $35.00
                            <span>/ HanBag</span>
                        </div>
                    </div>
                    <div class="countdown-timer" id="countdown">
                        <div class="cd-item">
                            <span>56</span>
                            <p>Days</p>
                        </div>
                        <div class="cd-item">
                            <span>12</span>
                            <p>Hrs</p>
                        </div>
                        <div class="cd-item">
                            <span>40</span>
                            <p>Mins</p>
                        </div>
                        <div class="cd-item">
                            <span>52</span>
                            <p>Secs</p>
                        </div>
                    </div>
                    <a href="#" class="primary-btn">Shop Now</a>
                </div>
            </div>
        </section>
        <!-- Deal Of The Week Section End -->

        <!-- Man Banner Section Begin -->
        <section class="man-banner spad">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="filter-control">
                            <ul>
                                <li class="active">Clothings</li>
                                <li>HandBag</li>
                                <li>Shoes</li>
                                <li>Accessories</li>
                            </ul>
                        </div>
                        <div class="product-slider owl-carousel">
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img src="./static/img/products/man-1.jpg" alt="">
                                    <div class="sale">Sale</div>
                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">Coat</div>
                                    <a href="#">
                                        <h5>Pure Pineapple</h5>
                                    </a>
                                    <div class="product-price">
                                        $14.00
                                        <span>$35.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img src="./static/img/products/man-2.jpg" alt="">
                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">Shoes</div>
                                    <a href="#">
                                        <h5>Guangzhou sweater</h5>
                                    </a>
                                    <div class="product-price">
                                        $13.00
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img src="./static/img/products/man-3.jpg" alt="">
                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">Towel</div>
                                    <a href="#">
                                        <h5>Pure Pineapple</h5>
                                    </a>
                                    <div class="product-price">
                                        $34.00
                                    </div>
                                </div>
                            </div>
                            <div class="product-item">
                                <div class="pi-pic">
                                    <img src="./static/img/products/man-4.jpg" alt="">
                                    <div class="icon">
                                        <i class="icon_heart_alt"></i>
                                    </div>
                                    <ul>
                                        <li class="w-icon active"><a href="#"><i class="icon_bag_alt"></i></a></li>
                                        <li class="quick-view"><a href="#">+ Quick View</a></li>
                                        <li class="w-icon"><a href="#"><i class="fa fa-random"></i></a></li>
                                    </ul>
                                </div>
                                <div class="pi-text">
                                    <div class="catagory-name">Towel</div>
                                    <a href="#">
                                        <h5>Converse Shoes</h5>
                                    </a>
                                    <div class="product-price">
                                        $34.00
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 offset-lg-1">
                        <div class="product-large set-bg m-large" data-setbg="./static/img/products/man-large.jpg">
                            <h2>Men’s</h2>
                            <a href="#">Discover More</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Man Banner Section End -->

        <!-- Instagram Section Begin -->
        <div class="instagram-photo">
            <div class="insta-item set-bg" data-setbg="./static/img/insta-1.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
            <div class="insta-item set-bg" data-setbg="./static/img/insta-2.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
            <div class="insta-item set-bg" data-setbg="./static/img/insta-3.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
            <div class="insta-item set-bg" data-setbg="./static/img/insta-4.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
            <div class="insta-item set-bg" data-setbg="./static/img/insta-5.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
            <div class="insta-item set-bg" data-setbg="./static/img/insta-6.jpg">
                <div class="inside-text">
                    <i class="ti-instagram"></i>
                    <h5><a href="#">colorlib_Collection</a></h5>
                </div>
            </div>
        </div>
        <!-- Instagram Section End -->

        <!-- Latest Blog Section Begin -->
        <section class="latest-blog spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>From The Blog</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-blog">
                            <img src="./static/img/latest-1.jpg" alt="">
                            <div class="latest-text">
                                <div class="tag-list">
                                    <div class="tag-item">
                                        <i class="fa fa-calendar-o"></i>
                                        May 4,2019
                                    </div>
                                    <div class="tag-item">
                                        <i class="fa fa-comment-o"></i>
                                        5
                                    </div>
                                </div>
                                <a href="#">
                                    <h4>The Best Street Style From London MVCon Week</h4>
                                </a>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-blog">
                            <img src="./static/img/latest-2.jpg" alt="">
                            <div class="latest-text">
                                <div class="tag-list">
                                    <div class="tag-item">
                                        <i class="fa fa-calendar-o"></i>
                                        May 4,2019
                                    </div>
                                    <div class="tag-item">
                                        <i class="fa fa-comment-o"></i>
                                        5
                                    </div>
                                </div>
                                <a href="#">
                                    <h4>Vogue's Ultimate Guide To Autumn/Winter 2019 Shoes</h4>
                                </a>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-latest-blog">
                            <img src="./static/img/latest-3.jpg" alt="">
                            <div class="latest-text">
                                <div class="tag-list">
                                    <div class="tag-item">
                                        <i class="fa fa-calendar-o"></i>
                                        May 4,2019
                                    </div>
                                    <div class="tag-item">
                                        <i class="fa fa-comment-o"></i>
                                        5
                                    </div>
                                </div>
                                <a href="#">
                                    <h4>How To Brighten Your Wardrobe With A Dash Of Lime</h4>
                                </a>
                                <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="benefit-items">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="single-benefit">
                                <div class="sb-icon">
                                    <img src="./static/img/icon-1.png" alt="">
                                </div>
                                <div class="sb-text">
                                    <h6>Free Shipping</h6>
                                    <p>For all order over 99$</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="single-benefit">
                                <div class="sb-icon">
                                    <img src="./static/img/icon-2.png" alt="">
                                </div>
                                <div class="sb-text">
                                    <h6>Delivery On Time</h6>
                                    <p>If good have prolems</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="single-benefit">
                                <div class="sb-icon">
                                    <img src="./static/img/icon-1.png" alt="">
                                </div>
                                <div class="sb-text">
                                    <h6>Secure Payment</h6>
                                    <p>100% secure payment</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Latest Blog Section End -->

        <!-- Partner Logo Section Begin -->

        <!-- Partner Logo Section End -->

        <!-- Footer Section Begin -->

        <!-- Footer Section End -->

        <!-- Js Plugins -->
        <%@include file="includes/footer.jsp" %>

    </body>

</html>