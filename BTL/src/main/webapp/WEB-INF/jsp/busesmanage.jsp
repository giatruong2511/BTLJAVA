<%-- 
    Document   : busesmanage
    Created on : Aug 26, 2022, 11:45:28 PM
    Author     : DELL
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Danh sach cac chuyen xe</h4>
            </div><!-- end card header -->
            <div class="card-body">

                <div class="live-preview">
                    <div class="table-responsive table-card">
                        <table class="table align-middle table-nowrap mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th> Id</th>
                                    <th scope="col">Mã tuyen</th>
                                    <th scope="col">Ngay di</th>
                                    <th scope="col">gio di</th>
                                    <th scope="col">Ma xe</th>
                                    <th scope="col">gia</th>
                                    <th scope="col" style="width: 150px;">Giao hang</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${buses}" var="b">
                                <tr>
                                    <td>${b.id}</td>
                                    <td>${b.routeId.id}</td>
                                    <td>${b.time.toString().substring(0,10)}</td>
                                    <td>${b.hours}</td>
                                    <td>${b.carId.id}</td>
                                    <td><fmt:formatNumber value="${b.price}" type="number" maxFractionDigits = "3" /> VND</td>
                                    <td>${b.delivery}</td>
                                </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>