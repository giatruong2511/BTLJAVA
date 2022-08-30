<%--
    Document   : busesadmin
    Created on : Aug 26, 2022, 10:27:53 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Them tuyen xe</h4>
            </div><!-- end card header -->
            <div class="card-body">
                <c:url value="/admin/addbuses" var="actions" />
                <form:form  method="post" action="${actions}" modelAttribute="buses" class= "container">
                    <div class="col-md-12 ">
                        <label for="inputState" class="form-label">Tuyen duong</label>
                        <form:select  path="routeId" class="form-select" >
                            <c:forEach items="${route}" var="c">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <br>
                    <div class="col-md-12 ">
                        <label for="inputState" class="form-label">Chon xe</label>
                        <form:select  path="carId" class="form-select" >
                            <c:forEach items="${car}" var="c">
                                <option value="${c.id}">${c.licenseplate}</option>
                            </c:forEach>
                        </form:select>
                    </div>
                    <div class=" col-12-3 mt-3">
                        <label for="name">Gia tien</label>
                        <form:input type="long" path="price" class="form-control" id="name" placeholder="name" name="name" />
                    </div>
                    <div class=" mb-3 mt-3">
                        <label for="name">Ngay di</label>
                        <form:input type="date" path="time" class="form-control"  placeholder="Ngay di"  />
                    </div>
                    <div class=" mb-3 mt-3">
                        <label for="name">Gio di</label>
                        <form:input type="time" path="hours" class="form-control"  placeholder="Ngay di"  />
                    </div>
                    <div class=" mb-3 mt-3">
                        <label for="name">Giao hang</label>
                        <form:select  path="delivery" class="form-select" >
                            <option value="1">Co</option>
                            <option value="0">Khong</option>
                        </form:select>

                    </div>
                    <div class="text-lg-end" style="padding-right: 20px;">
                        <br>
                        <input type="submit" value="Them" class="btn btn-danger"  style="padding: 10px  30px;"/>
                    </div>
                </form:form>

            </div>
        </div>
    </div>
</div>
