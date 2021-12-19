<%-- 
    Document   : home1
    Created on : Oct 23, 2021, 8:29:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rooms Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <section class="hero-section set-bg" data-setbg="<c:url value="/resources/img/rooms-bg.jpg"/>">
            <div class="hero-text">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1>Rooms</h1>
                        </div>
                    </div>
                    <div class="page-nav">
                        <a href="about-us" class="left-nav"><i class="lnr lnr-arrow-left"></i> About</a>
                        <a href="service" class="right-nav">Services <i class="lnr lnr-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </section>
        <!-- Hero Section End -->
        <!-- About Room Section Begin -->
        <section class="room-section spad">
            <div class="container">
                <div class="rooms-page-item" >
                    <div class="row" >
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
                    <br><br>
                </div>
            </div>
        </section>
        <jsp:include page="include/user/footer.jsp" />


        <jsp:include page="include/user/js-page.jsp" />
    </body>
</html>
