<%-- 
    Document   : home1
    Created on : Oct 23, 2021, 8:29:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />

        <style>
            h1, h2, h3, h4, h5 {
                color: #000;
                font-family: "Playfair Display", times, serif;
            }
            a{
                color: #b99365;
            }
        </style>

    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <!-- Hero Slider Begin -->
        <div class="hero-slider">
            <div class="slider-item">
                <div class="single-slider-item set-bg" data-setbg="<c:url value="/resources/img/room/rooms-4.jpg"/>">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-12">
                                <h1>We hope you’ll enjoy <br />your stay.</h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="slider-nav">
                                    <a href="#" class="single-slider-nav">
                                        <img src="<c:url value="/resources/img/nav-1.jpg"/>" alt="">
                                        <div class="nav-text active">
                                            <p>Pool<i class="lnr lnr-arrow-right"></i></p>
                                        </div>
                                    </a>
                                    <a href="#" class="single-slider-nav">
                                        <img src="<c:url value="/resources/img/nav-2.jpg"/>" alt="">
                                        <div class="nav-text">
                                            <p>Sauna<i class="lnr lnr-arrow-right"></i></p>
                                        </div>
                                    </a>
                                    <a href="#" class="single-slider-nav last">
                                        <img src="<c:url value="/resources/img/nav-3.jpg"/>" alt="">
                                        <div class="nav-text">
                                            <p>Restaurant<i class="lnr lnr-arrow-right"></i></p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero Slider End -->

        <!-- Room Availability Section Begin -->
        <section class="room-availability spad">
            <div class="container">
                <div class="room-check">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="side-bar">
                                <div class="categories-item">
                                    <h4>Rooms</h4>
                                    <div class="categories-list">
                                        <ul>
                                            <c:forEach items="${roomTypes}" var="items">
                                                <li><a href="view-detail/${items.id}">${items.name}</a></li>  
                                                </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="check-form">
                                <h2>Check Availability</h2>
                                <form action="${pageContext.request.contextPath}/search-room" 
                                      method ="get" id="search-form">
                                    <div class="datepicker">
                                        <div class="date-select">
                                            <p>From</p>
                                            <input type="text" class="datepicker-1" value="dd / mm / yyyy" name="dateFrom" id="dateFrom">
                                            <img src="<c:url value="/resources/img/calendar.png"/>" alt="">
                                            <span style="font-size: 12px; color: red" class="form-message"></span>
                                        </div>
                                        <div class="date-select to">
                                            <p>To</p>
                                            <input type="text" class="datepicker-2" value="dd / mm / yyyy" name="dateTo" id="dateTo">
                                            <img src="<c:url value="/resources/img/calendar.png"/>" alt=""">
                                            <span style="font-size: 12px; color: red" class="form-message"></span>
                                        </div>
                                    </div>
                                    <div class="room-selector">
                                        <p>Room Type</p>

                                        <select class="suit-select" name="roomType"> 
                                            <c:forEach items="${roomTypes}" var="items" >
                                                <option value="${items.id}">${items.name}</option> 
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <button type="submit">CHECK Availability <i class="lnr lnr-arrow-right"></i></button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="room-section spad">
                    <div class="container">
                        <div class="rooms-page-item">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="section-title">
                                        <h1>Our Rooms</h1>
                                    </div>
                                </div> 
                                <c:forEach items="${roomTypes}" var="items">
                                    <div class="col-lg-6" style="margin-bottom: 20px">
                                        <div class="room-pic-slider room-pic-item owl-carousel">
                                            <c:forEach var="image" items="${items.images}" varStatus="index">
                                                <c:if test="${index.first}">
                                                    <div class="single-room-pic">
                                                        <c:if test="${image.name.startsWith('http') != null && image.name.startsWith('http') == true}">
                                                            <a href="#"> <img src="<c:url value="${image.name}" />" alt="" style="width:100%"></a>
                                                            </c:if>
                                                            <c:if test="${image.name.startsWith('http') == null || image.name.startsWith('http') == false}">
                                                            <a href="#"> <img src="${pageContext.request.contextPath}/resources/img/room/${image.name}" alt="" style="width:100%"></a>
                                                            </c:if>
                                                    </div>
                                                </c:if>
                                                <c:if test="${not index.first}">
                                                    <div class="single-room-pic">
                                                        <c:if test="${image.name.startsWith('http') != null && image.name.startsWith('http') == true}">
                                                            <a href="#"> <img src="<c:url value="${image.name}" />" alt="" style="width:100%"></a>
                                                            </c:if>
                                                            <c:if test="${image.name.startsWith('http') == null || image.name.startsWith('http') == false}">
                                                            <a href="#"> <img src="${pageContext.request.contextPath}/resources/img/room/${image.name}" alt="" style="width:100%"></a>
                                                            </c:if>
                                                    </div>
                                                </c:if>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="col-lg-6">
                                        <div class="room-text">
                                            <div class="room-title">
                                                <h2>${items.name}</h2>
                                                <div class="room-price">
                                                    <span>From</span>
                                                    <h5><fmt:formatNumber type="number" pattern="###,###VND" value="${items.price}" /></h5>
                                                    <sub>/night</sub>
                                                </div>
                                            </div>
                                            <div class="room-features">
                                                <div class="room-info">
                                                    <i class="flaticon-019-television"></i>
                                                    <span>Smart TV</span>
                                                </div>
                                                <div class="room-info">
                                                    <i class="flaticon-029-wifi"></i>
                                                    <span>High Wi-fii</span>
                                                </div>
                                                <div class="room-info">
                                                    <i class="flaticon-003-air-conditioner"></i>
                                                    <span>AC</span>
                                                </div>
                                                <div class="room-info">
                                                    <i class="flaticon-036-parking"></i>
                                                    <span>Parking</span>
                                                </div>
                                                <div class="room-info last">
                                                    <i class="flaticon-007-swimming-pool"></i>
                                                    <span>Pool</span>
                                                </div>
                                            </div>
                                            <a href="view-detail/${items.id}" class="primary-btn">View Detail <i class="lnr lnr-arrow-left"></i></a>
                                            <a href="search-room?dateFrom=${dateFrom}&dateTo=${dateTo}&roomType=${items.id}" class="primary-btn">Book Now <i class="lnr lnr-arrow-right"></i></a>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="about-room">
                    <div class="row">
                        <div class="col-lg-10 offset-lg-1">
                            <h2>“Customers may forget what you said  but they will never forget how you made themfeel”.</h2>
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
        </section>
        <!-- Room Availability Section End -->

        <!-- Facilities Section Begin -->
        <div class="facilities-section spad">
            <div class="container">
                <div class="facilities-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="section-title">
                                <h1>Facilities</h1>
                            </div>
                        </div>
                        <div class="col-lg-6 p-0">
                            <div class="facilities-img set-bg" data-setbg="<c:url value="/resources/img/facilities-1.jpg"/>"></div>
                        </div>
                        <div class="col-lg-6 p-0 ">
                            <div class="facilities-text-warp">
                                <div class="facilities-text">
                                    <h2>Wellness Center</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipis-cing elit. Mauris tincidunt consectetur
                                        turpis, eget consequat.</p>
                                    <a href="#" class="primary-btn fac-btn">Visit Center <i class="lnr lnr-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 p-0 order-lg-1 order-2">
                            <div class="facilities-text-warp">
                                <div class="facilities-text">
                                    <h2>Wellness Center</h2>
                                    <p>Lorem ipsum dolor sit amet, consectetur adipis-cing elit. Mauris tincidunt consectetur
                                        turpis, eget consequat.</p>
                                    <a href="#" class="primary-btn fac-btn">Visit Center <i class="lnr lnr-arrow-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6 p-0 order-lg-2 order-1">
                            <div class="facilities-img set-bg" data-setbg="<c:url value="/resources/img/facilities-2.jpg"/>"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Facilities Section End -->

        <div class="testimonial-section spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="section-title">
                            <h1>Guestbook</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="testimonial-item">
                            <div class="tab-content">
                                <div class="tab-pane fade-in active" id="testimonial-1" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="testimonial-2" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It2</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="testimonial-3" role="tabpanel">
                                    <div class="single-testimonial-item">
                                        <span class="test-date">02/02/2019</span>
                                        <div class="test-rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <h4>Loved It3</h4>
                                        <p>Lorem ipsum dolor sit amet, consectetur adipiselit. Vivamus libero mauris,
                                            bibendum eget sapien ac, ultrices rhoncus ipsum. Donec nec sapien in urna
                                            fermentum ornare.</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="testimonial-author-item">
                            <ul class="nav" role="tablist">
                                <li>
                                    <a data-toggle="tab" href="#testimonial-1" role="tab" class="show active">
                                        <div class="author-pic">
                                            <img src="<c:url value="/resources/img/testimonial/author-1.jpg"/>" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#testimonial-2" role="tab">
                                        <div class="author-pic">
                                            <img src="<c:url value="/resources/img/testimonial/author-2.jpg"/>" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                                <li>
                                    <a data-toggle="tab" href="#testimonial-3" role="tab">
                                        <div class="author-pic">
                                            <img src="<c:url value="/resources/img/testimonial/author-3.jpg"/>" alt="">
                                        </div>
                                        <div class="author-text">
                                            <h5>John Doe <span>Berlin</span></h5>
                                        </div>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Follow Instagram Section Begin -->
        <section class="follow-instagram">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Follow us on Instagram @yourhotel</h2>
                    </div>
                </div>
            </div>
        </section>
        <!-- Follow Instagram Section End -->

        <!-- Footer Room Pic Section Begin -->
        <div class="footer-room-pic">
            <div class="container-fluid">
                <div class="row">
                    <img src="<c:url value="/resources/img/room-footer-pic/room-1.jpg"/>" alt="">
                    <img src="<c:url value="/resources/img/room-footer-pic/room-2.jpg"/>" alt="">
                    <img src="<c:url value="/resources/img/room-footer-pic/room-3.jpg"/>" alt="">
                    <img src="<c:url value="/resources/img/room-footer-pic/room-4.jpg"/>" alt="">
                </div>
            </div>
        </div>


        <!-- Footer Room Pic Section End -->
        <jsp:include page="include/user/footer.jsp" />

        <script src="${pageContext.request.contextPath}/resources/js/validator.js" type="text/javascript"></script>
        <script src="${pageContext.request.contextPath}/resources/js/validationDate.js" type="text/javascript"></script>
        <script>

            Validator({
                form: '#search-form',
                rules: [
                    Validator.isCheckIn('#dateFrom'),
                    Validator.isCheckOut('#dateTo')
                ]
            });
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="Stylesheet"type="text/css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>

<!--        <script src="<c:url value="/resources/js/validator.js"/>"></script>-->
        <jsp:include page="include/user/js-page.jsp" />

    </body>



</html>
