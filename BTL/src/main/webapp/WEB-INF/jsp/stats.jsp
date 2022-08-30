<%-- 
    Document   : stats
    Created on : Aug 29, 2022, 9:51:15 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row container">
    <div class="col-xl-4 col-md-6">
        <!-- card -->
        <div class="card card-animate">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1 overflow-hidden">
                        <p class="text-uppercase fw-medium text-muted text-truncate mb-0"> Tong so tuyen duong</p>
                    </div>
                    <div class="flex-shrink-0">

                    </div>
                </div>
                <div class="d-flex align-items-end justify-content-between mt-4">
                    <div>
                        <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="559.25">${countroute}</span> </h4>

                    </div>
                    <div class="avatar-sm flex-shrink-0">
                        <span class="avatar-title bg-soft-success rounded fs-3">
                            <i class="bx bx-home-circle text-success"></i>
                        </span>
                    </div>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->

    <div class="col-xl-4 col-md-6 ">
        <!-- card -->
        <div class="card card-animate">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1 overflow-hidden">
                        <p class="text-uppercase fw-medium text-muted text-truncate mb-0">Tong so chuyen xe</p>
                    </div>
                    <div class="flex-shrink-0">

                    </div>
                </div>
                <div class="d-flex align-items-end justify-content-between mt-4">
                    <div>
                        <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="36894">${countbusesbybushome}</span></h4>

                    </div>
                    <div class="avatar-sm flex-shrink-0">
                        <span class="avatar-title bg-soft-info rounded fs-3">
                            <i class="bx bx-bowling-ball text-info"></i>
                        </span>
                    </div>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->

    <div class="col-xl-4 col-md-6">
        <!-- card -->
        <div class="card card-animate">
            <div class="card-body">
                <div class="d-flex align-items-center">
                    <div class="flex-grow-1 overflow-hidden">
                        <p class="text-uppercase fw-medium text-muted text-truncate mb-0">Tong doanh thu</p>
                    </div>
                    <div class="flex-shrink-0">
                        <h5 class="text-success fs-14 mb-0">
                            <i class="ri-arrow-right-up-line fs-13 align-middle"></i> 
                        </h5>
                    </div>
                </div>
                <div class="d-flex align-items-end justify-content-between mt-4">
                    <div>
                        <h4 class="fs-22 fw-semibold ff-secondary mb-4"><span class="counter-value" data-target="183.35">0</span>M </h4>

                    </div>
                    <div class="avatar-sm flex-shrink-0">
                        <span class="avatar-title bg-soft-warning rounded fs-3">
                            <i class="bx bx-bitcoin text-warning"></i>
                        </span>
                    </div>
                </div>
            </div><!-- end card body -->
        </div><!-- end card -->
    </div><!-- end col -->

</div>
<!--<div class="row">
    <div class="col-md-6 col-xs-12">
        <table class="table">
            <tr>
                <th>Id</th>
                <th>Ten tuyen</th>
                <th>So chuyen </th>
            </tr>
<c:forEach items="${countbuses}" var="c">
    <tr>
        <td>${c[0]}</td>
        <td>${c[1]}</td>
        <td>${c[2]}</td>
    </tr>
</c:forEach>
</table>
</div>
<div class="col-md-6 col-xs-12">
<canvas id="myChart"></canvas>
</div>
</div>-->
<div class="row">
    <div class="col-xl-6">
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
                                    <th>Id</th>
                                    <th>Ten tuyen</th>
                                    <th>So chuyen </th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${countbuses}" var="c">
                                    <tr>
                                        <td>${c[0]}</td>
                                        <td>${c[1]}</td>
                                        <td>${c[2]}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="col-xl-6">
        <div class="card">
            <div class="card-header">
                <h4 class="card-title mb-0">Thong ke</h4>
            </div>
            <div class="card-body">
                <canvas id="myChart" class="chartjs-chart" data-colors='["--vz-primary-rgb, 0.8", "--vz-primary-rgb, 0.9"]'></canvas>

            </div>
        </div>
    </div> <!-- end col -->
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="<c:url value="/js/stats.js" />"></script>
<script>
    window.onload = function () {
        let data = [];
        let labels = [];
    <c:forEach items="${countbuses}" var="c">
        data.push(${c[2]});
        labels.push('${c[1]}');
    </c:forEach>


        Stats(labels, data);
    }
</script>