<%-- 
    Document   : listbushome
    Created on : Aug 18, 2022, 11:42:14 AM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<h2 class="text-center text-black">Danh sach nha xe dang hoat dong</h2>
<br/>
<div class="spinner-border text-success" id="mySpinner"></div>
<div class="card-body">
    <div class="table-responsive table-card">
        <table class="table table-borderless table-centered align-middle table-nowrap mb-0">
            <thead class="text-muted table-light">
                <tr>
                    <th scope="col"></th>
                    <th scope="col">Ten nha xe</th>
                    <th scope="col">Dia chi</th>
                    <th scope="col">So dien thoai</th>
                    <th scope="col">Email</th>
                    <th scope="col">Trang thai</th>
                    <th scope="col"></th>
                </tr>
            </thead>
            <tbody id="mybushome">
                
            </tbody>
        </table>
    </div>
</div>

<script src="<c:url value="/js/bushome.js" />"></script>
<script>
    <c:url value="/api/bushome" var="u" />
    window.onload = function () {
        getBusHome('${u}');
    }
</script>