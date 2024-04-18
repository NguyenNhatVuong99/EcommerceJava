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
                    <div class="container-fluid">

                        <!-- Page Heading -->

                        <!-- DataTales Example -->
                        <div class="card shadow mb-4">
                            <div class="card-header py-3 d-flex justify-content-between align-items-center">
                                <h3 class="m-0 font-weight-bold text-primary">Manager User</h3>
                                <button class="btn btn-primary" onclick="window.location.href = 'admin-user-create.jsp';return false;">
                                    <i class="fa fa-plus"></i>
                                    Create User
                                </button>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th></th>

                                            </tr>
                                        </thead>


                                        <tbody>
                                            <% // out.print(ConnectDB.getInstance()); %>
                                            <c:forEach var="item" items="${userList}" varStatus="loop">
                                                <!-- set up a link for each student -->
                                                <c:url var="tempLink" value="UserController">
                                                    <c:param name="command" value="LOAD"></c:param>
                                                    <c:param name="userId" value="${item.id}"></c:param>
                                                </c:url>
                                                <!-- set up a link to delete a student -->

                                                <c:url var="deleteLink" value="UserController">
                                                    <c:param name="command" value="DELETE"></c:param>
                                                    <c:param name="userId" value="${item.id}"></c:param>
                                                </c:url>
                                                <tr>
                                                    <td>${loop.index + 1}</td>

                                                    <td>${item.name}</td>
                                                    <td>${item.email}</td>
                                                    <td class="d-flex justify-content-around">
                                                        <a href="${tempLink}" class="btn btn-warning"><i class="fa fa-pen"></i></a>

                                                        <form method="POST" action="${deleteLink}" onsubmit="return confirm('Are you sure you want to delete?');">
                                                            <button type="submit" class="btn btn-danger"><i class="fa fa-trash"></i></button>
                                                        </form>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <%@include file="includes/footer_admin.jsp" %>
                <script>
                    $(document).ready(function () {
                        $('#dataTable').DataTable();
                    });

                </script>
                </body>

                </html>