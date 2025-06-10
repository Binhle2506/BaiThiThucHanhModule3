package com.example.baithithuchanhmodule3.models;

public class Product {
    private int productID;
    private String productName;
    private int productPrice;
    private int productSale;
    private int productInventory;

    public Product() {}

    public Product(int productID, String productName, int productPrice, int productSale, int productInventory) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productSale = productSale;
        this.productInventory = productInventory;
    }

    // Getter và Setter
    public int getProductID() { return productID; }
    public void setProductID(int productID) { this.productID = productID; }

    public String getProductName() { return productName; }
    public void setProductName(String productName) { this.productName = productName; }

    public int getProductPrice() { return productPrice; }
    public void setProductPrice(int productPrice) { this.productPrice = productPrice; }

    public int getProductSale() { return productSale; }
    public void setProductSale(int productSale) { this.productSale = productSale; }

    public int getProductInventory() { return productInventory; }
    public void setProductInventory(int productInventory) { this.productInventory = productInventory; }
}
