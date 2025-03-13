<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page trimDirectiveWhitespaces="true" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <% pageContext.setAttribute("dateFormatter",
                    java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")); %>

                    <!DOCTYPE html>
                    <html lang="vi">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <meta name="description" content="Quản lý ký túc xá" />
                        <meta name="author" content="" />
                        <title>Chi tiết hợp đồng</title>
                        <link href="/css/styles.css" rel="stylesheet" />
                        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                            crossorigin="anonymous"></script>
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
                                        <h1 class="mt-4">Chi tiết hợp đồng</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                            <li class="breadcrumb-item"><a href="/admin/hopdong">Danh sách hợp đồng</a>
                                            </li>
                                            <li class="breadcrumb-item active">Chi tiết hợp đồng</li>
                                        </ol>

                                        <!-- Hiển thị thông báo lỗi nếu có -->
                                        <c:if test="${not empty errorMessage}">
                                            <div class="alert alert-danger">
                                                ${errorMessage}
                                            </div>
                                        </c:if>

                                        <!-- Hiển thị chi tiết hợp đồng -->
                                        <c:if test="${not empty hopDong}">
                                            <div class="card mb-4">
                                                <div class="card-header">
                                                    <i class="fas fa-file-contract me-1"></i>
                                                    Thông tin hợp đồng
                                                </div>
                                                <div class="card-body">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <h4>Thông tin cơ bản</h4>
                                                            <table class="table table-borderless">
                                                                <tr>
                                                                    <th style="width: 40%">Mã hợp đồng:</th>
                                                                    <td>${hopDong.maHD}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Ngày bắt đầu:</th>
                                                                    <td>${hopDong.ngayBatDau.format(dateFormatter)}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Ngày kết thúc:</th>
                                                                    <td>${hopDong.ngayKetThuc.format(dateFormatter)}
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Trạng thái:</th>
                                                                    <td>
                                                                        <c:choose>
                                                                            <c:when test="${hopDong.trangThai == 0}">
                                                                                <span class="badge bg-danger">Đã hết
                                                                                    hạn</span>
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                <span class="badge bg-success">Còn hiệu
                                                                                    lực</span>
                                                                            </c:otherwise>
                                                                        </c:choose>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>

                                                        <div class="col-md-6">
                                                            <h4>Thông tin sinh viên</h4>
                                                            <table class="table table-borderless">
                                                                <tr>
                                                                    <th style="width: 40%">Mã sinh viên:</th>
                                                                    <td>${hopDong.sinhVien.maSV}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Họ tên:</th>
                                                                    <td>${hopDong.sinhVien.hoTen}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Số điện thoại:</th>
                                                                    <td>${hopDong.sinhVien.soDienThoai}</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>

                                                    <div class="row mt-4">
                                                        <div class="col-md-6">
                                                            <h4>Thông tin phòng</h4>
                                                            <table class="table table-borderless">
                                                                <tr>
                                                                    <th style="width: 40%">Mã phòng:</th>
                                                                    <td>${hopDong.phong.maPhong}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Loại phòng:</th>
                                                                    <td>${hopDong.phong.loaiPhong.tenLoaiPhong}</td>
                                                                </tr>
                                                                <tr>
                                                                    <th>Số giường tối đa:</th>
                                                                    <td>${hopDong.phong.soLuongToiDa}</td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="card-footer">
                                                    <div class="d-flex justify-content-between">
                                                        <a href="/admin/hopdong" class="btn btn-secondary">
                                                            <i class="fas fa-arrow-left"></i> Quay lại
                                                        </a>
                                                        <div>
                                                            <!-- Thêm nút Xuất PDF ở đây -->
                                                            <a href="/admin/hopdong/xuatpdf/${hopDong.maHD}"
                                                                class="btn btn-success me-2">
                                                                <i class="fas fa-file-pdf"></i> Xuất PDF
                                                            </a>
                                                            <a href="/admin/hopdong/sua/${hopDong.maHD}"
                                                                class="btn btn-primary me-2">
                                                                <i class="fas fa-edit"></i> Sửa
                                                            </a>
                                                            <a href="/admin/hopdong/xoa/${hopDong.maHD}"
                                                                class="btn btn-danger">
                                                                <i class="fas fa-trash"></i> Xóa
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:if>
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