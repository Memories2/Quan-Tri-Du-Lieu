<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Dự án quản lý ký túc xá" />
                <meta name="author" content="" />
                <title>Xóa phòng</title>
                <link href="/css/styles.css" rel="stylesheet" />
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
                                <h1 class="mt-4">Xóa phòng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/phong">Quản lý phòng</a></li>
                                    <li class="breadcrumb-item active">Xóa phòng</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <div class="card border-danger">
                                                <div class="card-header bg-danger text-white">
                                                    <h3 class="mb-0">Xác nhận xóa phòng</h3>
                                                </div>
                                                <div class="card-body">
                                                    <p class="lead">Bạn có chắc chắn muốn xóa phòng này không?</p>

                                                    <div class="alert alert-warning">
                                                        <i class="fas fa-exclamation-triangle"></i> 
                                                        Cảnh báo: Thao tác này không thể hoàn tác. Tất cả dữ liệu liên quan đến phòng này sẽ bị xóa vĩnh viễn.
                                                    </div>

                                                    <table class="table table-bordered mt-3">
                                                        <tr>
                                                            <th>Mã phòng</th>
                                                            <td>${phong.maPhong}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Số phòng</th>
                                                            <td>${phong.soPhong}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Loại phòng</th>
                                                            <td>${phong.loaiPhong.tenLoaiPhong}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Số lượng tối đa</th>
                                                            <td>${phong.soLuongToiDa}</td>
                                                        </tr>
                                                        <tr>
                                                            <th>Tình trạng</th>
                                                            <td>
                                                                <c:choose>
                                                                    <c:when test="${phong.tinhTrang == 'TRONG'}">
                                                                        <span class="badge bg-success">Trống</span>
                                                                    </c:when>
                                                                    <c:when test="${phong.tinhTrang == 'DAY'}">
                                                                        <span class="badge bg-danger">Đầy</span>
                                                                    </c:when>
                                                                    <c:when test="${phong.tinhTrang == 'SUACHUA'}">
                                                                        <span class="badge bg-warning">Sửa chữa</span>
                                                                    </c:when>
                                                                </c:choose>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <form action="/admin/phong/xoaphong/${phong.maPhong}" method="post" class="mt-4">
                                                        <div class="d-flex justify-content-between">
                                                            <a href="/admin/phong" class="btn btn-secondary">
                                                                <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                            </a>
                                                            <button type="submit" class="btn btn-danger">
                                                                <i class="fas fa-trash-alt me-1"></i> Xác nhận xóa
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
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
