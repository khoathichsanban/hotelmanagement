<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@taglib uri="http://www.springframework.org/tags/form" prefix="mvc" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<c:forEach items="${sessionScope.myServiceBookings}" var="carts" varStatus="itemStatus">
    <tr>
        <th scope="row">${carts.service.id}</th>
        <td>${carts.service.name}</td>
        <td><fmt:formatNumber type="number" pattern="###,###VND" value="${carts.service.price}" /></td>
        <td>${carts.quantity}</td>
        <td><fmt:formatNumber type="number" pattern="###,###VND" value="${carts.price}" /></td>
        <td>
            <button type="button" class="test btn btn-primary btn-sm" onclick="removeService(${itemStatus.index})">REMOVE</button>
        </td>
    </tr>
</c:forEach>
<tr>
    <td colspan="6"><h4><b>Total Price Service:</b> <fmt:formatNumber type="number" pattern="###,###VND" value="${totalService}" /></h4></td>
</tr>


<div class="row">
    <div>
        <span id="message-success" class="display-message alert alert-success"></span>
    </div>
</div>
