<%-- 
    Document   : confirm
    Created on : Sep 1, 2022, 10:35:13 AM
    Author     : Tien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="container-xxl py-5 wow fadeInUp" data-wow-delay="0.1s">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-lg-6">
                <i class="bi bi-check-circle display-1 text-primary"></i>
                <h1 class="mb-4">Bạn đã đặt vé thành công!</h1>
                <p class="mb-4">Cảm ơn bạn đã tin tưởng sử dụng. Chúng tôi sẽ liên hệ lại cho bạn để xác nhận.</p>
                <a class="btn btn-primary rounded-pill py-3 px-5" href="<c:url value="/" />">Về trang chủ</a>
            </div>
        </div>
    </div>
</div>
