<%@ page import="com.example.baithithuchanhmodule3.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chỉnh sửa sản phẩm</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
<h2 class="mt-4">Chỉnh sửa sản phẩm</h2>
<% Product product = (Product) request.getAttribute("product"); %>

<form action="<%= request.getContextPath() %>/product/update" method="post" class="mt-3">
  <input type="hidden" name="id" value="<%= product.getProductID() %>">

  <div class="mb-3">
    <label class="form-label">Tên sản phẩm:</label>
    <input type="text" name="name" class="form-control" value="<%= product.getProductName() %>" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Giá:</label>
    <input type="number" name="price" class="form-control" value="<%= product.getProductPrice() %>" min="101" required>
  </div>
  <div class="mb-3">
    <label class="form-label">Giảm giá:</label>
    <select name="discount" class="form-select">
      <option value="5" <%= product.getProductSale() == 5 ? "selected" : "" %>>5%</option>
      <option value="10" <%= product.getProductSale() == 10 ? "selected" : "" %>>10%</option>
      <option value="15" <%= product.getProductSale() == 15 ? "selected" : "" %>>15%</option>
      <option value="20" <%= product.getProductSale() == 20 ? "selected" : "" %>>20%</option>
    </select>
  </div>
  <div class="mb-3">
    <label class="form-label">Tồn kho:</label>
    <input type="number" name="stock" class="form-control" value="<%= product.getProductInventory() %>" min="11" required>
  </div>
  <button type="submit" class="btn btn-primary">Cập nhật sản phẩm</button>
  <a href="<%= request.getContextPath() %>/product/list" class="btn btn-secondary">Quay lại danh sách</a>
</form>
</body>
</html>
