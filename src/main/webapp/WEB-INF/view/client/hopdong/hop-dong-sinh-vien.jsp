<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">
  <head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <meta name="description" content="Dự án quản lý ký túc xá" />
    <meta name="author" content="" />
    <title>Thông tin cá nhân</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script
      src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
      crossorigin="anonymous"
    ></script>
    <link
      href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css"
      rel="stylesheet"
    />
    <style>
      .navbar-brand {
        font-weight: 700;
        color: #fff;
      }

      .sidebar {
        background-color: #343a40;
      }

      .sidebar-heading {
        padding: 0.875rem 1.25rem;
        font-size: 1.2rem;
        font-weight: 700;
        color: rgba(255, 255, 255, 0.8);
      }

      .nav-link {
        color: rgba(255, 255, 255, 0.6);
        padding: 0.5rem 1rem;
        transition: color 0.2s ease-in-out;
      }

      .nav-link:hover {
        color: #fff;
      }

      .nav-link.active {
        color: #fff;
        font-weight: 600;
      }

      .card {
        box-shadow: 0 0.15rem 1.75rem 0 rgba(33, 40, 50, 0.15);
        border: none;
      }

      .card-header {
        background-color: #f8f9fa;
        border-bottom: 1px solid #e3e6ec;
      }

      .table thead th {
        background-color: #f8f9fa;
        font-weight: 600;
      }

      .footer {
        padding: 1rem 0;
        font-size: 0.875rem;
        background-color: #f8f9fa;
      }

      .badge {
        padding: 0.5em 0.75em;
      }

      .custom-room-stats {
        display: flex;
        gap: 20px;
        margin-bottom: 20px;
      }

      .stats-card {
        flex: 1;
        padding: 20px;
        border-radius: 8px;
        background-color: #fff;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        text-align: center;
      }

      .stats-card h3 {
        font-size: 16px;
        margin-bottom: 10px;
        color: #495057;
      }

      .stats-card .count {
        font-size: 28px;
        font-weight: 700;
        color: #0d6efd;
      }

      .stats-card.filled {
        background-color: #e9f5ff;
      }

      .stats-card.available {
        background-color: #e6f8e6;
      }
      table {
        width: 100%;
        border-collapse: collapse;
        margin: 1rem 0;
        font-size: 0.9em;
        min-width: 600px;
        overflow-x: auto;
      }

      table thead tr {
        background-color: #4e73df;
        color: white;
        text-align: left;
      }

      table th,
      table td {
        padding: 12px 15px;
        border: 1px solid #dddfeb;
      }

      table tbody tr {
        border-bottom: 1px solid #dddfeb;
        transition: all 0.2s ease;
      }

      table tbody tr:nth-of-type(even) {
        background-color: #f8f9fc;
      }

      table tbody tr:last-of-type {
        border-bottom: 2px solid #4e73df;
      }

      /*=============== BADGE TRẠNG THÁI ===============*/
      .status-badge {
        display: inline-block;
        padding: 0.35em 0.65em;
        font-size: 0.75em;
        font-weight: 700;
        line-height: 1;
        text-align: center;
        white-space: nowrap;
        vertical-align: baseline;
        border-radius: 0.25rem;
      }

      /* Đang hiệu lực */
      tr td:nth-child(6):contains("Đang hiệu lực") {
        background-color: #28a745 !important;
        color: white;
      }

      /* Đã kết thúc */
      tr td:nth-child(6):contains("Đã kết thúc") {
        background-color: #dc3545 !important;
        color: white;
      }

      /* Chưa xác định */
      tr td:nth-child(6):contains("Chưa xác định") {
        background-color: #6c757d !important;
        color: white;
      }
    </style>
  </head>

  <body class="sb-nav-fixed">
    <!-- Header -->
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
      <a class="navbar-brand ps-3" href="/client">KÝ TÚC XÁ SINH VIÊN</a>
      <button
        class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
        id="sidebarToggle"
        href="#!"
      >
        <i class="fas fa-bars"></i>
      </button>
      <div
        class="d-none d-md-inline-block ms-auto me-0 me-md-3 my-2 my-md-0"
      ></div>
      <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
        <li class="nav-item dropdown">
          <a
            class="nav-link dropdown-toggle"
            id="navbarDropdown"
            href="#"
            role="button"
            data-bs-toggle="dropdown"
            aria-expanded="false"
          >
            <i class="fas fa-user fa-fw"></i>
          </a>
          <ul
            class="dropdown-menu dropdown-menu-end"
            aria-labelledby="navbarDropdown"
          >
            <li>
              <a class="dropdown-item" href="/client/thong-tin-sinh-vien"
                >Thông tin cá nhân</a
              >
            </li>
            <li><a class="dropdown-item" href="#!">Đổi mật khẩu</a></li>
            <li>
              <hr class="dropdown-divider" />
            </li>
            <li><a class="dropdown-item" href="/logout">Đăng xuất</a></li>
          </ul>
        </li>
      </ul>
    </nav>

    <div id="layoutSidenav">
      <!-- Sidebar -->
      <div id="layoutSidenav_nav">
        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
          <div class="sb-sidenav-menu">
            <div class="nav">
              <div class="sb-sidenav-menu-heading">Trang chính</div>
              <a class="nav-link" href="/client">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-tachometer-alt"></i>
                </div>
                Dashboard
              </a>

              <div class="sb-sidenav-menu-heading">Quản lý</div>
              <a class="nav-link active" href="/client/hopdong">
                <div class="sb-nav-link-icon">
                  <i class="fas fa-file-contract"></i>
                </div>
                Hợp đồng của tôi
              </a>
              <div class="sb-sidenav-menu-heading">Thông tin</div>
              <a class="nav-link" href="/client/thong-tin-sinh-vien">
                <div class="sb-nav-link-icon"><i class="fas fa-user"></i></div>
                Thông tin cá nhân
              </a>
            </div>
          </div>
          <div class="sb-sidenav-footer">
            <div class="small">Đăng nhập với:</div>
            Tài khoản sinh viên
          </div>
        </nav>
      </div>

      <div id="layoutSidenav_content">
        <main>
          <div class="container-fluid px-4">
            <h1 class="mt-4">Hợp đồng của tôi</h1>

            <div class="card mb-4">
              <div class="card-header">
                <i class="fas fa-file-contract me-1"></i>
                Danh sách hợp đồng
              </div>
              <div class="card-body">
                <table>
                  <thead>
                    <tr>
                      <th>Mã Hợp Đồng</th>
                      <th>Mã Sinh Viên</th>
                      <th>Mã Phòng</th>
                      <th>Ngày Bắt Đầu</th>
                      <th>Ngày Kết Thúc</th>
                      <th>Trạng Thái</th>
                    </tr>
                  </thead>
                  <tbody>
                    <!-- Duyệt qua danh sách hợp đồng và hiển thị thông tin -->
                    <c:forEach var="hopDong" items="${hopDongs}">
                      <tr>
                        <td>${hopDong.maHD}</td>
                        <td>${hopDong.sinhVien.maSV}</td>
                        <td>${hopDong.phong.maPhong}</td>
                        <td>${hopDong.ngayBatDau}</td>
                        <td>${hopDong.ngayKetThuc}</td>
                        <td>
                          <c:choose>
                            <c:when test="${hopDong.trangThai == 1}"
                              >Đang hiệu lực</c:when
                            >
                            <c:when test="${hopDong.trangThai == 0}"
                              >Đã kết thúc</c:when
                            >
                          </c:choose>
                        </td>
                      </tr>
                    </c:forEach>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </main>

        <!-- Footer -->
        <footer class="py-4 bg-light mt-auto">
          <div class="container-fluid px-4">
            <div
              class="d-flex align-items-center justify-content-between small"
            >
              <div class="text-muted">
                Copyright &copy; Ký túc xá sinh viên 2025
              </div>
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

    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"
    ></script>
    <script src="/js/scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
    <script>
      $(document).ready(function () {
        $("#phongTable").DataTable({
          language: {
            url: "//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json",
          },
          responsive: true,
          pageLength: 10,
          dom: "Bfrtip",
          lengthMenu: [
            [10, 25, 50, -1],
            [10, 25, 50, "Tất cả"],
          ],
        });

        // Toggle sidebar
        $("#sidebarToggle").on("click", function (e) {
          e.preventDefault();
          $("body").toggleClass("sb-sidenav-toggled");
        });
      });
    </script>
  </body>
</html>
