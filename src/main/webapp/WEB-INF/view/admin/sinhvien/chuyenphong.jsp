<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html>

            <head>
                <title>Danh sách Sinh Viên</title>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="author" content="" />
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
            </head>

            <body class="sb-nav-fixed">

                <!--Header-->
                <jsp:include page="../layout/header.jsp" />

                <div id="layoutSidenav">

                    <!--Sidebar-->
                    <jsp:include page="../layout/sidebar.jsp" />

                    <div id="layoutSidenav_content">
						<main class="container py-4">
						    <c:if test="${sinhVien != null}">
						        <div class="card shadow-lg">
						            <div class="card-header bg-primary text-white">
						                <h5 class="mb-0"><i class="fas fa-user-graduate me-2"></i>Thông Tin Sinh Viên</h5>
						            </div>
						            <div class="card-body">
						                <table class="table table-bordered table-striped">
						                    <tbody>
						                        <tr>
						                            <th>Mã Sinh Viên</th>
						                            <td>${sinhVien.maSV}</td>
						                        </tr>
						                        <tr>
						                            <th>Họ Tên</th>
						                            <td>${sinhVien.hoTen}</td>
						                        </tr>
						                        <tr>
						                            <th>Giới Tính</th>
						                            <td>${sinhVien.gioiTinh}</td>
						                        </tr>
						                        <tr>
						                            <th>Số Điện Thoại</th>
						                            <td>${sinhVien.soDienThoai}</td>
						                        </tr>
						                       
						                    </tbody>
						                </table>
						            </div>
						        </div>
						    </c:if>

						    <c:if test="${sinhVien == null}">
						        <div class="alert alert-danger text-center mt-3">
						            <i class="fas fa-exclamation-triangle me-2"></i>Không tìm thấy sinh viên!
						        </div>
						    </c:if>

						    <!-- Chức năng chuyển phòng -->
						    <div class="card shadow-sm mt-4">
						        <div class="card-header bg-success text-white">
						            <h5 class="card-title mb-0"><i class="fas fa-exchange-alt me-2"></i>Chuyển Phòng Cho Sinh Viên</h5>
						        </div>
						        <div class="card-body">
						            <div class="alert alert-info">
						                <i class="fas fa-info-circle me-2"></i>Phòng hiện tại: <strong>${phong}</strong>
						            </div>

						            <form action="/admin/sinhvien/chuyenphong/save" method="get" class="mt-4">
						                <input type="hidden" name="idSinhVien" value="${idSinhVien}">

						                <div class="mb-3">
						                    <label for="phong" class="form-label">Chuyển đến phòng:</label>
						                    <select name="phong" id="phong" class="form-select">
						                        <c:forEach var="p" items="${phongtrongs}">
						                            <option value="${p.maPhong}">Phòng ${p.soPhong}</option>
						                        </c:forEach>
						                    </select>
						                </div>

						                <div class="d-grid gap-2 d-md-flex justify-content-md-end">
						                    <a href="/admin/sinhvien" class="btn btn-secondary me-md-2">
						                        <i class="fas fa-times me-1"></i>Hủy
						                    </a>
						                    <button type="submit" class="btn btn-primary">
						                        <i class="fas fa-check me-1"></i>Xác nhận chuyển phòng
						                    </button>
						                </div>
						            </form>
						        </div>
						    </div>
							<div th:if="${successMessage}" class="alert alert-success">
							    <p th:text="${successMessage}"></p>
							</div>
							<div th:if="${errorMessage}" class="alert alert-danger">
							    <p th:text="${errorMessage}"></p>
							</div>

						</main>
                        <!--Footer-->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
                <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
                <script src="https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
                <script src="https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap5.min.js"></script>
                <!-- jQuery -->
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

                <!-- Bootstrap Datepicker -->
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>



            </body>

            </html>