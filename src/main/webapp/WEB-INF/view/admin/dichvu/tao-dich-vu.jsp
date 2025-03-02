<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Dự án laptopshop" />
                <meta name="author" content="" />
                <title>Tạo mới phòng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">

                <!--Header-->
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <!--Sidebar-->
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Tạo mới dịch vụ</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Tạo mới dịch vụ</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Thêm phòng mới</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/dichvu/taodichvu"
                                                modelAttribute="newDichVu" class="row" enctype="multipart/form-data">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã dịch vụ:</label>
                                                    <form:input type="text" class="form-control" path="maDV" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Tên Dịch Vụ:</label>
                                                    <form:input type="text" class="form-control" path="tenDichVu" />
                                                </div>
                                        
                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Đơn giá</label>
                                                    <form:input type="number" class="form-control"
                                                        path="donGia" />
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Tạo Dịch Vụ</button>
                                                    <a href="/admin/phong" class="btn btn-secondary">Hủy</a>
                                                </div>

                                            </form:form>

                                        </div>

                                    </div>
                                </div>
                            </div>
                        </main>
                        <!--Footer-->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>


            </body>

            </html>