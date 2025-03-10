<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <!DOCTYPE html>
                <html lang="vi">

                <head>
                    <meta charset="utf-8" />
                    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                    <meta name="description" content="Dự án quản lý ký túc xá" />
                    <meta name="author" content="" />
                    <title>Chi tiết phòng</title>
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
                                    <h1 class="mt-4">Chi tiết phòng</h1>
                                    <ol class="breadcrumb mb-4">
                                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                        <li class="breadcrumb-item"><a href="/admin/phong">Quản lý phòng</a></li>
                                        <li class="breadcrumb-item active">Chi tiết phòng ${phong.maPhong}</li>
                                    </ol>
                                    <div class="container mt-4">
                                        <div class="row">
                                            <div class="col-lg-8 col-md-10 mx-auto">
                                                <div class="card mb-4">
                                                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                                        <h5 class="mb-0">Thông tin phòng ${phong.soPhong}</h5>
                                                        <div>
                                                            <a href="/admin/phong/suaphong/${phong.maPhong}" class="btn btn-light btn-sm">
                                                                <i class="fas fa-edit me-1"></i>Sửa
                                                            </a>
                                                            <a href="/admin/phong/xoaphong/${phong.maPhong}" class="btn btn-danger btn-sm">
                                                                <i class="fas fa-trash-alt me-1"></i>Xóa
                                                            </a>
                                                        </div>
                                                    </div>
                                                    <div class="card-body">
                                                        <table class="table table-striped table-bordered">
                                                            <tbody>
                                                                <tr>
                                                                    <th style="width: 30%">Mã phòng:</th>
                                                                    <td>${phong.maPhong}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Số phòng:</th>
                                                                    <td>${phong.soPhong}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Loại phòng:</th>
                                                                    <td>${phong.loaiPhong.tenLoaiPhong}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Giá thuê:</th>
                                                                    <td><fmt:formatNumber value="${phong.loaiPhong.giaThue}" type="currency" currencySymbol="VNĐ" maxFractionDigits="0"/>/tháng</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Số lượng tối đa:</th>
                                                                    <td>${phong.soLuongToiDa} người</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Tình trạng:</th>
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
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                    </div>
                                                </div>
                                                
                                                <!-- Sinh viên trong phòng - có thể thêm sau -->
                                                <div class="card mb-4">
                                                    <div class="card-header bg-info text-white">
                                                        <h5 class="mb-0">Danh sách sinh viên trong phòng</h5>
                                                    </div>
                                                    <div class="card-body">
														<table class="table table-bordered table-hover mt-3">
														                <thead class="table-dark">
														                    <tr>
														                        <th>Mã SV</th>
														                        <th>Họ Tên</th>
														                        <th>Số Điện Thoại</th>
														                    </tr>
														                </thead>
														                <tbody>
														                    <c:forEach var="sinhVien" items="${sinhVienList}">
														                        <tr>
														                            <td>${sinhVien.maSV}</td>
														                            <td>${sinhVien.hoTen}</td>
														                            <td>${sinhVien.soDienThoai}</td>
														                        </tr>
														                    </c:forEach>
														                    <c:if test="${empty sinhVienList}">
														                        <tr>
														                            <td colspan="4" class="text-center text-danger">Không tồn tại sinh viên có thông tin như trên</td>
														                        </tr>
														                    </c:if>
                                                                            
														                </tbody>
														            </table>
                                                        <!-- Hiển thị danh sách sinh viên nếu có -->
                                                    </div>
                                                </div>
                                                
                                                <div class="text-center mt-4 mb-5">
                                                    <a href="/admin/phong" class="btn btn-secondary">
                                                        <i class="fas fa-arrow-left me-2"></i>Quay lại danh sách phòng
                                                    </a>
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
