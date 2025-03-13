<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> <%@ taglib
uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Gia hạn hợp đồng</title>
  </head>
  <body>
    <div>
      <h1>Gia hạn hợp đồng</h1>
      <form action="giahanhopdong" method="post">
        <div>
          <label for="contractId">Mã hợp đồng:</label>
          <input type="text" id="contractId" name="contractId" required />
        </div>
        <div>
          <label for="extensionDate">Ngày gia hạn:</label>
          <input type="date" id="extensionDate" name="extensionDate" required />
        </div>
        <div>
          <label for="newEndDate">Ngày kết thúc mới:</label>
          <input type="date" id="newEndDate" name="newEndDate" required />
        </div>
        <div>
          <button type="submit">Gia hạn</button>
        </div>
      </form>
    </div>
  </body>
</html>
