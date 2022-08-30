<%-- 
    Document   : header
    Created on : Aug 13, 2022, 10:56:20 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg bg-primary navbar-dark sticky-top py-lg-0 px-lg-5 wow fadeIn" data-wow-delay="0.1s">
    <a href="#" class="navbar-brand ms-3 d-lg-none">MENU</a>
    <button type="button" class="navbar-toggler me-3" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarCollapse">
        <div class="navbar-nav me-auto p-3 p-lg-0">
            <a href="<spring:url value="/" />" class="nav-item nav-link active">Home</a>
            <a href="about.html" class="nav-item nav-link">About Us</a>
            <a href="service.html" class="nav-item nav-link">Services</a>
            <a href="project.html" class="nav-item nav-link">Projects</a>
            <a href="contact.html" class="nav-item nav-link">Contact Us</a>
        </div>
        <c:if test="${pageContext.request.userPrincipal.name == null}">
            <a href="<c:url value="/signin" />" class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block" style="margin-right: 10px;">Ðang Nhap</a>
            <a href="<c:url value="/signup" />" class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">Ðang Ky</a>
        </c:if>
        <c:if test="${pageContext.request.userPrincipal.name != null}">

            <div class="navbar-nav me-auto p-3 p-lg-0" style="margin-right: 0px !important">
                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <c:if test="${currentUser != null && currentUser.avatar != null}">
                            <img src="${currentUser.avatar}" class="rounded-circle" width="30" alt="${currentUser.username}" /> <span>Hi ${pageContext.request.userPrincipal.name}!</span>
                        </c:if>
                    </a>
                    <div class="dropdown-menu border-0 rounded-0 rounded-bottom m-0">
                        <a href="<c:url value="/logout" />" class="btn btn-sm btn-light rounded-pill py-2 px-4 d-none d-lg-block">Đăng Xuất</a>
                    </div>
                </div>
            </div>
        </c:if>
    </div>
</nav>