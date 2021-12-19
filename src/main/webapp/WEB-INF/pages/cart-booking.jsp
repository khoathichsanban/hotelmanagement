<%-- 
    Document   : view-room
    Created on : Nov 4, 2021, 8:52:42 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@page import = "java.util.logging.Logger" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Booking Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <script src="<c:url value="/resources/js/removebooking.js"/>"></script>

        <style>
            a {
                color: #b99365;
                font-size: 20px;
            }
            .col-md-6 {
                margin-right: -25px;
                padding: 0;
            }
            .btn.btn-primary.btn-sm{
                background-color: #b99365;
                border-color: #b99365;
                margin-top:90px;
                font-size: 20px;
                margin-right: -400px;
            }
            .header-booking{
                text-align: center;
                border: 1px solid;
                background-color: #f4f4f4;
                border-color: #b99365;
                padding: 10px;
            }
            .total-booking{
                border: 1px solid;
                background-color: #f4f4f4;
                border-color: #b99365;
                padding: 20px;
                float: right;
                width: 400px;
                margin-top: 25px;
                margin-right: -17px
            }
            .button-redirect{
                margin-top: 180px;
            }
            .list-booking{
                border: 1px solid;
                background-color: #f4f4f4;
                border-color: #b99365;
                margin-top: 40px;
            }
        </style>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />

        <section class="room-section spad" style="padding-top: 210px">
            <div class="container" style="margin-bottom: 200px;">
                <div class="row header-booking">
                    <div class="col-12">
                        <h2>YOUR BOOKING</h2>  
                    </div>

                    <div class="col-lg-6">
                        <p><b>Check-in</b><br>After 2:00 PM<br>${dateFrom}</p>
                    </div>
                    <div class="col-lg-6">
                        <p><b>Check-out</b><br>Before 11:30 AM<br>${dateTo}</p>
                    </div>
                    <div class="col-12">    
                        <c:set var = "now" value = "${bookingDate}" />
                        <p><b>Booking date: </b><fmt:formatDate pattern = "MM/dd/yyyy" value = "${now}" /></p>
                    </div>
                </div>
                <div class="row list-booking">
                    <div class="col-12">
                        <table class="table" style="width:100%">
                            <thead>
                                <tr>
                                    <th>Room Name</th>   
                                    <th>Guests</th>
                                    <th>Room price</th>
                                    <th>Service</th>
                                    <th>Unit price</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody id="load-booking">
                                <c:forEach items="${sessionScope.myBookings}" var="map" varStatus="itemStatus"> 
                                    <tr>
                                        <td>${map.value.room.roomType.name} ${map.value.room.roomNumber} </td>                                
                                        <td>${map.value.room.roomType.guest} Adult</td> 
                                        <td><fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.room.roomType.price}" /></td>   
                                        <td>
                                            <c:forEach items="${map.value.serviceBooking}" var="carts">
                                                <c:set var="c" value="${c+carts.service.price *carts.quantity}"></c:set>  
                                                    <ul>
                                                        <li>${carts.service.name} (${carts.quantity})
                                                        - <fmt:formatNumber type="number" pattern="###,###VND" value="${carts.service.price}" /></li>
                                                </ul>
                                            </c:forEach>
                                        </td>            
                                        <td>
                                            <c:if test="${map.value.serviceBooking==null}">
                                                <fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.room.roomType.price}"/>
                                            </c:if>
                                            <c:if test="${map.value.serviceBooking!=null}">
                                                <fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.price}"/>
                                            </c:if>
                                        </td>                 
                                        <td>
                                            <a href="${pageContext.request.contextPath}/remove/${map.value.room.roomType.id}/${map.value.room.id}">
                                                <i class="fa fa-trash-o" style="border-right: 2px solid; padding-right: 3px">Remove</i></a>
                                            <a href="${pageContext.request.contextPath}/service/${map.key}">

                                                <i class="fa fa-plus-circle">Add Service</i></a> 
                                        </td>
                                    </tr> 
                                </c:forEach>     
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="row total-booking">
                    <div class="col-lg-12">
                        <table class="table table-borderless">
                            <tr>
                                <th >Total room</th>
                                <th>Total service</th>
                                <th>Amount</th>
                            </tr>
                            <tr>
                                <td><fmt:formatNumber type="number" pattern="###,###VND" value="${sessionScope.myCartTotal}" /></td>
                                <td><fmt:formatNumber type="number" pattern="###,###VND" value="${c}" /></td>
                                <td><fmt:formatNumber type="number" pattern="###,###VND" value="${myCartTotal + c}" /></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="row button-redirect"> 
                    <div class="col-lg-6" >
                        <p><a href="${pageContext.request.contextPath}/search-room-1?dateFrom=${dateFrom}&dateTo=${dateTo}&roomType=${roomTypeId}" class="btn btn-primary btn-sm" style="margin-left: -40px">ADD A ROOM</a></p>
                    </div>
                    <div class="col-lg-6">
                        <p><a href="${pageContext.request.contextPath}/check-out" class="btn btn-primary btn-sm" style=" float: right">CONTINUE</a></p>
                    </div>
                </div>    
            </div>
        </section>
        <jsp:include page="include/user/footer.jsp" />
        <jsp:include page="include/user/js-page.jsp" />

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    </body>
</html>
