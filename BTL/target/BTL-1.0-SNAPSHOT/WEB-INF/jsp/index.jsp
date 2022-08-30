<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>



<div class="container-fluid page-header py-5 mb-5 wow fadeIn" data-wow-delay="0.1s">
    <div class="container text-center py-5">
        <c:url value="/" var="action" />
        <form method="get" action="${action}">
            <div class="row g-3">
                <div class="col-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="star" name="from" placeholder="Điểm Đi">
                        <label for="subject">Điểm Đi</label>
                    </div>
                </div>
                <div class="col-4">
                    <div class="form-floating">
                        <input type="text" class="form-control" id="star" name="end" placeholder="Điểm Đến">
                        <label for="subject">Điểm Đến</label>
                    </div>
                </div>
                <div class="col-2">
                    <div class="form-floating">
                        <input type="date" class="form-control" id="star" name="date" placeholder="Điểm Đến">
                        <label for="subject">Ngày Khởi Hành</label>
                    </div>
                </div>
                <div class="col-2 text-center">
                    <button class="btn btn-primary rounded-pill py-3 px-5" type="submit">Tìm Kiem</button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- Service Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="display-6 mb-4">Nhà Xe Pho Bien</h1>
        </div>
        <div class="row g-4">
            <c:forEach items="${bushome}" var="bh">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <a class="service-item d-block rounded text-center h-100 p-4" href="<c:url value="/bushome/${bh.id}" />">
                        <img class="img-fluid rounded mb-4" src="${bh.image}" alt="">
                        <h4 class="mb-0">${bh.name}</h4>
                        <h6 class="mb-0"><i class="fas fa-map-marker"></i> ${bh.address}</h6>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<div >
    <ul class="pagination justify-content-center">
        <c:forEach begin="1" end="${Math.ceil(counter/pageSize)}" var="page">
            <li class="page-item"><a class="page-link" href="<c:url value="/" />?page=${page}">${page}</a></li>
            </c:forEach>

    </ul>
</div>
<!-- Service End -->

<!-- Testimonial Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center mx-auto mb-5 wow fadeInUp" data-wow-delay="0.1s" style="max-width: 600px;">
            <h1 class="display-6 mb-4">Tuyen Duong Pho Bien</h1>
        </div>
        <div class="owl-carousel testimonial-carousel wow fadeInUp" data-wow-delay="0.1s">      
            <c:forEach items="${route}" var="r">
                <div class="testimonial-item bg-abxz rounded p-4">
                    <div class="d-flex align-items-center mb-6">
                        <img class="flex-shrink-0 rounded-circle border p-1" src="<spring:url value="/images/bg.jpg" />" alt="">

                        <div class="ms-6">
                            <h5 class="mb-1">${r.name}</h5>
                            <span><i class="fas fa-map-marker"></i> ${r.bushomeId.name} </span>
                            <span><i class="fas fa-clock"></i> 8h </span>
                            <span><i class="fas fa-ticket-alt"></i> 300.000d</span>
                        </div>
                    </div>
                </div>
            </c:forEach> 
        </div>
    </div>
</div>
<!-- Testimonial End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square rounded-circle back-to-top"><i class="bi bi-arrow-up"></i></a>
