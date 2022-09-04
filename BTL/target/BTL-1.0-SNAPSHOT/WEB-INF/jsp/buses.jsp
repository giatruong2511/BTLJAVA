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
    <div class="col-lg-8 col-md-4 " style="margin: auto ;padding:20px">
         <h4>Chọn thời gian khởi hành:</h4>
        <br>
        <c:forEach items="${buses}" var="b">
            <div class="azzzya">
                <div class="xyz col-lg-4 col-md-3" ">
                    <p class="mb-0">Ngày khởi hành: <span class="text-info">${b.time.toString().substring(0,10)}</span></p>

                    <p class="mb-0">Giờ khởi hành: <span class="text-info">${b.hours}</span></p>
                </div>
                <div class=" xyz col-lg-4">
                    <p class="mb-0">Giá vé: <span class="text-info"><fmt:formatNumber value="${b.price}" type="number" maxFractionDigits = "3" /> VND </span></p>
                    <c:if test="${b.delivery == 1}"> <p class="text-primary"><i class="bi bi-check"></i> Nhận giao hàng</p></c:if>
                    <c:if test="${b.delivery != 1}"><p class="text-danger"><i class="bi bi-x"></i> Không nhận giao hàng</p></c:if>
                </div>
                <div class="col-lg-4">
                    <a href="<c:url value="/buses/${b.id}/booking" />"><button class="btn btn-primary zzaa">Chọn</button></a>
                </div>
            </div>
        </c:forEach>
    </div>
</div>