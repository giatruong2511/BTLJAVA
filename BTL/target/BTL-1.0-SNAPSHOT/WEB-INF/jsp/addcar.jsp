<%-- 
    Document   : addcar
    Created on : Aug 28, 2022, 10:17:51 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<div class="row">
    <div class="col-xl-12">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Them xe</h4>
            </div><!-- end card header -->
            <div class="card-body">
                <c:url value="/admin/addcar" var="actions" />
                <form:form method="post"  action="${actions}" modelAttribute="car" class= "container">
                    <div class=" col-12-3 mt-3">
                        <label for="name">Bien so xe</label>
                        <form:input type="text" path="licenseplate" class="form-control" id="licenseplate" placeholder="licenseplate" name="licenseplate" />
                    </div>
                    <div class=" col-12-3 mt-3">
                        <label for="name">So cho</label>
                        <form:input type="long" path="seats" class="form-control" id="seats" placeholder="seats" name="seats" />
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