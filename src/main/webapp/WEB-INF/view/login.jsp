<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Đăng nhập</title>
    <link rel="stylesheet" href="/css/styless.css" />
  </head>

  <body class="bg-img">
    <div class="login-container">
      <h2>Đăng nhập hệ thống</h2>

      <% if (request.getParameter("error") !=null) { %>
      <div class="error-message">Mã sinh viên hoặc mật khẩu không đúng</div>
      <% } %> <% if (request.getParameter("logout") !=null) { %>
      <div class="success-message">Bạn đã đăng xuất thành công</div>
      <% } %>

      <form action="/perform-login" method="post">
        <div class="form-group">
          <label for="masv">Mã sinh viên:</label>
          <input type="text" id="masv" name="masv" required />
        </div>

        <div class="form-group">
          <label for="matKhau">Mật khẩu:</label>
          <input type="password" id="matKhau" name="matKhau" required />
        </div>

        <button type="submit" class="login-btn">Đăng nhập</button>
      </form>
    </div>
  </body>
</html>
