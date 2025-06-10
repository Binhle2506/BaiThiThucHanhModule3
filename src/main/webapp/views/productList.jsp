<%@ page import="java.util.List" %>
<%@ page import="com.example.baithithuchanhmodule3.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Danh sách sản phẩm</title>
</head>
<body>
<h2>Danh sách sản phẩm</h2>

<form action="<%= request.getContextPath() %>/product/search" method="get">
    <input type="text" name="keyword" placeholder="Nhập tên sản phẩm...">
    <button type="submit">Tìm kiếm</button>
</form>

<table border="1">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Giảm giá</th>
        <th>Tồn kho</th>
        <th>Hành động</th>
    </tr>
    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        for (Product product : productList) {
    %>
    <tr>
        <td><%= product.getProductID() %></td>
        <td><%= product.getProductName() %></td>
        <td><%= product.getProductPrice() %></td>
        <td><%= product.getProductSale() %></td>
        <td><%= product.getProductInventory() %></td>
        <td>
            <a href="<%= request.getContextPath() %>/product/edit?id=<%= product.getProductID() %>">Chỉnh sửa</a>
            <a href="<%= request.getContextPath() %>/product/delete?id=<%= product.getProductID() %>" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')">Xóa</a>
        </td>
    </tr>
    <% } %>
</table>

<button onclick="window.location.href='<%= request.getContextPath() %>/product/add'">Thêm sản phẩm mới</button>
</body>
</html>
