<%-- 
    Document   : home1
    Created on : Oct 23, 2021, 8:29:33 PM
    Author     : ASUS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Services Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="<c:url value="/resources/js/test.js"/>"></script>

        <style>
            .btn.btn-primary.btn-sm{
                background-color: #b99365;
                border-color: #b99365;

            }
            .header-booking{
                text-align: center;
                border: 1px solid;
                background-color: #f4f4f4;
                border-color: #b99365;
            }.table-service{
                margin-top: 50px;
                border:1px solid;
                border-color: #b99365;
            }
        </style>
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <div class="container" style="margin-top:150px; margin-bottom: 150px">
            <div class="row header-booking">
                <div class="col-12">
                    <h3>${room.roomType.name} ${room.roomNumber} </h3>  
                </div>
                <div class="col-lg-6">
                    <p><b>Check-in</b><br>After 2:00 PM<br>${dateFrom}</p>
                </div>
                <div class="col-lg-6">
                    <p><b>Check-out</b><br>Before 11:30 AM<br>${dateTo}</p>
                </div>
            </div>
            <h3 style="text-align: center; margin-top: 70px">LIST SERVICE</h3>
            <div class="row">
                <div class="col-lg-12 table-service">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${services}" var="items" varStatus="loop">
                                <tr>
                                    <th scope="row">${items.id}</th>
                                    <td>${items.name}</td>
                                    <td><fmt:formatNumber type="number" pattern="###,###VND" value="${items.price}" /></td>
                                    <td><input  class="get-value" type="number" id="quantity" name="quantity" min="0" placeholder="0"></td>
                                    <td><button type="button" class="btn btn-primary btn-sm" onclick="addService(${loop.index}, ${items.id})">ADD</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>

                    </table>
                </div>
            </div>
            <h3 style="text-align: center; margin-top: 70px">LIST SERVICE BOOKING</h3>
            <div class="row">
                <div class="col-lg-12 table-service">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th scope="col">No.</th>
                                <th scope="col">Name</th>
                                <th scope="col">Price</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Unit price</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody id="load-service">
                            <c:forEach items="${sessionScope.myServiceBookings}" var="carts" varStatus="itemStatus">
                                <tr>
                                    <th scope="row">${carts.service.id}</th>
                                    <td>${carts.service.name}</td>
                                    <td><fmt:formatNumber type="number" pattern="###,###VND" value="${carts.service.price}" /></td>
                                    <td>${carts.quantity}</td>
                                    <td><fmt:formatNumber type="number" pattern="###,###VND" value="${carts.price}" /></td>
                                    <td>
                                        <button type="button" class="btn btn-primary btn-sm" onclick="removeService(${itemStatus.index})">REMOVE</button>
                                    </td>
                                </tr>                                    
                            </c:forEach>

                        </tbody>
                    </table>
                </div>
            </div>
            <div class="row">
                <div>
                    <span id="message-success" class="display-message"></span>
                </div>
            </div>
            
            <div class="row">
                <div class="col-lg-12">
                    <a href="${pageContext.request.contextPath}/view-service" class="btn btn-primary btn-sm" style="margin-top: 80px; font-size: 20px;">CONTINUE</a>

                </div>
            </div>  
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     

        <jsp:include page="include/user/footer.jsp" />

        <script>
                                            function addService(index, serviceId) {
                                                var quantityElement = document.querySelectorAll('.get-value');
                                                var valueQuantityService = quantityElement[index].value;
                                                $.ajax({
                                                    type: "GET",
                                                    url: "http://localhost:8080/Spring_MVC_Project_Hotel_Management/add-api-service",
                                                    data: {
                                                        quantity: valueQuantityService,
                                                        serviceId: serviceId
                                                    },
                                                    success: function (data) {
                                                        
                                                        $("#load-service").html(data);
                                                    },
                                                    error: function (e) {
                                                        console.log("ERROR: ", e);
                                                    }
                                                });
                                            }
                                            ;

                                           
        </script>
        
        <jsp:include page="include/user/js-page.jsp" />
    </body>
</html>
