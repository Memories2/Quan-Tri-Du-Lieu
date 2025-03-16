<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Quản lý phiếu đăng ký" />
                <meta name="author" content="" />
                <title>Quản lý phiếu đăng ký - Ký túc xá</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
                <style>
                    .badge-waiting {
                        background-color: #ffc107;
                        color: #212529;
                    }

                    .badge-approved {
                        background-color: #198754;
                        color: white;
                    }

                    .badge-rejected {
                        background-color: #dc3545;
                        color: white;
                    }

                    .card {
                        box-shadow: 0 0.15rem 1.75rem 0 rgba(33, 40, 50, 0.15);
                        margin-bottom: 1.5rem;
                    }

                    .action-buttons .btn {
                        margin-right: 5px;
                    }
                </style>
            </head>

            <body class="sb-nav-fixed">

                <div id="layoutSidenav">
                    <jsp:include page="../layout/header.jsp" />
                    <div id="layoutSidenav_content">
                        <!--Sidebar-->
                        <jsp:include page="../layout/sidebar.jsp" />
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Quản lý phiếu đăng ký</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Phiếu đăng ký</li>
                                </ol>

                                <!-- Alert messages -->
                                <c:if test="${not empty successMessage}">
                                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                                        ${successMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                </c:if>
                                <c:if test="${not empty errorMessage}">
                                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                        ${errorMessage}
                                        <button type="button" class="btn-close" data-bs-dismiss="alert"
                                            aria-label="Close"></button>
                                    </div>
                                </c:if>

                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                        Danh sách phiếu đăng ký
                                    </div>
                                    <div class="card-body">
                                        <table id="datatablesPhieuDangKy" class="table table-striped table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Mã phiếu</th>
                                                    <th>Mã SV</th>
                                                    <th>Họ tên SV</th>
                                                    <th>Phòng</th>
                                                    <th>Loại phòng</th>
                                                    <th>Trạng thái</th>
                                                    <th>Thao tác</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="phieuDangKy" items="${phieuDangKyList}">
                                                    <tr>
                                                        <td>${phieuDangKy.maPhieuDK}</td>
                                                        <td>${phieuDangKy.sinhVien.maSV}</td>
                                                        <td>${phieuDangKy.sinhVien.hoTen}</td>
                                                        <td>${phieuDangKy.phong.maPhong}</td>
                                                        <td>${phieuDangKy.phong.loaiPhong.tenLoaiPhong}</td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${phieuDangKy.trangThai == 0}">
                                                                    <span class="badge badge-waiting">Chờ duyệt</span>
                                                                </c:when>
                                                                <c:when test="${phieuDangKy.trangThai == 1}">
                                                                    <span class="badge badge-approved">Đã duyệt</span>
                                                                </c:when>
                                                                <c:when test="${phieuDangKy.trangThai == 2}">
                                                                    <span class="badge badge-rejected">Đã hủy</span>
                                                                </c:when>
                                                            </c:choose>
                                                        </td>
                                                        <td class="action-buttons">
                                                            <a href="/admin/hopdong/themHopDong/${phieuDangKy.maPhieuDK}"
                                                                class="btn btn-success btn-sm"
                                                                title="Duyệt phiếu đăng ký">
                                                                <i class="fas fa-check"></i> Duyệt
                                                            </a>
                                                            <a href="/admin/phieudangky/reject/${phieuDangKy.maPhieuDK}"
                                                                class="btn btn-danger btn-sm"
                                                                title="Từ chối phiếu đăng ký">
                                                                <i class="fas fa-times"></i> Từ chối
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <footer class="py-4 bg-light mt-auto">
                            <div class="container-fluid px-4">
                                <div class="d-flex align-items-center justify-content-between small">
                                    <div class="text-muted">Copyright &copy; Ký túc xá sinh viên 2025</div>
                                    <div>
                                        <a href="#">Chính sách bảo mật</a>
                                        &middot;
                                        <a href="#">Điều khoản &amp; Điều kiện</a>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>

                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $('#datatablesPhieuDangKy').DataTable({
                            language: {
                                url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json',
                            },
                            responsive: true
                        });
                    });
                </script>
            </body>

            </html>