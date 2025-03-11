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
    <title>Kiểm tra hợp đồng</title>
</head>

<body>

    <h1>Kiểm tra hợp đồng sinh viên</h1>
    <form action="/admin/hopdong/kiem-tra-hop-dong" method="get">
        <label for="maSV">Mã sinh viên:</label>
        <input type="text" id="maSV" name="maSV" required />
        <button type="submit">Kiểm tra</button>
    </form>

    <c:if test="${not empty result}">
        <h2>${result}</h2>
    </c:if>

</body>

</html>
