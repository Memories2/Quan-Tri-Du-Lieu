<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%-- Sidebar --%>
<div id="layoutSidenav_nav">
  <nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
    <div class="sb-sidenav-menu">
      <div class="nav">
        <!-- Thông Tin Cá Nhân -->
        <div class="sb-sidenav-menu-heading">CÁ NHÂN</div>
        <a class="nav-link" href="../ho-so-sinh-vien.jsp">
          <div class="sb-nav-link-icon"><i class="fas fa-id-card"></i></div>
          Hồ sơ cá nhân
        </a>

        <!-- Quản Lý Phòng -->
        <div class="sb-sidenav-menu-heading">QUẢN LÝ PHÒNG</div>
        <a class="nav-link" href="/student/phong">
          <div class="sb-nav-link-icon"><i class="fas fa-door-open"></i></div>
          Thông tin phòng
        </a>

        <!-- Hợp Đồng & Thanh Toán -->
        <div class="sb-sidenav-menu-heading">HỢP ĐỒNG & HÓA ĐƠN</div>
        <a class="nav-link" href="/student/hopdong">
          <div class="sb-nav-link-icon">
            <i class="fas fa-file-contract"></i>
          </div>
          Hợp đồng thuê
        </a>
        <a class="nav-link" href="/student/hoadon">
          <div class="sb-nav-link-icon"><i class="fas fa-receipt"></i></div>
          Hóa đơn
        </a>

        <!-- Dịch Vụ -->
        <div class="sb-sidenav-menu-heading">DỊCH VỤ</div>
        <a class="nav-link" href="/sinhvien/dich-vu">
          <div class="sb-nav-link-icon">
            <i class="fas fa-concierge-bell"></i>
          </div>
          Đăng ký dịch vụ
        </a>
      </div>
    </div>

    <!-- Footer Sidebar -->
    <div class="sb-sidenav-footer bg-light">
      <div class="small">Hỗ trợ 24/7:</div>
      <div class="text-primary">1900 9090</div>
    </div>
  </nav>
</div>
