<%@page contentType="text/html" pageEncoding="UTF-8" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %> <%@taglib
uri="http://www.springframework.org/tags/form" prefix="form" %> <%@ taglib
prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Danh sách dịch vụ</title>
    <meta charset="UTF-8" />
  </head>
  <body>
    <h1>Danh sách dịch vụ</h1>

    <sql:setDataSource
      var="dataSource"
      driver="com.mysql.jdbc.Driver"
      url="jdbc:mysql://localhost:3306/quanlykytucxa"
      user="root"
      password="T@McjBZn2702"
    />

    <sql:query var="result" dataSource="${dataSource}">
      SELECT * FROM dich_vu;
    </sql:query>

    <table border="1">
      <tr>
        <th>ID</th>
        <th>Tên dịch vụ</th>
        <th>Mô tả</th>
        <th>Giá</th>
      </tr>
      <c:forEach var="row" items="${result.rows}">
        <tr>
          <td>${row.id}</td>
          <td>${row.ten_dich_vu}</td>
          <td>${row.mo_ta}</td>
          <td>${row.gia}</td>
        </tr>
      </c:forEach>
    </table>
  </body>
</html>
