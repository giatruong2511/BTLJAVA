<%-- 
    Document   : buses
    Created on : Aug 29, 2022, 9:25:07 PM
    Author     : DELL
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br>
<h2 class="text-center text-info">${route.bushomeId.name}</h2>
<div class="row g-4">
    <div class="col-lg-6 col-md-6">    

        <img src="<c:url value="${route.bushomeId.image}" />" class="img-fluid"/> 
        <br/>
        <br>
        <div>
        <h4 >${route.bushomeId.name}</h4>
        <h6>Đia chi: ${route.bushomeId.address}</h6>
        <h6>So dien thoai: ${route.bushomeId.phone}</h6>
        <h6>Email: ${route.bushomeId.email}</h6>
        </div>
    </div>
        
    <div class="col-lg-6 col-md-4 ">
        <h4 class="text-center">Danh sach cac chuyen xe tuyen ${route.name}</h4>
        <br>
        <c:forEach items="${buses}" var="b">
            <div class="azzzya" style="color: darkblue;">
            <div class="xyz col-lg-4 col-md-3">
                <p class="mb-0">Ngày khởi hành: ${b.time.toString().substring(0,10)}</p>
                
                <p class="mb-0">Giờ khởi hành: ${b.hours}</p>
                
                <p class="mb-0">Gia ve: <fmt:formatNumber value="${b.price}" type="number" maxFractionDigits = "3" /> VND
                <p class="mb-0">Giao hang: <c:if test="${b.delivery == 1}"> Co</c:if>
                    <c:if test="${b.delivery != 1}"> Khong</c:if>
                </p>
                
                
            </div>
                <div>
                    <a href="<c:url value="/buses/${b.id}/booking" />"><button class="btn btn-primary" style="margin: 40px;">Đặt Ngay</button></a>
                </div>
        </div>
        </c:forEach>
    </div>
</div>