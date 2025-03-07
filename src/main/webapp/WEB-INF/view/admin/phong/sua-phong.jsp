<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
            <!DOCTYPE html>
            <html lang="vi">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Dự án quản lý ký túc xá" />
                <meta name="author" content="" />
                <title>Chỉnh sửa phòng</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                <h1 class="mt-4">Chỉnh sửa phòng</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Trang chủ</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/phong">Quản lý phòng</a></li>
                                    <li class="breadcrumb-item active">Chỉnh sửa phòng</li>
                                </ol>
                                <div class="mt-5">
                                    <div class="row">
                                        <div class="col-md-6 col-12 mx-auto">
                                            <h3>Chỉnh sửa thông tin phòng ${phong.maPhong}</h3>
                                            <hr />

                                            <!-- Success message -->
                                            <c:if test="${not empty successMessage}">
                                                <div class="alert alert-success alert-dismissible fade show"
                                                    role="alert">
                                                    ${successMessage}
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                        aria-label="Close"></button>
                                                </div>
                                            </c:if>

                                            <!-- Error message -->
                                            <c:if test="${not empty errorMessage}">
                                                <div class="alert alert-danger alert-dismissible fade show"
                                                    role="alert">
                                                    ${errorMessage}
                                                    <button type="button" class="btn-close" data-bs-dismiss="alert"
                                                        aria-label="Close"></button>
                                                </div>
                                            </c:if>

                                            <form:form method="post" action="/admin/phong/suaphong/${phong.maPhong}"
                                                modelAttribute="phong" class="row">

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Mã phòng:</label>
                                                    <form:input type="text" class="form-control" path="maPhong"
                                                        readonly="true" />
                                                    <form:errors path="maPhong" cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Số phòng:</label>
                                                    <form:input type="text" class="form-control" path="soPhong" />
                                                    <form:errors path="soPhong" cssClass="invalid-feedback d-block" />
                                                    <small class="form-text text-muted">Số phòng hiển thị cho người
                                                        dùng</small>
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Loại phòng:</label>
                                                    <form:select class="form-select" path="loaiPhong.maLoaiPhong">
                                                        <form:option value="">-- Chọn loại phòng --</form:option>
                                                        <form:option value="LP001">Phòng đơn</form:option>
                                                        <form:option value="LP002">Phòng 2</form:option>
                                                        <form:option value="LP004">Phòng 4</form:option>
                                                        <form:option value="LP006">Phòng 6</form:option>
                                                        <form:option value="LP008">Phòng 8</form:option>
                                                    </form:select>
                                                    <form:errors path="loaiPhong" cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="mb-3 col-12 col-md-6">
                                                    <label class="form-label">Số lượng tối đa:</label>
                                                    <form:input type="number" class="form-control" min="1"
                                                        path="soLuongToiDa" />
                                                    <form:errors path="soLuongToiDa"
                                                        cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <label class="form-label">Tình Trạng</label>
                                                    <form:select class="form-select" path="tinhTrang">
                                                        <form:option value="TRONG">Trống</form:option>
                                                        <form:option value="DAY">Đầy</form:option>
                                                        <form:option value="SUACHUA">Sửa chữa</form:option>
                                                    </form:select>
                                                    <form:errors path="tinhTrang" cssClass="invalid-feedback d-block" />
                                                </div>

                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                                    <a href="/admin/phong" class="btn btn-secondary">Hủy</a>
                                                </div>

                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <!--Footer-->
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="/js/scripts.js"></script>
            </body>

            </html>