<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
			<!DOCTYPE html>
			<html>

			<head>
				<title>Danh dịch Sinh Viên đã đăng ký</title>
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
								<h2 class="text-center">Danh sách dịch vụ đã đăng ký</h2>
								<a title="Đăng ký dịch vụ" 
								            href="/admin/sinhvien/dangkydichvu/${sinhVienId}"
								            class="btn btn-sm btn-success">
								            <i class="fa-solid fa-plus"></i>
								        </a>
								<table class="table table-bordered table-hover mt-3">
									<thead class="table-dark">
										<tr>
											<th>Mã dịch vụ</th>
											<th>Đơn giá</th>
											<th>Tên dịch vụ</th>
											<th>Năm sử dụng</th>
											<th>Số lượng sử dụng</th>
											<th>Tháng sử dụng</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="dto" items="${dtos}">
											<tr>
												<td>${dto.maDV}</td>
												<td>${dto.donGia}</td>
												<td>${dto.tenDichVu}</td>
												<td>${dto.namSuDung}</td>
												<td>${dto.soLuongSuDung}</td>
												<td>${dto.thangSuDung}</td>
												<td>
													<div class="d-flex gap-2">
														<a title="Tạo hóa đơn" 
															href="/admin/sinhvien/${sinhVienId}/${dto.maSDDV}"
															class="btn btn-sm btn-info">
															<i class="fa-solid fa-money-bill-1-wave" style="color: #ff4000;"></i>
														</a>
													</div>
												</td>
											</tr>
										</c:forEach>

									</tbody>
								</table>
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

				<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>


			</body>

			</html>