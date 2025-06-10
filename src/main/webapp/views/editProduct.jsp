<%@ page import="com.example.baithithuchanhmodule3.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Chỉnh sửa sản phẩm</title>
</head>
<body>
<h2>Chỉnh sửa sản phẩm</h2>
<% Product product = (Product) request.getAttribute("product"); %>

<form action="<%= request.getContextPath() %>/product/update" method="post">
  <input type="hidden" name="id" value="<%= product.getProductID() %>">
  Tên sản phẩm: <input type="text" name="name" value="<%= product.getProductName() %>" required><br>
  Giá: <input type="number" name="price" value="<%= product.getProductPrice() %>" min="101" required><br>
  Giảm giá:
  <select name="discount">
    <option value="5" <%= product.getProductSale() == 5 ? "selected" : "" %>>5%</option>
    <option value="10" <%= product.getProductSale() == 10 ? "selected" : "" %>>10%</option>
    <option value="15" <%= product.getProductSale() == 15 ? "selected" : "" %>>15%</option>
    <option value="20" <%= product.getProductSale() == 20 ? "selected" : "" %>>20%</option>
  </select><br>
  Tồn kho: <input type="number" name="stock" value="<%= product.getProductInventory() %>" min="11" required><br>
  <button type="submit">Cập nhật sản phẩm</button>
</form>
<a href="<%= request.getContextPath() %>/product/list">Quay lại danh sách</a>
</body>
</html>
