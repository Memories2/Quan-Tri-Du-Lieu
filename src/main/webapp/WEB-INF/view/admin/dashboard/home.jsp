<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h1>Thông tin cá nhân</h1>
<table>
    <tr>
        <td>Mã sinh viên:</td>
        <td>${sinhVien.maSV}</td>
    </tr>
    <tr>
        <td>Họ tên:</td>
        <td>${sinhVien.hoTen}</td>
    </tr>
    <tr>
        <td>Giới tính:</td>
        <td>${sinhVien.gioiTinh}</td>
    </tr>
</table>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Hostel Management System" />
    <meta name="author" content="" />
    <title>Dashboard - Hostel Management</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
  </head>

  <body class="sb-nav-fixed">
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
      <jsp:include page="../layout/sidebar.jsp" />

      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Dashboard</h1>
            <ol class="breadcrumb mb-4">
              <li class="breadcrumb-item active">Thống kê hệ thống</li>
            </ol>
            <div class="row">
              <!-- Phòng -->
              <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                  <div class="card-body">Tổng số phòng (${countPhong})</div> <!-- Sử dụng countPhong từ model -->
                  <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="/admin/phong">Xem chi tiết</a>
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Sinh viên -->
              <div class="col-xl-3 col-md-6">
                <div class="card bg-info text-white mb-4">
                  <div class="card-body">Sinh viên đang ở (${countSinhVien})</div> <!-- Sử dụng countSinhVien từ model -->
                  <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="/admin/sinhvien">Xem chi tiết</a>
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Hợp đồng -->
              <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                  <div class="card-body">Hợp đồng hiện có (${countHopDong})</div> <!-- Sử dụng countHopDong từ model -->
                  <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="/admin/hopdong">Xem chi tiết</a>
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>

              <!-- Hóa đơn -->
              <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                  <div class="card-body">Hóa đơn chưa thanh toán (${countHoaDon})</div> <!-- Sử dụng countHoaDon từ model -->
                  <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="/admin/hoadon">Xem chi tiết</a>
                    <div class="small text-white">
                      <i class="fas fa-angle-right"></i>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </main>
        <jsp:include page="../layout/footer.jsp" />
      </div>
    </div>

    <!-- Scripts remain unchanged -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
  </body>
</html>
