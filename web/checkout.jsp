<%-- 
    Document   : checkout
    Created on : Jun 24, 2022, 11:25:27 AM
    Author     : ASUS
--%>

<%@page import="entity.Cart"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Coffee - Free Bootstrap 4 Template by Colorlib</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Josefin+Sans:400,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Great+Vibes" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%@include file="includes/nav.jsp" %>
        <!-- END nav -->

        <section class="home-slider owl-carousel">

            <div class="slider-item" style="background-image: url(images/bg_3.jpg);" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text justify-content-center align-items-center">

                        <div class="col-md-7 col-sm-12 text-center ftco-animate">
                            <h1 class="mb-3 mt-5 bread">Checkout</h1>
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.jsp">Home</a></span> <span>Checkout</span></p>
                        </div>

                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section">
            <div class="container">
                <div class="row">
                    <div class="col-xl-8 ftco-animate">
                        <form action="#" class="billing-form ftco-bg-dark p-3 p-md-5">
                            <h3 class="mb-4 billing-heading">Billing Details</h3>
                            <div class="row align-items-end">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="firstname">Firt Name</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.firstName}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="lastname">Last Name</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.lastName}" >
                                    </div>
                                </div>
                                <div class="w-100"></div>

                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="streetaddress">Street Address</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.streetAddress}">
                                    </div>
                                </div>

                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="towncity">Town</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.town}">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="postcodezip">City</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.city}">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="phone">Phone</label>
                                        <input type="tel" class="form-control" value="${sessionScope.INUSER.phone}" >
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="emailaddress">Email Address</label>
                                        <input type="text" class="form-control" value="${sessionScope.INUSER.email}">
                                    </div>
                                </div>
                                <div class="w-100"></div>
                                <div class="col-md-12">
                                    <div class="form-group mt-4">
                                        <div class="radio">
                                            <h5 style="color: #C49B63">If you want to delivery to difference address, please refill</h5>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form><!-- END -->



                        <div class="row mt-5 pt-3 d-flex">
                            <div class="col-md-6 d-flex">
                                <div class="cart-detail cart-total ftco-bg-dark p-3 p-md-4">
                                    <% ArrayList<Cart> list = (ArrayList<Cart>) session.getAttribute("LISTITEM");
                                        float sumprice = 0;
                                        float delivery = 0;
                                        float totalPrice = 0;
                                        for (Cart item : list) {
                                            sumprice = sumprice + item.getItemPrice() * item.getQuantity();
                                        }
                                    %>
                                    <h3>Cart Totals</h3>
                                    <p class="d-flex">
                                        <span>Subtotal</span>
                                        <span>$<%=sumprice%></span>
                                    </p>
                                    <p class="d-flex">
                                        <span>Delivery</span>
                                        <c:if test="${empty sessionScope.LISTITEM}">
                                            <span>$${0.0}</span>
                                        </c:if>
                                        <c:if test="${not empty sessionScope.LISTITEM}">
                                            <%

                                                if (sumprice == 0) {
                                            %>

                                            <span> $<%=delivery%></span>
                                            <%
                                            } else {
                                                delivery = (float) 0.5;
                                            %>
                                            <span>$<%=delivery%></span>
                                            <%}%>

                                        </c:if>

                                    </p>
                                    <p class="d-flex">
                                        <span>Discount</span>
                                        <span>10%</span>
                                    </p>
                                    <hr>
                                    <p class="d-flex total-price">
                                        <span>Total</span>
                                        <% totalPrice = sumprice - (sumprice * 10 / 100) + delivery;%>
                                        <span>$<%=totalPrice%></span>
                                        <% if (totalPrice != 0) {
                                                session.setAttribute("TOTALPRICE", totalPrice);
                                            }

                                        %>
                                    </p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="cart-detail ftco-bg-dark p-3 p-md-4">
                                    <h3 class="billing-heading mb-4">Payment Method</h3>
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="radio">
                                                <label><input type="radio" name="optradio" class="mr-2"> Momo Payment</label>
                                                <br/>
                                                <img src="images/momopayment.png" alt="momo-QRcode" style="width: 80%; display: block; margin: 0 auto;"/>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="radio">
                                                <label><input type="radio" name="optradio" class="mr-2"> Payment on delivery</label>
                                            </div>
                                        </div>
                                    </div>
                                    
                                     <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="radio">
                                                <label><a href="paypal.jsp">PayPal PayMent</a> </label>
                                            </div>
                                        </div>
                                    </div>




                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <div class="checkbox">
                                                <label><input type="checkbox" value="" class="mr-2"> I have read and accept the terms and conditions</label>
                                            </div>
                                        </div>
                                    </div>
                                    <p><a href="placeOrder" class="btn btn-primary py-3 px-4">Place an order</a></p>
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-top: 50px" >
                               
                            </div>    


                        </div>
                    </div> <!-- .col-md-8 -->



                    <div class="col-xl-4 sidebar ftco-animate">
                        <div class="sidebar-box">
                            <form action="#" class="search-form">
                                <div class="form-group">
                                    <div class="icon">
                                        <span class="icon-search"></span>
                                    </div>
                                    <input type="text" class="form-control" placeholder="Search...">
                                </div>
                            </form>
                        </div>
                        <div class="sidebar-box ftco-animate">
                            <div class="categories">
                                <h3>Categories</h3>
                                <li><a href="#">Tour <span>(12)</span></a></li>
                                <li><a href="#">Hotel <span>(22)</span></a></li>
                                <li><a href="#">Coffee <span>(37)</span></a></li>
                                <li><a href="#">Drinks <span>(42)</span></a></li>
                                <li><a href="#">Foods <span>(14)</span></a></li>
                                <li><a href="#">Travel <span>(140)</span></a></li>
                            </div>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3>Recent Blog</h3>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_3.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3>Tag Cloud</h3>
                            <div class="tagcloud">
                                <a href="#" class="tag-cloud-link">dish</a>
                                <a href="#" class="tag-cloud-link">menu</a>
                                <a href="#" class="tag-cloud-link">food</a>
                                <a href="#" class="tag-cloud-link">sweet</a>
                                <a href="#" class="tag-cloud-link">tasty</a>
                                <a href="#" class="tag-cloud-link">delicious</a>
                                <a href="#" class="tag-cloud-link">desserts</a>
                                <a href="#" class="tag-cloud-link">drinks</a>
                            </div>
                        </div>

                        <div class="sidebar-box ftco-animate">
                            <h3>Paragraph</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
                        </div>
                    </div>

                </div>
            </div>
        </section> <!-- .section -->

        <footer class="ftco-footer ftco-section img">
            <div class="overlay"></div>
            <div class="container">
                <div class="row mb-5">
                    <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">About Us</h2>
                            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft mt-5">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Recent Blog</h2>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_1.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                            <div class="block-21 mb-4 d-flex">
                                <a class="blog-img mr-4" style="background-image: url(images/image_2.jpg);"></a>
                                <div class="text">
                                    <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about</a></h3>
                                    <div class="meta">
                                        <div><a href="#"><span class="icon-calendar"></span> Sept 15, 2018</a></div>
                                        <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                                        <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4 ml-md-4">
                            <h2 class="ftco-heading-2">Services</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">Cooked</a></li>
                                <li><a href="#" class="py-2 d-block">Deliver</a></li>
                                <li><a href="#" class="py-2 d-block">Quality Foods</a></li>
                                <li><a href="#" class="py-2 d-block">Mixed</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 mb-5 mb-md-5">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Have a Questions?</h2>
                            <div class="block-23 mb-3">
                                <ul>
                                    <li><span class="icon icon-map-marker"></span><span class="text">203 Fake St. Mountain View, San Francisco, California, USA</span></li>
                                    <li><a href="#"><span class="icon icon-phone"></span><span class="text">+2 392 3929 210</span></a></li>
                                    <li><a href="#"><span class="icon icon-envelope"></span><span class="text">info@yourdomain.com</span></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="js/scrollax.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

        <script>
                                $(document).ready(function () {

                                    var quantitiy = 0;
                                    $('.quantity-right-plus').click(function (e) {

                                        // Stop acting like a button
                                        e.preventDefault();
                                        // Get the field name
                                        var quantity = parseInt($('#quantity').val());

                                        // If is not undefined

                                        $('#quantity').val(quantity + 1);


                                        // Increment

                                    });

                                    $('.quantity-left-minus').click(function (e) {
                                        // Stop acting like a button
                                        e.preventDefault();
                                        // Get the field name
                                        var quantity = parseInt($('#quantity').val());

                                        // If is not undefined

                                        // Increment
                                        if (quantity > 0) {
                                            $('#quantity').val(quantity - 1);
                                        }
                                    });

                                });
        </script>


    </body>
</html>
