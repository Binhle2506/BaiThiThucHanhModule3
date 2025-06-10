<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thêm sản phẩm mới</title>
</head>
<body>
<h2>Thêm sản phẩm mới</h2>
<% if (request.getParameter("error") != null) { %>
<p style="color:red;">Lỗi: Dữ liệu không hợp lệ. Vui lòng kiểm tra lại.</p>
<% } %>
<form action="<%= request.getContextPath() %>/product/add" method="post">
  Tên sản phẩm: <input type="text" name="name" required><br>
  Giá: <input type="number" name="price" min="101" required><br>
  Giảm giá:
  <select name="discount">
    <option value="5">5%</option>
    <option value="10">10%</option>
    <option value="15">15%</option>
    <option value="20">20%</option>
  </select><br>
  Tồn kho: <input type="number" name="stock" min="11" required><br>
  <button type="submit">Thêm sản phẩm</button>
</form>
<a href="<%= request.getContextPath() %>/product/list">Quay lại danh sách</a>
</body>
</html>
