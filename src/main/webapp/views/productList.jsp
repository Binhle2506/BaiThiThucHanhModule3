<%@ page import="java.util.List" %>
<%@ page import="com.example.baithithuchanhmodule3.models.Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Danh sách sản phẩm</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container">
<h2 class="mt-4 text-center">Danh sách sản phẩm</h2>

<div class="row mb-3">
    <div class="col-md-6">
        <form action="<%= request.getContextPath() %>/product/search" method="get" class="input-group">
            <input type="text" name="keyword" class="form-control" placeholder="Nhập tên sản phẩm...">
            <button type="submit" class="btn btn-primary">Tìm kiếm</button>
        </form>
    </div>
    <div class="col-md-6 text-end">
        <button onclick="window.location.href='<%= request.getContextPath() %>/product/add'" class="btn btn-success">Thêm sản phẩm mới</button>
    </div>
</div>

<form action="<%= request.getContextPath() %>/product/orders" method="get" class="mb-3">
    <div class="row">
        <div class="col-md-5">
            <label class="form-label">Từ ngày:</label>
            <input type="date" name="fromDate" class="form-control" required>
        </div>
        <div class="col-md-5">
            <label class="form-label">Đến ngày:</label>
            <input type="date" name="toDate" class="form-control" required>
        </div>
        <div class="col-md-2 text-center">
            <button type="submit" class="btn btn-secondary mt-4">Lọc đơn hàng</button>
        </div>
    </div>
</form>

<table class="table table-bordered table-hover">
    <thead class="table-dark">
    <tr>
        <th>ID</th>
        <th>Tên sản phẩm</th>
        <th>Giá</th>
        <th>Giảm giá</th>
        <th>Tồn kho</th>
        <th>Hành động</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Product> productList = (List<Product>) request.getAttribute("productList");
        for (Product product : productList) {
    %>
    <tr>
        <td><%= product.getProductID() %></td>
        <td><%= product.getProductName() %></td>
        <td><%= product.getProductPrice() %></td>
        <td><%= product.getProductSale() %> %</td>
        <td><%= product.getProductInventory() %></td>
        <td>
            <a href="<%= request.getContextPath() %>/product/edit?id=<%= product.getProductID() %>" class="btn btn-warning btn-sm">Chỉnh sửa</a>
            <a href="<%= request.getContextPath() %>/product/delete?id=<%= product.getProductID() %>" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có chắc chắn muốn xóa sản phẩm này không?')">Xóa</a>
        </td>
    </tr>
    <% } %>
    </tbody>
</table>
</body>
</html>
