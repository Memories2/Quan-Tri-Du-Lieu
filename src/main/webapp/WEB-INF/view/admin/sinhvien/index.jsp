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
				<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

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
								<h2 class="text-center">Danh Sách Sinh Viên</h2>

								<form action="/admin/sinhvien/tiemkiem" method="get" class="mb-3">
									<div class="row g-3"> <!-- g-3 tạo khoảng cách giữa các cột -->

										<div class="col-md-3">
											<label for="masv" class="form-label">Mã sinh viên:</label>
											<input type="text" id="masv" name="masv" class="form-control"
												value="${masv}" placeholder="Nhập mã sinh viên">
										</div>

										<div class="col-md-3">
											<label for="tenSV" class="form-label">Tên sinh viên:</label>
											<input type="text" id="tenSV" name="tenSV" value="${tenSV}"
												class="form-control" placeholder="Nhập tên sinh viên">
										</div>

										<div class="col-md-3">
											<label for="maPhong" class="form-label">Mã phòng:</label>
											<input type="text" id="maPhong" name="maPhong" value="${maPhong}"
												class="form-control" placeholder="Nhập mã phòng">
										</div>

										<div class="col-md-3">
											<label for="soDienThoai" class="form-label">Số điện thoại:</label>
											<input type="text" id="soDienThoai" name="soDienThoai"
												value="${soDienThoai}" class="form-control"
												placeholder="Nhập số điện thoại">
										</div>

										<div class="col-md-3">
											<label for="ngay" class="form-label">Ngày cư trú:</label>
											<input type="date" id="ngay" name="ngay" value="${ngay}"
												class="form-control">
										</div>

										<div class="col-md-3">
											<label for="trangThaiHopDong" class="form-label">Trạng thái hợp
												đồng:</label>
											<select id="trangThaiHopDong" name="trangThaiHopDong" class="form-select">
												<option value="12" ${trangThaiHopDong==12 ? 'selected' : '' }>Tất cả hợp
													đồng</option>
												<option value="0" ${trangThaiHopDong==0 ? 'selected' : '' }>Hợp đồng hết
													hạn</option>
												<option value="1" ${trangThaiHopDong==1 ? 'selected' : '' }>Hợp đồng còn
													hạn</option>
											</select>
										</div>

										<div class="col-12 text-center mt-3">
											<button type="submit" class="btn btn-primary">
												<i class="bi bi-search"></i> Tìm Kiếm
											</button>
										</div>

									</div>
								</form>
								<button id="exportExcel" class="btn btn-success mb-3">
									<i class="fa-solid fa-file-excel"></i> Xuất Excel
								</button>

								<table class="table table-bordered table-hover mt-3">
									<thead class="table-dark">
										<tr>
											<th>Mã SV</th>
											<th>Họ Tên</th>
											<th>Giới Tính</th>
											<th>Số Điện Thoại</th>
											<th>Thao tác</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="sinhVien" items="${sinhVienList}">
											<tr>
												<td>${sinhVien.maSV}</td>
												<td>${sinhVien.hoTen}</td>
												<td>${sinhVien.gioiTinh}</td>
												<td>${sinhVien.soDienThoai}</td>
												<td>
													<div class="d-flex gap-2">
														<a title="chuyển phòng"
															href="/admin/sinhvien/chuyenphong/${sinhVien.maSV}"
															class="btn btn-sm btn-info">
															<i class="fa-regular fa-paper-plane"
																style="color: #ec2618;"></i>
														</a>

													</div>
												</td>
											</tr>
										</c:forEach>
										<c:if test="${empty sinhVienList}">
											<tr>
												<td colspan="4" class="text-center text-danger">Không tồn tại sinh viên
													có thông tin như trên</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>
						</main>
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
				<script>
					document.getElementById("exportExcel").addEventListener("click", function () {
						var table = document.querySelector("table");
						var rows = table.querySelectorAll("tr");

						// Get header row
						var headerRow = rows[0];
						var headerCells = headerRow.querySelectorAll("th");
						var headers = [];

						headerCells.forEach((cell, index) => {
							// Skip last column
							if (index < headerCells.length - 1) {
								headers.push(cell.innerText);
							}
						});

						// Process data rows (skip header)
						var data = [];
						for (var i = 1; i < rows.length; i++) {
							var rowData = [];
							var cells = rows[i].querySelectorAll("td");

							cells.forEach((cell, index) => {
								// Skip last column
								if (index < cells.length - 1) {
									rowData.push(cell.innerText);
								}
							});

							data.push(rowData);
						}

						// Create workbook and worksheet
						var workbook = XLSX.utils.book_new();

						// Create worksheet with header
						var worksheet = XLSX.utils.aoa_to_sheet([headers].concat(data));

						// Add worksheet to workbook
						XLSX.utils.book_append_sheet(workbook, worksheet, "DanhSachSinhVien");

						// Export file
						XLSX.writeFile(workbook, "DanhSach_SinhVien.xlsx");
					});
				</script>

			</body>

			</html>