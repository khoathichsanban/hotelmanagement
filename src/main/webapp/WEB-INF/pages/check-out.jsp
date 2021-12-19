<%-- 
    Document   : view-room
    Created on : Nov 4, 2021, 8:52:42 PM
    Author     : This PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="mvc" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Info Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />

        <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
        <script src="<c:url value="/resources/js/popper.min.js" />" ></script>
        <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js" />" ></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <style>
            .site-section{
                margin-top: 100px;
            }
            .info-room{
                padding: 20px;
            }
            .header-booking{
                text-align: center;
                border: 1px solid;
                background-color: #f4f4f4;
                border: 1px solid #EBEBEB;
                padding: 20px 25px;
                margin-left: 18px;
            }
            .booking-info, booking-total{
                padding: 20px 25px;
                margin: 20px;
                background-color: #f4f4f4;
                border: 1px solid #EBEBEB;
            }
            .guest-info{
                padding: 20px 25px;
                margin: 20px;
                background-color: #f4f4f4;
                border: 1px solid #EBEBEB;
            }
            .booking-total{
                padding: 20px 25px;
                margin: 5px;
                background-color: #f4f4f4;
                border: 1px solid #EBEBEB;
            }
            .h3,h4{
                text-align: center;
                padding: 20px;
            }
            .btn.btn-primary{
                background-color: #b99365;
                border-color: #b99365;
                margin-top:40px;

            }

        </style>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />

        <div class="site-section">
            <div class="container">
                <h3 style="padding: 20px;">OUR DREAM HOTEL</h3>
                <div class="row header-booking" style="width: 1075px">
                    <div class="col-12">
                        <h1>YOUR BOOKING</h1>  
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
                <div class="row">
                    <div class="col-lg-8">
                        <h4>BOOKING DETAIL</h4>
                        <c:forEach items="${myBookings}" var="map" varStatus="index">
                            <div class=" booking-info row">
                                <div class="col-lg-12">
                                    <h5>${map.value.room.roomType.name} ${map.value.room.roomNumber}</h5>
                                    <b>Detail:</b><br>
                                    <table>
                                        <tr>
                                            <th style="width:40%">Price:</th>
                                            <td><fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.room.roomType.price}" /></td>
                                        </tr>
                                        <tr>
                                            <th>Guests:</th> 
                                            <td>${map.value.room.roomType.guest} Adult</td>
                                        </tr>
                                        <tr>
                                            <th>Service:</th>
                                            <td>
                                                <c:forEach items="${map.value.serviceBooking}" var="carts">
                                                    ◆${carts.service.name}
                                                    <c:set var="c" value="${c+carts.service.price *carts.quantity}"></c:set>
                                                </c:forEach>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Unit price:</th>
                                            <td>
                                                <c:if test="${map.value.serviceBooking==null}">
                                                    <fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.room.roomType.price}"/>
                                                </c:if>
                                                <c:if test="${map.value.serviceBooking!=null}">
                                                    <fmt:formatNumber type="number" pattern="###,###VND" value="${map.value.price}"/>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </table>
                                    </div>
                                </div>
                        </c:forEach>
                        <h4>CUSTOMER INFORMATION</h4>
                        <div  class="guest-info">
                            <mvc:form action="${pageContext.request.contextPath}/result" method="post" 
                                      modelAttribute="guest" id="form-guest">
                                <div class="row">
                                    <div class="col-lg-6 form-group">
                                        <input type="text" class="form-control" name="fullName" id="fullName" placeholder="Full Name">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                    <div class="col-lg-6 form-group">
                                        <input type="email" class="form-control px-3 py-3" placeholder="Email" name="email" id="email">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-6 form-group">
                                        <input type="date" class="form-control" placeholder="BirthDate" name="birthDate" id="birthDate" pattern = "yyyy-MM-dd" >
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                    <div class="col-lg-6 form-group">
                                        <input type="text" class="form-control px-3 py-3" placeholder="Address" id="address" name="address">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="row" style="border-bottom: 1px solid; margin-bottom: 20px">
                                    <div class="col-lg-4 form-group">
                                        <input type="text" class="form-control px-3 py-3" placeholder="Id Card" name="idCard" id="idCard">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <input type="text" class="form-control px-3 py-3" placeholder="Phone Number" name="phoneNumber" id="phoneNumber">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                    <div class="col-lg-4 form-group">
                                        <select class="form-control" id="gender" name="gender" placeholder="Gender" style="height: 34px">
                                            <c:forEach items="${genders}" var="items">
                                                <option value="${items}">${items}</option>
                                            </c:forEach>   
                                        </select>
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: center">
                                    <input type="submit" class="btn btn-primary py-3 px-5" value="CONTINUE">
                                </div>
                            </mvc:form>
                        </div>
                    </div>

                    <div class="col-lg-4">  
                        <h4>TOTAL</h4>

                        <div class="row booking-total">
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
                </div>
            </div>
        </div>

        <jsp:include page="include/user/footer.jsp" />



        <script src="${pageContext.request.contextPath}/resources/js/validator.js" type="text/javascript"></script>
        <script>

            Validator({
                form: '#form-guest',
                rules: [
                    Validator.isFullName('#fullName'),
                    Validator.isAddress('#address'),
                    Validator.isGender('#gender'),
                    Validator.isIdCard('#idCard'),
                    Validator.isPhoneNumber('#phoneNumber'),
                    Validator.isBirthDay('#birthDate'),
                    Validator.isEmail('#email'),
                ]
            });
        </script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
        type="text/javascript"></script>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
              rel="Stylesheet"type="text/css"/>
        <jsp:include page="include/user/js-page.jsp" />

    </body>
</html>
