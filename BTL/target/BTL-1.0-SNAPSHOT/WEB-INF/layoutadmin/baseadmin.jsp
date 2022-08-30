<%-- 
    Document   : baseadmin
    Created on : Aug 17, 2022, 11:04:28 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>
            <tiles:insertAttribute name="title" />
        </title>
        <link rel="shortcut icon" href=" <c:url value="/assets/images/favicon.ico" />">

        <!-- jsvectormap css -->
        <link href="<c:url value="/assets/libs/jsvectormap/css/jsvectormap.min.css" />" rel="stylesheet"  />

        <!--Swiper slider css-->
        <link href="<c:url value="/assets/libs/swiper/swiper-bundle.min.css"/>" rel="stylesheet"  />

        <!-- Layout config Js -->
        <script src="<c:url value="/assets/js/layout.js"/>"></script>
        <!-- Bootstrap Css -->
        <link href="<c:url value="/assets/css/bootstrap.min.css"/>" rel="stylesheet"/>
        <!-- Icons Css -->
        <link href="<c:url value="/assets/css/icons.min.css"/>" rel="stylesheet"  />
        <!-- App Css-->
        <link href="<c:url value="/assets/css/app.min.css"/>" rel="stylesheet" />
        <!-- custom Css-->
        <link href="<c:url value="/assets/css/custom.min.css"/>" rel="stylesheet" />


    <body>
        <tiles:insertAttribute name="header" />
        <div style="margin-left:255px; margin-right: 20px; margin-top: 100px;">
        <tiles:insertAttribute name="content" />
        </div>
        <tiles:insertAttribute name="footer" />

        <script src="<c:url value="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/simplebar/simplebar.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/node-waves/waves.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/feather-icons/feather.min.js"/>"></script>
        <script src="<c:url value="/assets/js/pages/plugins/lord-icon-2.1.0.js"/>"></script>
<!--        <script src="<c:url value="/assets/js/plugins.js"/>"></script>-->

    </body>
</html>
