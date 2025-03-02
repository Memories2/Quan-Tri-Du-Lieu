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
                <title>Quản lý dich vu</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
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
                                <h1 class="mt-4">Quản lý phòng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Quản lý phòng</li>
                                </ol>

                                <!-- Alert messages -->
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        ${successMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ${errorMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <div class="card mb-4">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="fas fa-table me-1"></i>
                                            Danh sách phòng
                                        </div>
                                        <a href="/admin/phong/taophong" class="btn btn-primary">
                                            <i class="fas fa-plus-circle"></i> Thêm phòng mới
                                        </a>
                                    </div>
                                    <div class="card-body">
                                        <table id="phongTable" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã phòng</th>
                                                    <th>Số phòng</th>
                                                    <th>Loại phòng</th>
                                                    <th>Số lượng tối đa</th>
                                                    <th>Tình trạng</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="phong" items="${danhSachPhong}">
                                                    <tr>
                                                        <td>${phong.maPhong}</td>
                                                        <td>${phong.soPhong}</td>
                                                        <td>${phong.loaiPhong.tenLoaiPhong}</td>
                                                        <td>${phong.soLuongToiDa}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${phong.tinhTrang == 'TRONG'}">
                                                                    <span class="badge bg-success">Trống</span>
                                                                </c:when>
                                                                <c:when test="${phong.tinhTrang == 'DAY'}">
                                                                    <span class="badge bg-danger">Đầy</span>
                                                                </c:when>
                                                                <c:when test="${phong.tinhTrang == 'SUACHUA'}">
                                                                    <span class="badge bg-warning text-dark">Sửa chữa</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td>
                                                            <div class="d-flex gap-2">
                                                                <a href="/admin/phong/chitiet/${phong.maPhong}" class="btn btn-sm btn-info">
                                                                    <i class="fas fa-eye"></i>
                                                                </a>
                                                                <a href="/admin/phong/suaphong/${phong.maPhong}" class="btn btn-sm btn-primary">
                                                                    <i class="fas fa-edit"></i>
                                                                </a>
                                                                <a href="/admin/phong/xoaphong/${phong.maPhong}" class="btn btn-sm btn-danger">
                                                                    <i class="fas fa-trash-alt"></i>
                                                                </a>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
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
                <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
                <script>
                    $(document).ready(function() {
                        $('#phongTable').DataTable({
                            language: {
                                url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',
                            },
                        });
                    });
                </script>
            </body>
            </html>
