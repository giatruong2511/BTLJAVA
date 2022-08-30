<%-- 
    Document   : base
    Created on : Aug 13, 2022, 10:56:14 PM
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

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">


        <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/animate/animate.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/owlcarousel/assets/owl.carousel.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/lightbox/css/lightbox.min.css" />">
        <link rel="stylesheet" href="<c:url value="/css/style.css" />">


    <body>
        <tiles:insertAttribute name="header" />
        <div class="container">
            <tiles:insertAttribute name="content" />
        </div>
        <tiles:insertAttribute name="footer" />

        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="<c:url value="/js/wow/wow.min.js" />"></script>
        <script src="<c:url value="/js/easing/easing.min.js" />"></script>
        <script src="<c:url value="/js/waypoints/waypoints.min.js" />"></script>
        <script src="<c:url value="/js/counterup/counterup.min.js" />"></script>
        <script src="<c:url value="/js/owlcarousel/owl.carousel.min.js" />"></script>
        <script src="<c:url value="/js/lightbox/js/lightbox.min.js" />"></script>
        <script src="<c:url value="/js/main.js" />"></script>
    </body>
</html>