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
        <title>Trang chủ sinh viên</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
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
        </style>
      </head>

      <body class="sb-nav-fixed">
        <!-- Header -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
          <a class="navbar-brand ps-3" href="/client">KÝ TÚC XÁ SINH VIÊN</a>
          <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
            <i class="fas fa-bars"></i>
          </button>
          <div class="d-none d-md-inline-block ms-auto me-0 me-md-3 my-2 my-md-0">
          </div>
          <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown"
                aria-expanded="false">
                <i class="fas fa-user fa-fw"></i>
              </a>
              <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                <li><a class="dropdown-item" href="#!">Thông tin cá nhân</a></li>
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
                  <a class="nav-link active" href="/client">
                    <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                    Dashboard
                  </a>

                  <div class="sb-sidenav-menu-heading">Quản lý</div>
                  <a class="nav-link" href="/client/hopdong">
                    <div class="sb-nav-link-icon"><i class="fas fa-file-contract"></i></div>
                    Hợp đồng của tôi
                  </a>
                  <a class="nav-link" href="/client/dichvu">
                    <div class="sb-nav-link-icon"><i class="fas fa-concierge-bell"></i></div>
                    Dịch vụ
                  </a>
                  <a class="nav-link" href="/client/hoadon">
                    <div class="sb-nav-link-icon"><i class="fas fa-file-invoice-dollar"></i></div>
                    Hóa đơn
                  </a>

                  <div class="sb-sidenav-menu-heading">Thông tin</div>
                  <a class="nav-link" href="/client/profile">
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
                <h1 class="mt-4">Dashboard Sinh Viên</h1>
                <ol class="breadcrumb mb-4">
                  <li class="breadcrumb-item"><a href="/client">Trang chủ</a></li>
                  <li class="breadcrumb-item active">Dashboard</li>
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

                <!-- Custom Room Stats -->
                <div class="custom-room-stats">
                  <div class="stats-card filled">
                    <h3>Tổng số phòng</h3>
                    <div class="count">${danhSachPhong.size()}</div>
                  </div>
                  <div class="stats-card available">
                    <h3>Phòng trống</h3>
                    <div class="count">${danhSachPhong.stream().filter(phong -> phong.tinhTrang == "TRONG").count()}</div>
                  </div>
                  <div class="stats-card">
                    <h3>Sinh viên đang ở</h3>
                    <div class="count">15</div>
                  </div>
                </div>

                <div class="card mb-4">
                  <div class="card-header d-flex justify-content-between align-items-center">
                    <div>
                      <i class="fas fa-table me-1"></i>
                      Danh sách phòng
                    </div>
                    <div>
                      <button class="btn btn-outline-primary btn-sm">
                        <i class="fas fa-filter"></i> Lọc
                      </button>
                    </div>
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
                          <th>Số lượng SV hiện tại</th>
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
                              <span class="fw-bold text-primary">${soLuongSinhVienHienTai[phong]}</span>/<span>${phong.soLuongToiDa}</span>
                            </td>
                            <td>
                              <a href="/client/phieudangky/${phong.maPhong}" class="btn btn-sm btn-success ms-1">
                                <i class="fas fa-check"></i> Đăng ký
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

            <!-- Footer -->
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
        <script src="/js/scripts.js"></script>
        <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
        <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
        <script>
          $(document).ready(function () {
            $('#phongTable').DataTable({
              language: {
                url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',
              },
              responsive: true,
              pageLength: 10,
              dom: 'Bfrtip',
              lengthMenu: [
                [10, 25, 50, -1],
                [10, 25, 50, 'Tất cả']
              ]
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