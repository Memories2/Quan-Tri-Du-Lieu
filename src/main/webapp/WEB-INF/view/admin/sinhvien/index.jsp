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
			 <main>
        <div class="container mt-4">
            <h2 class="text-center">Danh Sách Sinh Viên</h2>

            <form action="/admin/sinhvien/tiemkiem" method="get" class="mb-3">
                <div class="row">
                    <div class="col-md-3">
                        <label for="masv">Mã sinh viên:</label>
                        <input type="text" id="masv" name="masv" class="form-control" value="${masv}" placeholder="Nhập mã sinh viên">
                    </div>
                    <div class="col-md-3">
                        <label for="tenSV">Tên sinh viên:</label>
                        <input type="text" id="tenSV" name="tenSV" value="${tenSV}" class="form-control" placeholder="Nhập tên sinh viên">
                    </div>
                    <div class="col-md-3">
                        <label for="maPhong">Mã phòng:</label>
                        <input type="text" id="maPhong" name="maPhong" value="${maPhong}" class="form-control" placeholder="Nhập mã phòng">
                    </div>
                    <div class="col-md-3">
                        <label for="soDienThoai">Số điện thoại:</label>
                        <input type="text" id="soDienThoai" name="soDienThoai" value="${soDienThoai}" class="form-control" placeholder="Nhập số điện thoại">
                    </div>
                    <div class="col-md-12 mt-3">
                        <button type="submit" class="btn btn-primary">Tìm Kiếm</button>
                    </div>
                </div>
            </form>

            <table class="table table-bordered table-hover mt-3">
                <thead class="table-dark">
                    <tr>
                        <th>Mã SV</th>
                        <th>Họ Tên</th>
                        <th>Giới Tính</th>
                        <th>Số Điện Thoại</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="sinhVien" items="${sinhVienList}">
                        <tr>
                            <td>${sinhVien.maSV}</td>
                            <td>${sinhVien.hoTen}</td>
                            <td>${sinhVien.gioiTinh}</td>
                            <td>${sinhVien.soDienThoai}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty sinhVienList}">
                        <tr>
                            <td colspan="4" class="text-center text-danger">Không tồn tại sinh viên có thông tin như trên</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </main>		</main>
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
<!--		               <script>-->
<!--		                   $(document).ready(function() {-->
<!--		                       $('#phongTable').DataTable({-->
<!--		                           language: {-->
<!--		                               url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/vi.json',-->
<!--		                           },-->
<!--		                       });-->
<!--		                   });-->
<!--		               </script>-->
		           </body>
</html>