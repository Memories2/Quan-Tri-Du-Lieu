<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Dự án quản lý ký túc xá" />
    <meta name="author" content="" />
    <title>Báo cáo doanh thu</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
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
                    <h1 class="mt-4">Báo cáo doanh thu</h1>

                    <!-- Form Báo cáo -->
                    <form action="/admin/doanhthu/bao-cao-doanh-thu" method="get" class="row g-3">
                        <div class="col-md-3">
                            <label for="thang" class="form-label">Tháng</label>
                            <input type="number" id="thang" name="thang" class="form-control" required min="1" max="12">
                        </div>

                        <div class="col-md-3">
                            <label for="nam" class="form-label">Năm</label>
                            <input type="number" id="nam" name="nam" class="form-control" required min="1900">
                        </div>

                        <div class="col-md-3 d-flex align-items-end">
                            <button type="submit" class="btn btn-primary w-100">Xem báo cáo</button>
                        </div>
                    </form>

                    <!-- Hiển thị doanh thu -->
                    <h2 class="mt-4">
                        Doanh thu:
                        <c:choose>
                            <c:when test="${not empty doanhThu}">
                                <fmt:formatNumber value="${doanhThu}" type="currency" />
                            </c:when>
                            <c:otherwise>
                                <span>Không có doanh thu cho tháng và năm này</span>
                            </c:otherwise>
                        </c:choose>
                    </h2>

                </div>
            </main>

            <!--Footer-->
            <jsp:include page="../layout/footer.jsp" />

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="/js/scripts.js"></script>
</body>

</html>
