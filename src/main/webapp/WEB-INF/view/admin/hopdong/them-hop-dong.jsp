<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Quản lý ký túc xá" />
                <meta name="author" content="" />
                <title>Tạo mới hợp đồng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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
                                <h1 class="mt-4">Đăng ký hợp đồng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item active">Tạo hợp đồng</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-8 col-12 mx-auto">
                                            <h3>Thông tin hợp đồng</h3>
                                            <hr />

                                            <!-- Success message -->
                                            <c:if test="${not empty successMessage}">
                                                <div class="alert alert-success alert-dismissible fade show"
                                                    role="alert">
                                                    ${successMessage}
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                        aria-label="Close"></button>
                                                </div>
                                            </c:if>

                                            <!-- General Error Message -->
                                            <form:errors path="*" cssClass="alert alert-danger" element="div" />

                                            <form:form method="post" action="/admin/hopdong/themHopDong"
                                                modelAttribute="newHopDong" class="row">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã số hợp đồng:</label>
                                                    <form:input type="text" class="form-control" path="maHD" />
                                                    <form:errors path="maHD"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>


                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã số sinh viên:</label>
                                                    <form:input type="text" class="form-control" path="sinhVien.maSV" />
                                                    <form:errors path="sinhVien.maSV"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã phòng:</label>
                                                    <form:input type="text" class="form-control" path="phong.maPhong" />
                                                    <form:errors path="phong.maPhong"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Ngày bắt đầu:</label>
                                                    <form:input type="date" class="form-control" path="ngayBatDau"
                                                        id="ngayBatDau" />
                                                    <form:errors path="ngayBatDau"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Ngày kết thúc:</label>
                                                    <form:input type="date" class="form-control" path="ngayKetThuc"
                                                        id="ngayKetThuc" />
                                                    <form:errors path="ngayKetThuc"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12">
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox"
                                                            id="dongyDieuKhoan" required>
                                                        <label class="form-check-label" for="dongyDieuKhoan">
                                                            Tôi đã đọc và đồng ý với <a href="#" data-bs-toggle="modal"
                                                                data-bs-target="#dieuKhoanModal">điều khoản và điều
                                                                kiện</a>
                                                        </label>
                                                    </div>
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Tạo hợp đồng</button>
                                                    <a href="/admin/hopdong/danhSachHopDong"
                                                        class="btn btn-secondary">Hủy</a>
                                                </div>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>

                        <!-- Modal Điều khoản -->
                        <div class="modal fade" id="dieuKhoanModal" tabindex="-1" aria-labelledby="dieuKhoanModalLabel"
                            aria-hidden="true">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="dieuKhoanModalLabel">Điều khoản và điều kiện</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <h6>1. Quy định chung</h6>
                                        <p>Sinh viên có trách nhiệm giữ gìn vệ sinh, an ninh trật tự, tài sản trong khu
                                            ký túc xá.</p>

                                        <h6>2. Thời hạn hợp đồng</h6>
                                        <p>Hợp đồng có thời hạn 3 tháng kể từ ngày đăng ký. Sinh viên có thể gia hạn hợp
                                            đồng trước khi kết thúc.</p>

                                        <h6>3. Thanh toán</h6>
                                        <p>Sinh viên phải đóng phí ký túc xá đầy đủ theo quy định.</p>

                                        <h6>4. Chấm dứt hợp đồng</h6>
                                        <p>Hợp đồng có thể bị chấm dứt trước thời hạn nếu sinh viên vi phạm nội quy ký
                                            túc xá.</p>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">Đóng</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--Footer-->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>

                <!-- Script for setting default dates -->
                <script>
                    document.addEventListener('DOMContentLoaded', function () {
                        // Set start date to today
                        const today = new Date();
                        let startDate = today.toISOString().substring(0, 10);
                        document.getElementById('ngayBatDau').value = startDate;

                        // Set end date to 3 months from today
                        const endDate = new Date(today);
                        endDate.setMonth(today.getMonth() + 3);
                        document.getElementById('ngayKetThuc').value = endDate.toISOString().substring(0, 10);

                        // Update end date when start date changes
                        document.getElementById('ngayBatDau').addEventListener('change', function () {
                            const newStartDate = new Date(this.value);
                            const newEndDate = new Date(newStartDate);
                            newEndDate.setMonth(newStartDate.getMonth() + 3);
                            document.getElementById('ngayKetThuc').value = newEndDate.toISOString().substring(0, 10);
                        });
                    });
                </script>
            </body>

            </html>