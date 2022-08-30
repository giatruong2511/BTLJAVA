<%-- 
    Document   : admin
    Created on : Aug 16, 2022, 10:26:50 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="<c:url value="/js/bushome.js" />"></script>

<br>
<h3 class="text-center text-danger">Them nha xe</h3>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if> 
<c:url value="/admin/bushome" var="actions" />
<form:form method="post" action="${actions}" modelAttribute="bushome" enctype="multipart/form-data"> 
    <form:errors path="*" element="div" cssClass="alert alert-danger" />
    <div class="form-floating mb-3 mt-3">
        <input type="text" path="name" class="form-control" id="name" placeholder="name" name="name" />
        <label for="name">Ten nha xe</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" path="address" class="form-control" id="address" placeholder="address" name="address" />
        <label for="price">Dia chi</label>
    </div>
    <div class="form-floating mb-3 mt-3">
        <form:input type="text" path="phone" class="form-control" id="phone" placeholder="phone" name="phone" />
        <label for="price">So dien thoai</label>
    </div>    

    <div class="form-floating mb-3 mt-3">
        <form:input type="text" path="email" class="form-control" id="email" placeholder="email" name="email" />
        <label for="price">Email</label>
    </div>
    <div class="form-group">
    </div>        <label for="file">Anh</label>
    <form:input type="file" path="file" 
                class="form-control" id="file" />

    </div>
    <div class="text-lg-end" style="padding-right: 20px;">
        <br>
        <input type="submit" value="Them nha xe" class="btn btn-danger" />
    </div>
</form:form>

<!--    
<h3 class="text-center text-danger">Danh sach nha xe</h3>

<div class="spinner-border text-success" id="mySpinner"></div>
<table class="table container" style="border: 1; text-align: center">
    <tr>
        <th></th>
        <th>Name</th>
        <th>address</th>
        <th>phone</th>
        <th>email</th>
        <th>active</th>
        <th></th>
    </tr>
    <tbody id="mybushome">

    </tbody>
</table>

<script>
    <c:url value="/api/bushome" var="u" />
    window.onload = function () {
        getBusHome('${u}');
    }
</script>-->
