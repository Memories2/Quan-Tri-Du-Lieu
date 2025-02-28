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
                                <h1 class="mt-4">Tạo mới phòng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Tạo mới phòng</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Thêm phòng mới</h3>
                                            <hr />
                                            <form:form method="post" action="/admin/phong/taophong"
                                                modelAttribute="newPhong" class="row" enctype="multipart/form-data">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã phòng:</label>
                                                    <form:input type="text" class="form-control" path="maPhong" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Số phòng:</label>
                                                    <form:input type="text" class="form-control" path="soPhong" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Loại phòng:</label>
                                                    <form:select class="form-select" path="loaiPhong.maLoaiPhong">
                                                        <form:option value="2">Phòng 2</form:option>
                                                        <form:option value="4">Phòng 4</form:option>
                                                        <form:option value="6">Phòng 6</form:option>
                                                        <form:option value="8">Phòng 8</form:option>
                                                    </form:select>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Số lượng tối đa:</label>
                                                    <form:input type="number" class="form-control"
                                                        path="soLuongToiDa" />
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <label class="form-label">Tình Trạng</label>
                                                    <form:input type="text" class="form-control" path="tinhTrang" />

                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Tạo phòng</button>
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