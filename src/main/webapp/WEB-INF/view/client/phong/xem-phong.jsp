<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Xem Tình Trạng Phòng</title>
    <link
      rel="stylesheet"
      type="text/css"
      href="<%= request.getContextPath() %>/resources/css/style.css"
    />
  </head>
  <body>
    <h1>Tình Trạng Phòng</h1>
    <table border="1">
      <thead>
        <tr>
          <th>Số Phòng</th>
          <th>Tình Trạng</th>
        </tr>
      </thead>
      <tbody>
        <% // Sample data, replace with actual data retrieval logic String[][]
        rooms = { {"101", "Trống"}, {"102", "Đã Đặt"}, {"103", "Trống"}, {"104",
        "Đã Đặt"} }; for (String[] room : rooms) { %>
        <tr>
          <td><%= room[0] %></td>
          <td><%= room[1] %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
  </body>
</html>
