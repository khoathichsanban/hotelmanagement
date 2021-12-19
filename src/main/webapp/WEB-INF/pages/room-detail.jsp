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
        <title>Room Type Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />

        <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
        <script src="<c:url value="/resources/js/popper.min.js" />" ></script>
        <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js" />" ></script>
        <style>
            .rooms-page-item .room-text .room-title {
                overflow: hidden;
                margin-bottom: 18px;
                padding-right: 40px;
                margin-left: 383px;
                font-family: "Suravaram", serif;
            }

            .rooms-page-item .room-text .room-title h2 {
                float: left;
                font-size: 36px;
                color: #2d220f;
                text-align: center;
                color: #cbbe73;
            }
        </style>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <section class="room-section spad">
            <div class="container">
                <div class="rooms-page-item">
                    <div class="row">
                        <div class="col-12 room-text" style="padding-top: 133px">
                            <div class="room-title">
                                <h2>${roomType.name}</h2>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12">
                            <div class="room-item">
                                <div class="room-pic-slider room-pic-item owl-carousel ">
                                    <c:forEach items="${roomType.images}" var="items">
                                        <div class="room-pic">
                                            <img src="${pageContext.request.contextPath}/resources/img/room/${items.name}" alt="" style="height:500px"></a>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row room-text">
                        <div class="col-lg-8 room-desc">
                            <div class="row room-detail">
                                <div class="col-4 features">
                                    Size<br>${roomType.size} m<sup>2</sup>
                                </div> 
                                <div class="col-4 features">
                                    Sleeps<br>${roomType.guest} Guests
                                </div>
                                <div class="col-4 features">
                                    Bed type<br>Double
                                </div>
                            </div>
                            <h2 style="color: #cbbe73;font-family: Suravaram, serif;">Room details</h2>
                            <p>${roomType.description}</p>
                            <p>Price only from <fmt:formatNumber type="number" pattern="###,###VND" value="${roomType.price}" /></p>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <a href="${pageContext.request.contextPath}/search-room?dateFrom=${dateFrom}&dateTo=${dateTo}&roomType=${roomType.id}" class="primary-btn">Book Now <i class="lnr lnr-arrow-right"></i></a>
                            </div> 
                        </div>

                    </div>
                </div>
            </div>
        </section>
        <div>           
            <jsp:include page="include/user/footer.jsp" />


            <jsp:include page="include/user/js-page.jsp" />
    </body>
</html>
