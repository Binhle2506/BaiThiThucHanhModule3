package com.example.baithithuchanhmodule3.controllers;

import com.example.baithithuchanhmodule3.models.Product;
import com.example.baithithuchanhmodule3.services.ProductService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductController", value = {"/product/*"})
public class ProductController extends BaseController {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();

        if (path == null || path.equals("/")) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        switch (path) {
            case "/list":
                List<Product> productList = ProductService.getAllProducts();
                req.setAttribute("productList", productList);
                renderView("/views/productList.jsp", req, resp);
                break;

            case "/add":
                renderView("/views/addProduct.jsp", req, resp);
                break;

            case "/edit":
                int id = Integer.parseInt(req.getParameter("id"));
                Product product = ProductService.getProductById(id);
                req.setAttribute("product", product);
                renderView("/views/editProduct.jsp", req, resp);
                break;

            case "/delete":
                ProductService.deleteProduct(req, resp);
                break;

            case "/search":
                String keyword = req.getParameter("keyword");
                List<Product> searchResults = ProductService.searchProducts(keyword);
                req.setAttribute("productList", searchResults);
                renderView("/views/productList.jsp", req, resp);
                break;

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "Không tìm thấy đường dẫn yêu cầu.");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String path = req.getPathInfo();

        if (path == null || path.equals("/")) {
            resp.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        switch (path) {
            case "/add":
                ProductService.addProduct(req, resp);
                break;

            case "/update":
                ProductService.updateProduct(req, resp);
                break;

            default:
                resp.sendError(HttpServletResponse.SC_NOT_FOUND);
                break;
        }
    }
}

