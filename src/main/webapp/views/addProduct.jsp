<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thêm sản phẩm mới</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
<h2 class="mt-4">Thêm sản phẩm mới</h2>
<% if (request.getParameter("error") != null) { %>
<div class="alert alert-danger">Lỗi: Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.</div>
<% } %>

<form action="<%= request.getContextPath() %>/product/add" method="post" class="mt-3">
  <div class="mb-3">
    <label class="form-label">Tên sản phẩm:</label>
    <input type="text" name="name" class="form-control" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Giá:</label>
    <input type="number" name="price" class="form-control" min="101" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Giảm giá:</label>
    <select name="discount" class="form-select">
      <option value="5">5%</option>
      <option value="10">10%</option>
      <option value="15">15%</option>
      <option value="20">20%</option>
    </select>
  </div>
  <div class="mb-3">
    <label class="form-label">Tồn kho:</label>
    <input type="number" name="stock" class="form-control" min="11" required>
  </div>
  <button type="submit" class="btn btn-success">Thêm sản phẩm</button>
  <a href="<%= request.getContextPath() %>/product/list" class="btn btn-secondary">Quay lại danh sách</a>
</form>
</body>
</html>
