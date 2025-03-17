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
                <title>Đăng ký phòng ký túc xá</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
                <style>
                    .navbar-brand {
                        font-weight: 700;
                        color: #fff;
                    }

                    .sidebar {
                        background-color: #343a40;
                    }

                    .nav-link {
                        color: rgba(255, 255, 255, 0.6);
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
                        margin-bottom: 30px;
                    }

                    .card-header {
                        background-color: #f8f9fa;
                        border-bottom: 1px solid #e3e6ec;
                        font-weight: 600;
                    }

                    .form-label {
                        font-weight: 500;
                    }

                    .btn-primary {
                        background-color: #0d6efd;
                        border-color: #0d6efd;
                    }

                    .btn-primary:hover {
                        background-color: #0b5ed7;
                        border-color: #0a58ca;
                    }

                    .room-info {
                        background-color: #f8f9fa;
                        border-radius: 8px;
                        padding: 20px;
                        margin-bottom: 20px;
                    }

                    .room-info h3 {
                        color: #0d6efd;
                        font-size: 1.2rem;
                        margin-bottom: 15px;
                        border-bottom: 1px solid #dee2e6;
                        padding-bottom: 10px;
                    }

                    .room-info-item {
                        display: flex;
                        margin-bottom: 10px;
                    }

                    .room-info-label {
                        font-weight: 600;
                        width: 150px;
                        color: #495057;
                    }

                    .room-info-value {
                        flex: 1;
                    }

                    .badge {
                        padding: 0.5em 0.75em;
                    }

                    .form-section {
                        margin-top: 30px;
                    }

                    .form-section h3 {
                        font-size: 1.2rem;
                        margin-bottom: 20px;
                        color: #495057;
                    }

                    .divider {
                        margin: 30px 0;
                        border-top: 1px solid #dee2e6;
                    }

                    .btn-action {
                        min-width: 120px;
                    }

                    .dieu-khoan {
                        max-height: 200px;
                        overflow-y: auto;
                        padding: 15px;
                        background-color: #f8f9fa;
                        border: 1px solid #dee2e6;
                        border-radius: 4px;
                        margin-bottom: 15px;
                        font-size: 0.9rem;
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
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user fa-fw"></i>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="/client/thong-tin-sinh-vien">Thông tin cá nhân</a></li>
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
                                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                        Dashboard
                                    </a>

                                    <div class="sb-sidenav-menu-heading">Quản lý</div>
                                    <a class="nav-link" href="/client/hopdong">
                                        <div class="sb-nav-link-icon"><i class="fas fa-file-contract"></i></div>
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
                                <h1 class="mt-4">Đăng ký phòng ký túc xá</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/client">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Đăng ký phòng</li>
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

                                <div class="row">
                                    <div class="col-lg-8">
                                        <!-- Thông tin phòng đăng ký -->
                                        <div class="card">
                                            <div class="card-header">
                                                <i class="fas fa-home me-1"></i>
                                                Thông tin phòng đăng ký
                                            </div>
                                            <div class="card-body">
                                                <div class="room-info">
                                                    <h3>Thông tin chi tiết phòng</h3>
                                                    <div class="room-info-item">
                                                        <div class="room-info-label">Mã phòng:</div>
                                                        <div class="room-info-value fw-bold">${phong.maPhong}</div>
                                                    </div>

                                                    <div class="room-info-item">
                                                        <div class="room-info-label">Số lượng hiện tại:</div>
                                                        <div class="room-info-value">
                                                            <span
                                                                class="fw-bold text-primary">${soLuongSinhVienHienTai}</span>/<span>${phong.soLuongToiDa}</span>
                                                            sinh viên
                                                        </div>
                                                    </div>
                                                    <div class="room-info-item">
                                                        <div class="room-info-label">Giá phòng:</div>
                                                        <div class="room-info-value fw-bold text-danger">
                                                            ${phong.loaiPhong.giaThue} VNĐ/tháng
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Form đăng ký -->
                                        <div class="card">
                                            <div class="card-header">
                                                <i class="fas fa-edit me-1"></i>
                                                Phiếu đăng ký
                                            </div>
                                            <div class="card-body">
                                                <form:form action="/client/phieudangky/submit" method="post"
                                                    id="registrationForm" modelAttribute="newPhieuDangKy" class="row">
                                                    <input type="hidden" name="maPhong" value="${phong.maPhong}" />

                                                    <div class="form-section">
                                                        <h3><i class="fas fa-user me-2"></i>Thông tin sinh viên</h3>

                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label">Mã sinh viên:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control-plaintext"
                                                                    readonly value="${sinhVien.maSV}">
                                                            </div>
                                                        </div>

                                                        <div class="mb-3 row">
                                                            <label class="col-sm-3 col-form-label">Mã sinh
                                                                phòng:</label>
                                                            <div class="col-sm-9">
                                                                <input type="text" class="form-control-plaintext"
                                                                    readonly value="${phong.maPhong}">
                                                            </div>
                                                        </div>



                                                    </div>
                                                    <div class="form-section">
                                                        <h3><i class="fas fa-file-contract me-2"></i>Điều khoản và điều
                                                            kiện</h3>

                                                        <div class="dieu-khoan">
                                                            <p><strong>ĐIỀU KHOẢN ĐĂNG KÝ PHÒNG KÝ TÚC XÁ</strong></p>
                                                            <p>1. Sinh viên phải tuân thủ nội quy của ký túc xá.</p>
                                                            <p>2. Giữ gìn vệ sinh phòng ở và khu vực công cộng.</p>
                                                            <p>3. Không tự ý sửa chữa, cải tạo phòng ở.</p>
                                                            <p>4. Không sử dụng các thiết bị điện có công suất lớn.</p>
                                                            <p>5. Đóng phí đúng hạn theo quy định.</p>
                                                            <p>6. Giữ gìn tài sản và thiết bị phòng ở, nếu hư hỏng phải
                                                                bồi thường.</p>
                                                            <p>7. Giữ trật tự, không gây ồn ào sau 22h00.</p>
                                                            <p>8. Không hút thuốc, uống rượu bia trong khu vực ký túc
                                                                xá.</p>
                                                            <p>9. Không tổ chức cờ bạc, đánh đề và các trò chơi trái
                                                                pháp luật.</p>
                                                            <p>10. Chấp hành sự quản lý, điều động của ban quản lý ký
                                                                túc xá.</p>
                                                        </div>

                                                        <div class="mb-3 form-check">
                                                            <input type="checkbox" class="form-check-input"
                                                                id="agreeTerms" required>
                                                            <label class="form-check-label" for="agreeTerms">
                                                                Tôi đã đọc và đồng ý với các điều khoản và điều kiện
                                                                trên
                                                            </label>
                                                        </div>
                                                    </div>

                                                    <div class="d-flex justify-content-end mt-4">
                                                        <a href="/client" class="btn btn-secondary me-2 btn-action">
                                                            <i class="fas fa-arrow-left me-1"></i> Quay lại
                                                        </a>
                                                        <button type="submit" class="btn btn-primary btn-action">
                                                            <i class="fas fa-paper-plane me-1"></i> Gửi đăng ký
                                                        </button>
                                                    </div>
                                                </form:form>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-lg-4">
                                        <!-- Thông tin hướng dẫn -->
                                        <div class="card">
                                            <div class="card-header bg-info text-white">
                                                <i class="fas fa-info-circle me-1"></i>
                                                Hướng dẫn đăng ký
                                            </div>
                                            <div class="card-body">
                                                <div class="alert alert-info">
                                                    <h5><i class="fas fa-lightbulb me-2"></i>Lưu ý!</h5>
                                                    <p>Vui lòng kiểm tra kỹ thông tin trước khi đăng ký phòng.</p>
                                                </div>

                                                <ol class="ps-3 mb-4">
                                                    <li class="mb-2">Kiểm tra thông tin phòng đăng ký</li>
                                                    <li class="mb-2">Chọn ngày bắt đầu và kết thúc hợp lý</li>
                                                    <li class="mb-2">Đọc kỹ điều khoản đăng ký</li>
                                                    <li class="mb-2">Đánh dấu vào ô xác nhận đồng ý</li>
                                                    <li class="mb-2">Nhấn nút "Gửi đăng ký" để hoàn tất</li>
                                                </ol>

                                                <div class="alert alert-warning">
                                                    <h5><i class="fas fa-exclamation-triangle me-2"></i>Quan trọng!</h5>
                                                    <p>Sau khi đăng ký, phiếu đăng ký của bạn sẽ được gửi đến ban quản
                                                        lý ký túc xá để xét duyệt. Kết quả sẽ được thông báo sau 1-3
                                                        ngày làm việc.</p>
                                                </div>
                                            </div>
                                        </div>

                                        <!-- Thông tin liên hệ -->
                                        <div class="card">
                                            <div class="card-header bg-primary text-white">
                                                <i class="fas fa-phone-alt me-1"></i>
                                                Thông tin liên hệ
                                            </div>
                                            <div class="card-body">
                                                <p class="mb-2">
                                                    <i class="fas fa-building me-2"></i> <strong>Văn phòng KTX:</strong>
                                                    Phòng A101
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-phone me-2"></i> <strong>Điện thoại:</strong> (028)
                                                    3838 xxxx
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-envelope me-2"></i> <strong>Email:</strong>
                                                    ktx@example.edu.vn
                                                </p>
                                                <p class="mb-2">
                                                    <i class="fas fa-clock me-2"></i> <strong>Giờ làm việc:</strong><br>
                                                    Thứ 2 - Thứ 6: 7:30 - 17:00<br>
                                                    Thứ 7: 8:00 - 11:30
                                                </p>
                                            </div>
                                        </div>
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
                <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                <script>
                    $(document).ready(function () {
                        // Toggle sidebar
                        $("#sidebarToggle").on("click", function (e) {
                            e.preventDefault();
                            $("body").toggleClass("sb-sidenav-toggled");
                        });
                        // Validate form trước khi submit
                        $("#registrationForm").on("submit", function (e) {
                            if (!$("#agreeTerms").is(":checked")) {
                                e.preventDefault();
                                alert("Bạn phải đồng ý với điều khoản và điều kiện!");
                                return false;
                            }
                        });
                    });
                </script>
            </body>

            </html>