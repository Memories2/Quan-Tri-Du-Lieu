<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% pageContext.setAttribute("dateFormatter", java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")); %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Quản lý ký túc xá" />
    <meta name="author" content="" />
    <title>Chi tiết hóa đơn</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">
    <!-- Header -->
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <!-- Sidebar -->
        <jsp:include page="../layout/sidebar.jsp" />

        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Chi tiết hóa đơn</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                        <li class="breadcrumb-item"><a href="/admin/hoadon">Danh sách hóa đơn</a></li>
                        <li class="breadcrumb-item active">Chi tiết hóa đơn</li>
                    </ol>

                    <!-- Hiển thị thông báo lỗi nếu có -->
                    <c:if test="${not empty errorMessage}">
                        <div class="alert alert-danger">
                            ${errorMessage}
                        </div>
                    </c:if>

                    <!-- Hiển thị chi tiết hóa đơn -->
                    <c:if test="${not empty hoaDon}">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-file-invoice me-1"></i>
                                Thông tin hóa đơn
                            </div>
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h4>Thông tin hóa đơn</h4>
                                        <table class="table table-borderless">
                                            <tr>
                                                <th style="width: 40%">Mã hóa đơn:</th>
                                                <td>${hoaDon.maHoaDon}</td>
                                            </tr>
                                            <tr>
                                                <th>Ngày lập:</th>
                                                <td>${hoaDon.ngayLap.format(dateFormatter)}</td>
                                            </tr>
                                            <tr>
                                                <th>Ngày hết hạn:</th>
                                                <td>${hoaDon.ngayHetHan.format(dateFormatter)}</td>
                                            </tr>
                                            <tr>
                                                <th>Tổng tiền:</th>
                                                <td>${hoaDon.tongTien}</td>
                                            </tr>
                                            <tr>
                                                <th>Trạng thái thanh toán:</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${hoaDon.daThanhToan}">
                                                            <span class="badge bg-success">Đã thanh toán</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span class="badge bg-danger">Chưa thanh toán</span>
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
                                                <th style="width: 40%">Mã số sinh viên:</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sinhVien != null}">
                                                            ${sinhVien.maSV}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Chưa có thông tin
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Họ tên:</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sinhVien != null}">
                                                            ${sinhVien.hoTen}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Chưa có thông tin
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Giới tính:</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sinhVien != null}">
                                                            ${sinhVien.gioiTinh}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Chưa có thông tin
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>Số điện thoại:</th>
                                                <td>
                                                    <c:choose>
                                                        <c:when test="${sinhVien != null}">
                                                            ${sinhVien.soDienThoai}
                                                        </c:when>
                                                        <c:otherwise>
                                                            Chưa có thông tin
                                                        </c:otherwise>
                                                    </c:choose>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <h4>Thông tin phòng</h4>
                                            <table class="table table-borderless">
                                                <tr>
                                                    <th style="width: 40%">Mã phòng:</th>
                                                    <td>${phong.maPhong}</td>
                                                </tr>
                                                <tr>
                                                    <th>Loại phòng:</th>
                                                    <td>${phong.loaiPhong.tenLoaiPhong}</td>
                                                </tr>
                                                <tr>
                                                    <th>Số giường tối đa:</th>
                                                    <td>${phong.soLuongToiDa}</td>
                                                </tr>
                                                <tr>
                                                    <th>Tình trạng:</th>
                                                    <td>${phong.tinhTrang}</td>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                    
                            <div class="card-footer">
                                <div class="d-flex justify-content-between">
                                    <a href="/admin/hoadon" class="btn btn-secondary">
                                        <i class="fas fa-arrow-left"></i> Quay lại
                                    </a>
                                </div>
                            </div>
                        </div>
                    </c:if>
                </div>
            </main>

            <!-- Footer -->
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>
