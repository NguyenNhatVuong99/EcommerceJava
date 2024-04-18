<%@page import="connection.ConnectDB"%>
<%@page pageEncoding="UTF-8" %>

<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>SB Admin 2 - Dashboard</title>

        <%@include file="includes/head_admin.jsp" %>


    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <%@include file="includes/sidebar_admin.jsp" %>

            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <%@include file="includes/navbar_admin.jsp" %>

                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid" style="width: 50%">
                        
                        <!-- Page Heading -->

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                <h3 class="m-0 font-weight-bold text-primary">Update User</h3>

                            </div>
                            <div class="card-body">
                                <form action="UserController" method="POST">
                                    <input type="hidden" name="command" value="UPDATE">
                                    <input type="hidden" name="userId" value="${THE_USER.id}">
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Full name</label>
                                        <input name="name" value="${THE_USER.name}" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Email address</label>
                                        <input name="email" value="${THE_USER.email}" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Password</label>
                                        <input name="password" value="${THE_USER.password}"  type="password" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <a href="UserController" class="btn btn-primary">
                                        <i class="fa fa-arrow-left"></i>
                                        BACK
                                    </a>
                                    <button type="submit" value="UPDATE" class="btn btn-success float-right"><i class="fa fa-save"></i> SAVE</button>
                                </form>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <%@include file="includes/footer_admin.jsp" %>

                </body>

                </html>