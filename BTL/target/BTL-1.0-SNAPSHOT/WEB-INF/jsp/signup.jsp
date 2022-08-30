<%-- 
    Document   : register
    Created on : Aug 19, 2022, 1:14:07 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en" data-layout="vertical" data-topbar="light" data-sidebar="dark" data-sidebar-size="lg" data-sidebar-image="none">


    <!-- Mirrored from themesbrand.com/velzon/html/default/auth-signin-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 08 Aug 2022 21:29:20 GMT -->
    <head>

        <meta charset="utf-8" />
        <title>Sign In | Velzon - Admin & Dashboard Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
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

    </head>

    <body>

        <div class="auth-page-wrapper pt-5">
            <!-- auth page bg -->
            <div class="auth-one-bg-position auth-one-bg" id="auth-particles">
                <div class="bg-overlay"></div>

                <div class="shape">
                    <svg xmlns="http://www.w3.org/2000/svg" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" viewBox="0 0 1440 120">
                    <path d="M 0,36 C 144,53.6 432,123.2 720,124 C 1008,124.8 1296,56.8 1440,40L1440 140L0 140z"></path>
                    </svg>
                </div>
            </div>

            <!-- auth page content -->
            <div class="auth-page-content">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center mt-sm-5 mb-4 text-white-50">

                            </div>
                        </div>
                    </div>
                    <!-- end row -->

                    <div class="row justify-content-center">
                        <div class="col-md-8 col-lg-6 col-xl-5">
                            <div class="card mt-4">

                                <div class="card-body p-4">
                                    <div class="text-center mt-2">
                                        <h5 class="text-primary">Create New Account</h5>
                                        <p class="text-muted">Get your free account now</p>
                                    </div>
                                    <div class="p-2 mt-4">
                                        <c:url value="/signup" var="action" />
                                        <form:form method="post" 
                                                   enctype="multipart/form-data"
                                                   action="${action}" 
                                                   modelAttribute="user">
                                            <div class="form-group">
                                                <label>First name</label>
                                                <form:input path="firstName" class="form-control"  />
                                            </div>
                                            <div class="form-group">
                                                <label>Last name</label>
                                                <form:input path="lastName" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Email</label>
                                                <form:input path="email" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Phone</label>
                                                <form:input path="phone" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Username</label>
                                                <form:input path="username" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Password</label>
                                                <form:password path="password" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>Confirm password</label>
                                                <form:password path="confirmPassword" class="form-control" />
                                            </div>
                                            <div class="form-group">
                                                <label>UserRole</label>
                                                <form:select path="userRole" class="form-select" id="userRole" name="userRole">
                                                    <option value="ROLE_BUSHOME">BUSHOME</option>
                                                    <option value="ROLE_USER">USER</option>
                                                    
                                                </form:select>
                                            </div>
                                            <div class="form-group">
                                                <label>Avatar</label>
                                                <form:input type="file" path="file" class="form-control" />
                                            </div>
                                            
                                            <br>
                                            <input type="submit" value="Sign Up" class="btn btn-danger" />
                                        </form:form>

                                    </div>
                                </div>
                                <!-- end card body -->
                            </div>
                            <!-- end card -->

                            <div class="mt-4 text-center">
                                <p class="mb-0">Already have an account ? <a href="<c:url value="/signin" />" class="fw-semibold text-primary text-decoration-underline"> Signin </a> </p>
                            </div>

                        </div>
                    </div>
                    <!-- end row -->
                </div>
                <!-- end container -->
            </div>
            <!-- end auth page content -->

            <!-- footer -->
            <footer class="footer">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="text-center">
                                <p class="mb-0 text-muted">&copy;
                                    <script>document.write(new Date().getFullYear())</script> Wellcome <i class="mdi mdi-heart text-danger"></i> with our
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- end Footer -->
        </div>
        <!-- end auth-page-wrapper -->

        <!-- JAVASCRIPT -->
        <script src="<c:url value="/assets/libs/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/simplebar/simplebar.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/node-waves/waves.min.js"/>"></script>
        <script src="<c:url value="/assets/libs/feather-icons/feather.min.js"/>"></script>
        <script src="<c:url value="/assets/js/pages/plugins/lord-icon-2.1.0.js"/>"></script>
        <script src="assets/js/plugins.js"></script>

        <!-- particles js -->
        <script src="<c:url value="assets/libs/particles.js/particles.js"/>"></script>
        <!-- particles app js -->

        <script src="<c:url value="assets/js/pages/particles.app.js"/>"></script>
        <!-- password-addon init -->

        <script src="<c:url value="assets/js/pages/password-addon.init.js"/>"></script>
    </body>


    <!-- Mirrored from themesbrand.com/velzon/html/default/auth-signin-basic.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 08 Aug 2022 21:29:20 GMT -->
</html>