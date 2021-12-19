<%-- 
    Document   : view-room
    Created on : Nov 4, 2021, 8:52:42 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            a{
                color: #b99365;
            }
            h1, h2, h3, h4, h5 {
                color: #000;
                font-family: "Playfair Display", times, serif;
            }
            .btn-primary {
                background-color: #b99365;
                border-color: #b99365;
            }


        </style>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <div class="container">
            <section class="room-section spad" style="padding-top:200px">
                <div class="check-form" style="margin-right: 300px; padding-bottom: 0px; padding-top: 20px">
                    <form action="${pageContext.request.contextPath}/search-room-1" 
                          method ="get" id="search-form">
                        <div class="datepicker" style="margin-bottom: 0px">
                            <div class="row">
                                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                                    <div class= "date-select">
                                        <p>From</p>
                                        <input type="text" class="datepicker-1" placeholder="dd / mm / yyyy" value="${dateFrom}" name="dateFrom" id="dateFrom">
                                        <img src="<c:url value="/resources/img/calendar.png"/>" alt="">
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                                    <div class="date-select to">
                                        <p>To</p>
                                        <input type="text" class="datepicker-2" placeholder="dd / mm / yyyy" value="${dateTo}" name="dateTo" id="dateTo">
                                        <img src="<c:url value="/resources/img/calendar.png"/>" alt=""">
                                    </div> 
                                </div>
                                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                                    <div class="room-selector">
                                        <p>Room Type</p>
                                        <select class="suit-select" name="roomType"> 
                                            <c:forEach items="${roomTypes}" var="items" >
                                                <option value="${items.id}">${items.name}</option> 
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 mb-3 mb-lg-0 col-lg-3">
                                    <button type="submit">CHECK Availability <i class="lnr lnr-arrow-right"></i></button>
                                </div>                    
                            </div>
                        </div>
                    </form>
                </div>
                <div class="site-section">
                    <div class="row ">
                        <c:forEach items="${room}" var="items">
                            <div class="col-md-4 mb-4 item">
                                <div class="media d-block room mb-0">
                                    <figure>
                                        <div class="room-item" style="width: 361px">
                                            <div class="room-pic-slider room-pic-item owl-carousel">
                                                <c:forEach items="${items.roomType.images}" var="image">
                                                    <img src="${pageContext.request.contextPath}/resources/img/room/${image.name}" alt=""  class="img-fluid"></a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="overlap-text">
                                            <span>
                                                Featured Room 
                                                <span class="ion-ios-star"></span>
                                                <span class="ion-ios-star"></span>
                                                <span class="ion-ios-star"></span>
                                            </span>
                                        </div>
                                    </figure>
                                    <div class="media-body">
                                        <h3 class="mt-0"><a href="#">${items.roomType.name} ${items.roomNumber}</a></h3>
                                        <ul class="room-specs">
                                            <li><span class="ion-ios-people-outline"></span>${items.roomType.guest}</li>
                                            <li><span class="ion-ios-crop"></span>${items.roomType.size} m <sup>2</sup></li>
                                        </ul>
                                        <p><fmt:formatNumber type="number" pattern="###,###VND" value="${items.roomType.price}" /></p>
                                        <p><a href="add/${items.roomType.id}/${items.id}" class="btn btn-primary btn-sm">Book Now</a></p>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </div>
        <script src="${pageContext.request.contextPath}/resources/js/validator.js" type="text/javascript"></script>
        <script>

                              Validator({
                                  form: '#search-form',
                                  rules: [
                                      Validator.isCheckIn('#dateFrom'),
                                      Validator.isCheckOut('#dateTo')
                                  ]
                              });
        </script>


        <jsp:include page="include/user/footer.jsp" />


        <jsp:include page="include/user/js-page.jsp" />
    </body>
</html>
