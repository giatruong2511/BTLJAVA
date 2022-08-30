<%-- 
    Document   : booking
    Created on : Aug 30, 2022, 7:49:52 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<c:url value="/api/buses/${buses.id}/booking" var="endpoint" />
<div class=rldz>
    <h4>Xác nhận thông tin</h4>
    <div class="col-lg-12 col-md-6">
        <div class="azzz">
            <div class="xyzz">
                <h4 class="mb-1">${buses.routeId.name}</h4>
                <h5>Nhà Xe @@</h5>
                <p class="mb-0">Ngày khởi hành: ${buses.time.toString().substring(0,10)}</p>
                <p class="mb-0">Giờ khởi hành: ${buses.hours}</p>
            </div
        </div>
        <div class="xyzt">
            <h4>So Vé</h4>
            <div class="wwe">
                <button class="btn btn-primary" id="prev">- </button>
                <h3 id="count"></h3>
                <button class="btn btn-primary" id="next"> + </button>

            </div>
        </div>
    </div>
    <h5>Thông tin hành khách(Nhap day du thong tin)</h5>
    <div class="row g-3">
        <div class="col-4">
            <div class="form-floating">
                <input  type="text" class="form-control" id="name" name="from" placeholder="Ho Ten">
                <label for="subject">Ho Ten</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input  type="text" class="form-control" id="phone" name="end" placeholder= "So Dien Thoai">
                <label for="subject">So Dien Thoai</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input  type="email" class="form-control" id="email" name="end" placeholder="Email">
                <label for="subject">Email</label>
            </div>
        </div>
    </div>
    <div class="row g-3">
        <div class="col-7">
            <h4>Tong cong: <span id="count2"> </span> x <span id="pr">${buses.price}</span> = <span id="tt"></span></h4>
        </div>
        <div class="col-5">
            <button class="btn btn-primary" onclick="addBooking('${endpoint}', ${buses.id})" type="submit">dat ngay</button>
        </div>
    </div>
</div>
<div>
</div>
<script src="<c:url value="/js/booking.js" />"></script>

<script>
    window.onload = function () {
        load();
    }
</script> 