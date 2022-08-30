<%-- 
    Document   : route
    Created on : Aug 17, 2022, 2:52:32 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br>
<h2 class="text-center text-info">${bushome.name}</h2>
<div class="row g-4">
    <div class="col-lg-6 col-md-6">    

        <img src="<c:url value="${bushome.image}" />" class="img-fluid"/> 
        <br/>
        <br>
        <div>
        <h4 >${bushome.name}</h4>
        <h6>Đia chi: ${bushome.address}</h6>
        <h6>So dien thoai: ${bushome.phone}</h6>
        <h6>Email: ${bushome.email}</h6>
        </div>
    </div>


    <div class="col-lg-6 col-md-6">
        <h4 class="text-center">Danh sach cac tuyen duong</h4>
        <br>
        <c:forEach items="${route}" var="r">
            <a href="<c:url value="/route/${r.id}" />">
                <div class="amt" style="margin-bottom: 20px;">

                    <img src="<c:url value="/images/bg.jpg" />"/> 
                    <div class="xyz">    
                        <h4 class="mb-1">${r.name}</h4>
                        <p class="mb-0">Điểm Đi: ${r.startingPOS}</p>
                        <p class="mb-0">Điểm Đến: ${r.endPOS}</p>
                    </div>

                </div>
            </a>
        </c:forEach>
    </div>
</div>

<c:url value="/api/bushome/${bushome.id}/comments" var="endpoint" />

<div class="row g-4">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <div class="c-user-rate-form f-comment-0">
            <textarea name="" id="content" placeholder="Viết bình luận của bạn"></textarea>
            <button class="btn btn-primary" onclick="addComment('${endpoint}', ${bushome.id})">Thêm bình luận</button>
        </div>              
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name == null}">
        <div class="c-user-rate-form f-comment-0">
            <h6 class="text-danger">!! Dang nhap de binh luan</h6>
        </div>              
    </c:if>
    <div id="comments"></div>

</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment-with-locales.min.js"></script>
<script src="<c:url value="/js/comment.js" />"></script>
<script>
                window.onload = function () {
                    loadComment('${endpoint}', ${bushome.id});
                }
</script>