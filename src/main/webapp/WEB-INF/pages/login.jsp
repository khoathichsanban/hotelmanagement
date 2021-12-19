<%-- 
    Document   : login
    Created on : Jun 20, 2019, 8:17:26 PM
    Author     : AnhLe
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <h1>Login</h1>
        <!-- /login?error=true -->
        <c:if test="${message != null && message != ''}">
            <p style="color: red">${message}</p>
        </c:if>
            <jsp:include page="include/user/menu.jsp" />
        <div class="site-section" style="margin-top: 100px">
            <div class="container">
                <form class="login-form" action="<c:url value="j_spring_security_check"/>" method="post">
                    <div class="login-wrap">
                        <p class="login-img"><i class="icon_lock_alt"></i></p>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_profile"></i></span>
                            <input type="text" class="form-control" placeholder="Username" autofocus>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon"><i class="icon_key_alt"></i></span>
                            <input type="password" class="form-control" placeholder="Password">
                        </div>
                        <label class="checkbox">
                            <input type="checkbox" value="remember-me"> Remember me
                            <span class="pull-right"> <a href="#"> Forgot Password?</a></span>
                        </label>
                        <button class="btn btn-primary btn-lg btn-block" type="submit">Login</button>
                        <button class="btn btn-info btn-lg btn-block" type="submit">Sign up</button>
                    </div>
                </form>
            </div>
        </diV>
    </div>
    <jsp:include page="include/user/footer.jsp" />


    <jsp:include page="include/user/js-page.jsp" />
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </body>
</html>
