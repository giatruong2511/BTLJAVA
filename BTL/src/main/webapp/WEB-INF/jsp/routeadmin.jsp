<%-- 
    Document   : addroute
    Created on : Aug 23, 2022, 8:54:08 PM
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
                <h4 class="card-title mb-0 flex-grow-1">Them tuyen duong</h4>
            </div><!-- end card header -->
            <div class="card-body">
                <c:url value="/admin/1/routeadmin" var="actions" />
                <form:form  method="post" action="${actions}" modelAttribute="route" class= "container">
                    <div class="form-floating col-12-3 mt-3">
                        <form:input type="text" path="name" class="form-control" id="name" placeholder="name" name="name" />
                        <label for="name">Ten tuyen</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <form:input type="text" path="startingPOS" class="form-control" id="startingPOS" placeholder="startingPOS" name="startingPOS" />
                        <label for="name">Diem khoi hanh</label>
                    </div>
                    <div class="form-floating mb-3 mt-3">
                        <form:input type="text" path="endPOS" class="form-control" id="endPOS" placeholder="endPOS" name="endPOS" />
                        <label for="name">Diem ket thuc</label>
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
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Danh sach tuyen duong</h4>
            </div><!-- end card header -->
            <div class="spinner-border text-success" id="mySpinner"></div>
            <div class="card-body">

                <div class="live-preview">
                    <div class="table-responsive table-card">
                        <table class="table align-middle table-nowrap mb-0">
                            <thead class="table-light">
                                <tr>

                                    <th></th>
                                    <th scope="col">Name</th>
                                    <th scope="col">startingPOS</th>
                                    <th scope="col">endPOS</th>
                                    <th scope="col">Active</th>
                                    <th scope="col" style="width: 150px;">Action</th>
                                </tr>
                            </thead>
                            <tbody id="myroute">

                            </tbody>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>

<script src="<c:url value="/js/route.js" />"></script>
<script>
    <c:url value="/api/bushome/1/route" var="u" />
    window.onload = function () {
        getRoute('${u}');
    }
</script>