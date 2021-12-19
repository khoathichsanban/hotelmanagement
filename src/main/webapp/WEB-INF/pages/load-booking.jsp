

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <button type="button" class="btn btn-primary btn-sm" onclick="removeBooking('thaoaaa')">REMOVE</button>
            <a href="${pageContext.request.contextPath}/remove/${map.value.room.roomType.id}/${map.value.room.id}">
                <i class="fa fa-trash-o" style="border-right: 2px solid; padding-right: 3px">Remove</i></a>
            <a href="${pageContext.request.contextPath}/service/${map.key}">

                <i class="fa fa-plus-circle">Add Service</i></a> 
        </td>
    </tr> 
</c:forEach>  
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

<div class="row total-booking">
    <div class="col-lg-12">
        <table class="table table-borderless">

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
