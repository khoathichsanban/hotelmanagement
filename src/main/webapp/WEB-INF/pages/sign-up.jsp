<%-- 
    Document   : sign-up
    Created on : Nov 14, 2021, 11:23:27 PM
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
        <title>JSP Page</title>
        <jsp:include page="include/user/css-page.jsp"/>
        <link href="<c:url value="/webjars/bootstrap/4.6.0/css/bootstrap.min.css" />" type="text/css" rel="stylesheet" />
        <link href="../../resources/css/style-format.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style-format.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/font-awesome.css">
    </head>
    <body>
        <jsp:include page="include/user/menu.jsp" />
        <div class="site-section" style="margin-top: 100px">
            <div class="container">
                <mvc:form class="login-form" action="${pageContext.request.contextPath}/resgiter" method="post"
                          modelAttribute="user">
                    <div class="login-wrap">
                        <p class="login-img"><i class="icon_lock_alt"></i></p>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_profile"></i></span>
                            <input type="text" class="form-control" placeholder="Username" autofocus name="fullName">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_profile"></i></span>
                            <input type="email" class="form-control" placeholder="Email" autofocus name="email">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                            <input type="password" class="form-control" placeholder="Password" name="password">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                            <input type="password" class="form-control" placeholder="Confirm Password">
                        </div>
                        <button class="btn btn-info btn-lg btn-block" type="submit">Sign up</button>
                    </div>
                </mvc:form>
            </div>
        </diV>
    </div>
    <jsp:include page="include/user/footer.jsp" />


    <jsp:include page="include/user/js-page.jsp" />
</body>
</html>
