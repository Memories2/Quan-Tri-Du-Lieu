<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Features</div>

                        <a class="nav-link" href="/admin">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            Dashboard
                        </a>

                        <a class="nav-link" href="/admin/phong">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-person-shelter"></i></div>
                            Phòng
                        </a>
						<a class="nav-link" href="/admin/sinhvien">
						    <div class="sb-nav-link-icon"><i class="fa-regular fa-user"></i></div>
						    Danh sách sinh viên
						</a>
                        <a class="nav-link" href="/admin/hoadon">
                            <div class="sb-nav-link-icon"><i class="fa-regular fa-money-bill-1"></i></div>
                            Hoá Đơn
                        </a>

                        <a class="nav-link" href="/admin/hopdong">
                            <div class="sb-nav-link-icon"><i class="fa-solid fa-file-signature"></i></div>
                            Hợp Đồng
                        </a>
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>

                </div>
            </nav>
        </div>