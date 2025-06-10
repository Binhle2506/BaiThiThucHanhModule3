package com.example.baithithuchanhmodule3.services;

import com.example.baithithuchanhmodule3.models.Product;
import com.example.baithithuchanhmodule3.models.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class ProductService {

    public static List<Product> getAllProducts() {
        return ProductModel.getAllProducts();
    }

    public static boolean addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String name = request.getParameter("name");
            int price = Integer.parseInt(request.getParameter("price"));
            int discount = Integer.parseInt(request.getParameter("discount"));
            int stock = Integer.parseInt(request.getParameter("stock"));

            // Kiểm tra điều kiện
            if (name.isEmpty() || price <= 100 || stock <= 10 || !List.of(5, 10, 15, 20).contains(discount)) {
                response.sendRedirect(request.getContextPath() + "/product/add?error=1");
                return false;
            }

            Product product = new Product(0, name, price, discount, stock);
            ProductModel.addProduct(product);

            response.sendRedirect(request.getContextPath() + "/product/list");
            return true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public static void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductModel.destroy(id);
            response.sendRedirect(request.getContextPath() + "/product/list");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Product getProductById(int id) {
        try {
            return ProductModel.getProductById(id);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void updateProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            int price = Integer.parseInt(req.getParameter("price"));
            int discount = Integer.parseInt(req.getParameter("discount"));
            int stock = Integer.parseInt(req.getParameter("stock"));


            if (name.isEmpty() || price <= 100 || stock <= 10 || !List.of(5, 10, 15, 20).contains(discount)) {
                req.setAttribute("error", "Cập nhật sản phẩm thất bại");
                req.getRequestDispatcher("/views/product/edit.jsp").forward(req, resp);
                return;
            }

            Product product = new Product(id, name, price, discount, stock);
            ProductModel.update(product);

            resp.sendRedirect(req.getContextPath() + "/product/list");

        } catch (Exception e) {
            e.printStackTrace();
            req.setAttribute("error", "Có lỗi xảy ra");
            req.getRequestDispatcher("/views/product/edit.jsp").forward(req, resp);
        }
    }
    public static List<Product> searchProducts(String keyword) {
        return ProductModel.search(keyword);
    }

}
