<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page trimDirectiveWhitespaces="true" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
                <% pageContext.setAttribute("dateFormatter",
                    java.time.format.DateTimeFormatter.ofPattern("dd/MM/yyyy")); %>

                    <!DOCTYPE html>
                    <html lang="vi">

                    <head>
                        <meta charset="utf-8" />
                        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                        <meta name="description" content="Quản lý ký túc xá" />
                        <meta name="author" content="" />
                        <title>Danh sách hợp đồng</title>
                        <link href="/css/styles.css" rel="stylesheet" />
                        <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css"
                            rel="stylesheet" />
                        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
                            crossorigin="anonymous"></script>
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
                                        <h1 class="mt-4">Danh sách hợp đồng</h1>
                                        <ol class="breadcrumb mb-4">
                                            <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                            <li class="breadcrumb-item active">Danh sách hợp đồng</li>
                                        </ol>

                                        <!-- Thông báo thành công hoặc lỗi -->
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

                                        <div class="card mb-4">
                                            <div class="card-header">
                                                <i class="fas fa-table me-1"></i>
                                                Danh sách hợp đồng
                                                <div class="float-end">
                                                    <a href="/admin/hopdong/themHopDong" class="btn btn-primary btn-sm">
                                                        <i class="fas fa-plus"></i> Thêm hợp đồng
                                                    </a>
                                                </div>
                                            </div>
                                            <div class="card-body">
                                                <table id="datatablesSimple" class="table table-striped table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>Mã hợp đồng</th>
                                                            <th>Mã sinh viên</th>
                                                            <th>Họ tên sinh viên</th>
                                                            <th>Phòng</th>
                                                            <th>Ngày bắt đầu</th>
                                                            <th>Ngày kết thúc</th>
                                                            <th>Trạng thái</th>
                                                            <th>Thao tác</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <c:forEach items="${hopDongs}" var="hopDong">
                                                            <tr>
                                                                <td>${hopDong.maHD}</td>
                                                                <td>${hopDong.sinhVien.maSV}</td>
                                                                <td>${hopDong.sinhVien.hoTen}</td>
                                                                <td>${hopDong.phong.maPhong}</td>
                                                                <td>${hopDong.ngayBatDau.format(dateFormatter)}</td>
                                                                <td>${hopDong.ngayKetThuc.format(dateFormatter)}</td>
                                                                <td>
                                                                    <c:choose>
                                                                        <c:when test="${hopDong.trangThai == 0}">
                                                                            <span class="badge bg-danger">Đã hết
                                                                                hạn</span>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <span class="badge bg-success">Còn hiệu
                                                                                lực</span>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                </td>
                                                                <td>
                                                                    <a href="/admin/hopdong/chitiet/${hopDong.maHD}"
                                                                        class="btn btn-info btn-sm">
                                                                        <i class="fas fa-eye"></i>
                                                                    </a>
                                                                    <a href="/admin/hopdong/sua/${hopDong.maHD}"
                                                                        class="btn btn-primary btn-sm">
                                                                        <i class="fas fa-edit"></i>
                                                                    </a>
                                                                    <a href="/admin/hopdong/xoa/${hopDong.maHD}"
                                                                        class="btn btn-danger btn-sm">
                                                                        <i class="fas fa-trash"></i>
                                                                    </a>
                                                                </td>
                                                            </tr>
                                                        </c:forEach>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="container-fluid px-4">
                                        <h1>Kiểm tra hợp đồng sinh viên</h1>
                                        <form action="/admin/hopdong/kiem-tra-hop-dong" method="get">
                                            <label for="maSV">Mã sinh viên:</label>
                                            <input type="text" id="maSV" name="maSV" required />
                                            <button type="submit">Kiểm tra</button>
                                        </form>
                                    
                                        <c:if test="${not empty result}">
                                            <h2>${result}</h2>
                                        </c:if>
                                        
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
                        <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>
                        <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('#datatablesSimple').DataTable({
                                    language: {
                                        url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/vi.json',
                                    },
                                    pageLength: 10,
                                    responsive: true,
                                    order: [[0, 'desc']],
                                    columnDefs: [
                                        { orderable: false, targets: 7 }
                                    ]
                                });
                            });
                        </script>
                    </body>

                    </html>