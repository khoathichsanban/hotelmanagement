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
        <title>Payment Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />

        <script src="<c:url value="/resources/js/jquery.min.js" />" ></script>
        <script src="<c:url value="/resources/js/popper.min.js" />" ></script>
        <script src="<c:url value="/webjars/bootstrap/4.6.0/js/bootstrap.min.js" />" ></script>
        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

        <style>
            .site-section{
                margin-top: 100px;
            }
            .info-room{
                padding: 20px;
            }

            .booking-info, booking-total{
                padding: 20px 25px;
                margin: 20px;
                background-color: #FAFAFA;
                border: 1px solid #EBEBEB;
            }
            .guest-info{
                padding: 20px 25px;
                margin: 20px;
                background-color: #FAFAFA;
                border: 1px solid #EBEBEB;
            }
            .booking-total{
                padding: 20px 25px;
                margin: 5px;
                background-color: #FAFAFA;
                border: 1px solid #EBEBEB;
                width: 410px;
                height: 190px;
            }
            .display-change-payment {
                display: none;
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
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div style="margin-left: 260px">
                                <img src="${pageContext.request.contextPath}/resources/img/credit-card.png" alt="" style="width:100%">
                            </div>
                        </div>
                        <h4>CREDIT CARD</h4>
                        <div  class="guest-info">
                            <mvc:form id="form-payment">
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <input type="text" class="form-control px-3 py-3" placeholder="Full Name" name="fullName" id="fullName">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <input type="text" class="form-control px-3 py-3" placeholder="Card Number" name="cardNumber" id="cardNumber">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <input type="date" class="form-control px-3 py-3" placeholder="expDate" name="expDate" id="expDate">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-12 form-group">
                                        <input type="password" class="form-control px-3 py-3" placeholder="cvvCode" name="cvvCode" id="cvvCode">
                                        <span style="font-size: 12px; color: red" class="form-message"></span>
                                    </div>
                                </div>
                                <div class="form-group" style="text-align: center">
                                    <input type="button" class="btn btn-primary py-3 px-5" value="PAYMENT" id="payment-submit">
                                    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary py-3 px-5 display-change-payment" id="change-button">HOME</a>
                                </div>
                            </mvc:form>
                            <span id="message-payment" style="color:red; font-size: 20px;"></span>
                        </div>
                    </div>

                    <div class="col-lg-4">  
                        <h4>TOTAL</h4>
                        <div class="row booking-total">
                            <c:forEach items="${myBookings}" var="map" varStatus="index">
                                <c:forEach items="${map.value.serviceBooking}" var="carts">
                                    <c:set var="c" value="${c+carts.service.price *carts.quantity}"></c:set>  
                                </c:forEach>
                            </c:forEach>
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
        <script src="${pageContext.request.contextPath}/resources/js/ajax.js" type="text/javascript"></script>
        <script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
        <script>

            Validator({
                form: '#form-payment',
                rules: [
                    Validator.isFullName('#fullName'),
                    Validator.isCardNumber('#cardNumber'),
                    Validator.isExpDate('#expDate'),
                    Validator.isCvvCode('#cvvCode')
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
