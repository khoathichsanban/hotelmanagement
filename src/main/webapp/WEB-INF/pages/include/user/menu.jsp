<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- Header Section Begin -->
<header class="header-section">
    <div class="container-fluid">
        <div class="inner-header">
            <div class="logo">
                <a href="<c:url value="/user/home1.jsp"/>"><img src="<c:url value="/resources/img/logo.png"/>" alt=""></a>
            </div>
            <div class="container">
                <div class="row">   
                    <div class="col-xl-12">
                        <nav class="main-menu mobile-menu">
                            <ul>
                                <li><a href="${pageContext.request.contextPath}/home">Home</a></li>
                                <li><a href="${pageContext.request.contextPath}/about-us">About us</a></li>
                                <li><a href="${pageContext.request.contextPath}/rooms">Booking</a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/service">Service</a>                                        
                                </li>
                                <li><a href="#">Promotion</a></li>
                                <li><a href="sign-up">Login</a></li>
                            </ul>
                        </nav>
                        <div class="top-info">
                            <img src="<c:url value="/resources/img/placeholder.png"/>" alt="">
                            <span>Da Nang City</span>
                        </div>
                    </div>
                </div>
            </div>
            <div id="mobile-menu-wrap"></div>
        </div>
    </div>
</header>
<!-- Header End -->