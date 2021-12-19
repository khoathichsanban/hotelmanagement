<%-- 
    Document   : home1
    Created on : Oct 23, 2021, 8:29:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <!-- Hero Section Begin -->
        <section class="hero-section set-bg" data-setbg="<c:url value="/resources/img/about-us-bg.jpg"/>">
            <div class="hero-text">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>About</h1>
                        </div>
                    </div>
                    <div class="page-nav">
                        <a href="home" class="left-nav"><i class="lnr lnr-arrow-left"></i> Home</a>
                        <a href="rooms" class="right-nav">Rooms <i class="lnr lnr-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->
        <!-- About Room Section Begin -->
        <div class="about-us-room spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-10 offset-lg-1">
                        <h2>“Customers may forget what you said  but they will never forget how you made them
                            feel”.</h2>
                    </div>
                </div>
                <div class="about-para">
                    <div class="row">
                        <div class="col-lg-6">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero mauris,
                                bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna fermentum
                                ornare. Morbi vel ultrices leo. Sed eu turpis eu arcu vehicula fringilla ut vitae
                                orci. Suspendisse maximus malesuada</p>
                        </div>
                        <div class="col-lg-6">
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at vulputate est.
                                Donec tempor felis at nibh eleifend malesuada. Nullam suscipit lobortis aliquam.
                                Phasellus lobortis ante lorem, vitae scelerisque lacus tempus sed. Phasellus rutrum
                                magna </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Room Section End -->

        <!-- Video Tour Section Begin -->
        <section class="video-tour set-bg" data-setbg="<c:url value="/resources/img/video-bg.jpg"/>">
            <div class="container">
                <div class="video-text">
                    <div class="row">
                        <div class="col-lg-5">
                            <h2>Video Hotel Tour</h2>
                        </div>
                    </div>
                    <div class="video-play-btn">
                        <a href="https://www.youtube.com/watch?v=yUCc9euiPn4&ab_channel=DigitalTravelVideos" class="pop-up"><i class="fa fa-play"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Video Tour Section End -->

        <!-- Gallery Section Begin -->
        <section class="gallery-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="gallery-text">
                            <h2>Hotel Gallery</h2>
                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus libero mauris, bibendum eget
                                sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna fermentum ornare. Morbi vel
                                ultrices leo. Sed eu turpis eu arcu vehicula fringilla ut vitae orci.</p>
                            <a href="#" class="primary-btn">View Gallery <i class="lnr lnr-arrow-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row">
                            <div class="col-lg-6 col-md-3 col-sm-6">
                                <div class="gallery-img">
                                    <img src="<c:url value="/resources/img/gallery/gallery-1.jpg"/>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-3 col-sm-6">
                                <div class="gallery-img">
                                    <img src="<c:url value="/resources/img/gallery/gallery-2.jpg"/>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-3 col-sm-6">
                                <div class="gallery-img">
                                    <img src="<c:url value="/resources/img/gallery/gallery-3.jpg"/>" alt="">
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-3 col-sm-6">
                                <div class="gallery-img">
                                    <img src="<c:url value="/resources/img/gallery/gallery-4.jpg"/>" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Gallery Section End -->

        <!-- Staff Section End -->
        <section class="staff-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h2>Our Staff</h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-staff-item">
                            <div class="staff-img">
                                <img src="<c:url value="/resources/img/staff/staff-1.jpg"/>" alt="">
                            </div>
                            <div class="staff-text">
                                <h5>Sarah Doe</h5>
                                <span>Hotel Manager</span>
                                <a href="#"><i class="lnr lnr-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-staff-item">
                            <div class="staff-img">
                                <img src="<c:url value="/resources/img/staff/staff-2.jpg"/>" alt="">
                            </div>
                            <div class="staff-text">
                                <h5>Jessica Doe</h5>
                                <span>Reception Manager</span>
                                <a href="#"><i class="lnr lnr-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="single-staff-item">
                            <div class="staff-img">
                                <img src="<c:url value="/resources/img/staff/staff-3.jpg"/>" alt="">
                            </div>
                            <div class="staff-text">
                                <h5>Jessica Doe</h5>
                                <span>It</span>
                                <a href="#"><i class="lnr lnr-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Staff Section End -->
        <jsp:include page="include/user/footer.jsp" />


        <jsp:include page="include/user/js-page.jsp" />
    </body>
</html>
