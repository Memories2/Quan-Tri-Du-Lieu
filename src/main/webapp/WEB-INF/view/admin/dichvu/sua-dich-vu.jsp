<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="vi">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Dự án laptopshop">
    <title>Chỉnh sửa dịch vụ</title>

    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet">

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

                <!-- Hiển thị thông báo lỗi -->
                <c:if test="${not empty errorMessage}">
                    <div class="alert alert-danger alert-dismissible fade show" role="alert">
                        <i class="fa-solid fa-circle-exclamation"></i> ${errorMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <!-- Hiển thị thông báo thành công -->
                <c:if test="${not empty successMessage}">
                    <div class="alert alert-success alert-dismissible fade show" role="alert">
                        <i class="fa-solid fa-check-circle"></i> ${successMessage}
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                    </div>
                </c:if>

                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <div class="card shadow-lg p-4">
                            <h3 class="text-center text-primary">Chỉnh sửa dịch vụ</h3>

                            <!-- Form chỉnh sửa dịch vụ -->
                            <form:form action="${pageContext.request.contextPath}/admin/dichvu/sua/${dichVu.maDV}" method="post" modelAttribute="dichVu">
                                
                                <!-- Mã dịch vụ (readonly) -->
                                <div class="mb-3">
                                    <label for="maDV" class="form-label">Mã dịch vụ:</label>
                                    <form:input path="maDV" id="maDV" class="form-control" readonly="true"/>
                                </div>

                                <!-- Tên dịch vụ -->
                                <div class="mb-3">
                                    <label for="tenDichVu" class="form-label">Tên dịch vụ:</label>
                                    <form:input path="tenDichVu" id="tenDichVu" class="form-control" required="true"/>
                                    <form:errors path="tenDichVu" cssClass="text-danger"/>
                                </div>

                                <!-- Giá -->
                                <div class="mb-3">
                                    <label for="donGia" class="form-label">Giá:</label>
                                    <form:input path="donGia" id="donGia" type="number" class="form-control" required="true"/>
                                    <form:errors path="donGia" cssClass="text-danger"/>
                                </div>

                                <!-- Nút cập nhật -->
                                <button type="submit" class="btn btn-primary w-100">Cập nhật</button>
                            </form:form>
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
            'use strict';
            var forms = document.querySelectorAll('.needs-validation');
            Array.prototype.slice.call(forms).forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        })();
    </script>

</body>

</html>
