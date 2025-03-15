<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Dự án quản lý ký túc xá" />
    <meta name="author" content="" />
    <title>Quản lý dịch vụ</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap5.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" />
	<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>

</head>

<body class="sb-nav-fixed">

    <!--Header-->
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <!--Sidebar-->
        <jsp:include page="../layout/sidebar.jsp" />

        <div id="layoutSidenav_content">
            <main class="container mt-4">
                <h2 class="mb-4">Danh sách dịch vụ</h2>
				<!-- Nút thêm dịch vụ -->
				              <div class="mt-3">
				                  <a href="/admin/dichvu/taodichvu" class="btn btn-primary">
				                      <i class="fas fa-plus"></i> Thêm dịch vụ
				                  </a>
				              </div>
							  <br>
                <!-- Hiển thị thông báo -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success">${successMessage}</div>
                </c:if>
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger">${errorMessage}</div>
                </c:if>
				<br>
				<button class="btn btn-success mb-3" id="exportExcel"><i class="fa-solid fa-file-excel"></i>  Xuất Excel</button>
                <!-- Bảng dịch vụ -->
                <div class="table-responsive">
                    <table id="dichVuTable" class="table table-striped table-hover">
                        <thead class="table-dark">
                            <tr>
                                <th>ID</th>
                                <th>Tên dịch vụ</th>
                                <th>Giá</th>
                                <th>Hành động</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dv" items="${danhSachDichVu}">
                                <tr>
                                    <td>${dv.maDV}</td>
                                    <td>${dv.tenDichVu}</td>
                                    <td>${dv.donGia}</td>
                                    <td>
                                        <a href="/admin/dichvu/sua/${dv.maDV}" class="btn btn-warning btn-sm">
                                            <i class="fas fa-edit"></i> Chỉnh sửa
                                        </a>
                                        <a href="/admin/dichvu/xoa/${dv.maDV}" class="btn btn-danger btn-sm"
                                            onclick="return confirm('Bạn có chắc muốn xóa?')">
                                            <i class="fas fa-trash"></i> Xóa
                                        </a>
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

    <script>
        $(document).ready(function () {
            $('#dichVuTable').DataTable({
                language: {
                    url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',
                },
                paging: true,
                searching: true,
                ordering: true,
            });
        });
		
		
		document.getElementById("exportExcel").addEventListener("click", function () {
		        var table = document.querySelector("table");
		        var rows = table.querySelectorAll("tr");

		        var data = [];
		        rows.forEach((row, rowIndex) => {
		            var cells = row.querySelectorAll("th, td");
		            var rowData = [];

		            // Chỉ lấy các cột trừ cột cuối cùng
		            cells.forEach((cell, index) => {
		                if (index < cells.length - 1) { // Bỏ cột cuối
		                    rowData.push(cell.innerText);
		                }
		            });

		            data.push(rowData);
		        });

		        // Tạo Workbook và Worksheet
		        var workbook = XLSX.utils.book_new();
		        var worksheet = XLSX.utils.aoa_to_sheet(data);

		        // Thêm worksheet vào workbook
		        XLSX.utils.book_append_sheet(workbook, worksheet, "DanhSach");

		        // Xuất file Excel
		        XLSX.writeFile(workbook, "DanhSach.xlsx");
		    });
    </script>
</body>

</html>
