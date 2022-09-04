<%-- 
    Document   : route
    Created on : Aug 17, 2022, 2:52:32 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<br>
<div class="g-4"> 
    <div class="row bbz">
        <div class="col-lg-4 col-md-6">    
            <img  src="<c:url value="${bushome.image}" />" class="img-fluid"/> 
        </div>
        <div class="col-lg-8 col-md-6">
            <div>
                <h2>${bushome.name}</h2>
                <p>Đia chi: ${bushome.address}</p>
                <p>Số điện thoại: ${bushome.phone}</p>
                <p>Email: ${bushome.email}</p>
            </div>
        </div>
    </div>
    <div class="bxx row">
        <h4 class="text-center duo">Các tuyến đường nhà xe ${bushome.name} đang phục vụ</h4>
        <c:forEach items="${route}" var="r">
            <div class="col-6">      
                <a style="color: #777" href="<c:url value="/route/${r.id}" />">
                    <div class="amt" style="margin-bottom: 20px;">

                        <img  src="<c:url value="/images/bg.jpg" />"/> 
                        <div class="xyz">    
                            <h4 class="mb-1">${r.name}</h4>
                            <p class="mb-0">Điểm Đi: <span class="text-info"> ${r.startingPOS}</span></p>
                            <p class="mb-0">Điểm Đến:<span class="text-danger"> ${r.endPOS}</span></p>
                        </div>

                    </div>
                </a>
                </div>

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
            <h6 class="text-danger">Vui lòng đăng nhập để bình luận!</h6>
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