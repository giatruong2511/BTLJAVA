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
    <h2 style="padding: 0 30% ">Xác nhận thông tin</h2>
    <div class="col-lg-12 col-md-6">
        <div class="azzz">
            <div class="xyzz">
                <h4 class="mb-1">${buses.routeId.name}</h4>
                <p class="mb-0">Ngày khởi hành: ${buses.time.toString().substring(0,10)}</p>
                <p class="mb-0">Giờ khởi hành: ${buses.hours}</p>

                <c:if test="${buses.delivery == 1}"> <p class="text-primary"><i class="bi bi-check"></i> Nhận giao hàng</p></c:if>
                <c:if test="${buses.delivery != 1}"><p class="text-danger"><i class="bi bi-x"></i> Không nhận giao hàng</p></c:if>               </div>
            </div
        </div>
    </div>
    <hr/>
    <h5>Thông tin hành khách(Nhap day du thong tin)</h5>
    <div class="row g-3">
        <div class="col-4">
            <div class="form-floating">
                <input  type="text" class="form-control" id="ten" name="from" placeholder="Ho Ten">
                <label for="subject">Họ tên</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input  type="text" class="form-control" id="phone" name="end" placeholder= "So Dien Thoai">
                <label for="subject">Số điện thoại</label>
            </div>
        </div>
        <div class="col-4">
            <div class="form-floating">
                <input  type="email" class="form-control" id="email" name="end" placeholder="Email">
                <label for="subject">Email</label>
            </div>
        </div>
    </div>
    <hr/>
    <div class="row g-3">
        <div class="col-6">
            <div class="xyzt">

                <div class="wwe">
                    <h4>Số vé</h4>
                    <button class="btn btn-primary" id="prev">- </button>
                    <h5 id="count"></h5>
                    <button class="btn btn-primary" id="next"> + </button>

                </div>
                <div style="margin-top: 20px">
                    <h5>TỔNG CỘNG: <span id="count2"> </span> x <span id="pr">${buses.price}</span> = <span id="tt"></span></h5>
            </div>
        </div>
    </div>


    <div class="col-4">
        <h5>Phương thức thanh toán</h5>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1" checked>
            <label class="form-check-label" for="flexRadioDefault1">
                Thanh toán trực tiếp
            </label>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" >
            <label class="form-check-label" for="flexRadioDefault2">
                Thanh toán momo
            </label>
        </div>
    </div>
    <div class="col-2 dat">
        <a href="<c:url value="/confirm" />">
            <button class="btn btn-primary dat"  onclick="addBooking('${endpoint}', ${buses.id})" type="submit">ĐẶT NGAY</button>
        </a>
    </div>

</div>

</div>   
<script src="<c:url value="/js/booking.js" />"></script>

<script>
                window.onload = function () {
                    load();

                };

</script> 