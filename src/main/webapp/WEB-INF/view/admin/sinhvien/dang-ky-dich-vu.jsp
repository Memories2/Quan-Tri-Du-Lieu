<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<title>Danh ký dịch vụ</title>
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
						<main>
							<div class="container mt-4">
							       <h2 class="text-center">Đăng ký dịch vụ</h2>
							       
							       <!-- Hiển thị thông báo lỗi nếu có -->
							       <c:if test="${not empty err}">
							           <div class="alert alert-danger">${err}</div>
							       </c:if>

							       <form action="/admin/sinhvien/dangkydichvu/save" method="post">
							           <!-- Input mã hợp đồng (readonly) -->
							           <div class="mb-3">
							               <label for="maHopDong" class="form-label">Mã Hợp Đồng:</label>
							               <input type="text" class="form-control" id="maHopDong" name="maHopDong" value="${maHopDong}" readonly>
							           </div>

							           <!-- Combobox chọn dịch vụ -->
							           <div class="mb-3">
							               <label for="maDV" class="form-label">Chọn Dịch Vụ:</label>
							               <select class="form-select" id="maDV" name="maDV" required>
							                   <option value="">-- Chọn dịch vụ --</option>
							                   <c:forEach var="dichVu" items="${dichVus}">
							                       <option value="${dichVu.maDV}">${dichVu.tenDichVu}</option>
							                   </c:forEach>
							               </select>
							           </div>
									   <!-- Input số lượng -->
									   <div class="mb-3">
									       <label for="sl" class="form-label">Số lượng:</label>
									       <input type="number" class="form-control" id="sl" name="sl" min="1" required>
									   </div>

							           <!-- Datetime picker chọn ngày đăng ký -->
							           <div class="mb-3">
							               <label for="ngayDangKy" class="form-label">Ngày Đăng Ký:</label>
										   <input type="date" class="form-control" id="ngayDangKy" name="ngayDangKy" required>
  
									    </div>

							           <!-- Nút submit -->
							           <button type="submit" class="btn btn-primary">Đăng ký</button>
							           <a href="/admin/sinhvien/dichvu/${sinhVienId}" class="btn btn-secondary">Hủy</a>
							       </form>
							   </div>

							   <!-- Import Bootstrap và Datepicker -->
							   <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
							   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
							   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

							   <script>
							       $(document).ready(function () {
							           $('.datepicker').datepicker({
							               format: 'yyyy-mm-dd',
							               autoclose: true,
							               todayHighlight: true
							           });
							       });
								   
								   document.addEventListener("DOMContentLoaded", function () {
								       let today = new Date().toISOString().split("T")[0]; // Lấy ngày hôm nay theo định dạng YYYY-MM-DD
								       document.getElementById("ngayDangKy").setAttribute("min", today);
								   });

							   </script>
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

				<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>


			</body>

			</html>