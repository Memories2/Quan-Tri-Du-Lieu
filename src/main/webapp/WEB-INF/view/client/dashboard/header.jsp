<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<nav class="sb-topnav navbar navbar-expand navbar-dark bg-primary">
  <!-- Navbar Brand-->
  <a class="navbar-brand ps-3" href="/student">Nhóm 9</a>

  <!-- Sidebar Toggle-->
  <button
    class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0"
    id="sidebarToggle"
    href="#!"
  >
    <i class="fas fa-bars"></i>
  </button>

  <!-- Navbar Info-->
  <div
    class="d-none d-md-inline-block ms-auto me-0 me-md-3 my-2 my-md-0 text-light"
  >
    <i class="fas fa-user-circle me-2"></i>
    <span
      >Chào mừng <c:out value="${pageContext.request.userPrincipal.name}"
    /></span>
  </div>

  <!-- Navbar Dropdown-->
  <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
    <li class="nav-item dropdown">
      <a
        class="nav-link dropdown-toggle"
        id="navbarDropdown"
        href="#"
        role="button"
        data-bs-toggle="dropdown"
        aria-expanded="false"
      >
        <i class="fas fa-cog fa-fw"></i>
      </a>
      <ul
        class="dropdown-menu dropdown-menu-end"
        aria-labelledby="navbarDropdown"
      >
        <li>
          <a class="dropdown-item" href="/student/profile"
            ><i class="fas fa-user-edit me-2"></i>Cập nhật thông tin</a
          >
        </li>
        <li><hr class="dropdown-divider" /></li>
        <li>
          <form action="/logout" method="post">
            <input
              type="hidden"
              name="${_csrf.parameterName}"
              value="${_csrf.token}"
            />
            <button class="dropdown-item">
              <i class="fas fa-sign-out-alt me-2"></i>Đăng xuất
            </button>
          </form>
        </li>
      </ul>
    </li>
  </ul>
</nav>
