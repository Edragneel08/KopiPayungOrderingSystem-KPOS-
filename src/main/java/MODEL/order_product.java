/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class order_product {

    protected String orderID;
    protected String prodCode;
    protected String prodName;
    protected double prodPrice;
    protected int prodQuantity;
    protected double prodTotal;
    protected double prodTotalSum;
    
    

    public order_product() {
        // Default constructor with no parameters
    }

    public order_product(String orderID, String prodCode, double prodPrice) {
        this.orderID = orderID;
        this.prodCode = prodCode;
        this.prodPrice = prodPrice;
    }

    public order_product(String prodCode, String prodName, double prodPrice, int prodQuantity, double prodTotal, double prodTotalSum) {
        this.prodCode = prodCode;
        this.prodName = prodName;
        this.prodPrice = prodPrice;
        this.prodQuantity = prodQuantity;
        this.prodTotal = prodTotal;
        this.prodTotalSum = prodTotalSum;
    }

    public int getProdQuantity() {
        return prodQuantity;
    }

    public void setProdQuantity(int prodQuantity) {
        this.prodQuantity = prodQuantity;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public String getOrderID() {
        return orderID;
    }

    public void setOrderID(String orderID) {
        this.orderID = orderID;
    }

    public String getProdCode() {
        return prodCode;
    }

    public void setProdCode(String prodCode) {
        this.prodCode = prodCode;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public double getProdTotal() {
        return prodTotal;
    }

    public void setProdTotal(double prodTotal) {
        this.prodTotal = prodTotal;
    }

    public double getProdTotalSum() {
        return prodTotalSum;
    }

    public void setProdTotalSum(double prodTotalSum) {
        this.prodTotalSum = prodTotalSum;
    }
    
}
