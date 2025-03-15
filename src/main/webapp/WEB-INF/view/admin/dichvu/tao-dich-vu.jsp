<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Dự án laptopshop">
    <meta name="author" content="">
    <title>Tạo mới dịch vụ</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles -->
    <link href="/css/styles.css" rel="stylesheet">

    <!-- FontAwesome -->
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>

<body class="sb-nav-fixed">

    <!-- Header -->
    <jsp:include page="../layout/header.jsp" />

    <div id="layoutSidenav">
        <!-- Sidebar -->
        <jsp:include page="../layout/sidebar.jsp" />

        <div id="layoutSidenav_content">
            <main class="container mt-4">
				<c:if test="${not empty err}">
				    <div class="alert alert-danger alert-dismissible fade show" role="alert">
				        <i class="fa-solid fa-circle-exclamation"></i> ${err}
				        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
				    </div>
				</c:if>
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card shadow-lg p-4">
                            <h3 class="text-center text-primary">Tạo Mới Dịch Vụ</h3>
                            <form action="/admin/dichvu/taodichvu" method="post" class="needs-validation" novalidate>
                                <div class="mb-3">
                                    <label for="maDV" class="form-label">Mã dịch vụ:</label>
                                    <input type="text" class="form-control" id="maDV" name="maDV" required>
                                    <div class="invalid-feedback">Vui lòng nhập mã dịch vụ.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="tenDichVu" class="form-label">Tên dịch vụ:</label>
                                    <input type="text" class="form-control" id="tenDichVu" name="tenDichVu" required>
                                    <div class="invalid-feedback">Vui lòng nhập tên dịch vụ.</div>
                                </div>

                                <div class="mb-3">
                                    <label for="donGia" class="form-label">Giá dịch vụ:</label>
                                    <input type="number" class="form-control" id="donGia" name="donGia" required>
                                    <div class="invalid-feedback">Vui lòng nhập giá dịch vụ.</div>
                                </div>

                                <div class="text-center">
                                    <button type="submit" class="btn btn-primary">
                                        <i class="fa-solid fa-save"></i> Lưu
                                    </button>
                                    <a href="/admin/dichvu" class="btn btn-secondary">
                                        <i class="fa-solid fa-arrow-left"></i> Quay lại
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </main>

            <!-- Footer -->
            <jsp:include page="../layout/footer.jsp" />
        </div>
    </div>

    <!-- Bootstrap 5 & Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    
    <!-- Validation Script -->
    <script>
        (function () {
            'use strict'
            var forms = document.querySelectorAll('.needs-validation')
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
        })();
    </script>

</body>

</html>
