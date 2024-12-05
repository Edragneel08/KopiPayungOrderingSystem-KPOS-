/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class payment {

    protected int OrderID;
    protected int custId;
    protected double prodTotal;
    protected String OrderDate;
    protected String paymentType;
    protected String custName;
    protected String custPhoneNo;

    public payment() {
    }

    public payment(int OrderID, int custId, String OrderDate, String paymentType) {
        super();
        this.OrderID = OrderID;
        this.custId = custId;
        this.prodTotal = prodTotal;
        this.OrderDate = OrderDate;
        this.paymentType = paymentType;
    }

    public payment(int OrderID, int custId, String OrderDate, String paymentType, double prodTotal) {
        super();
        this.OrderID = OrderID;
        this.custId = custId;
        this.OrderDate = OrderDate;
        this.paymentType = paymentType;
        this.prodTotal = prodTotal;
    }

    public payment(int OrderID, int custId, String OrderDate, String paymentType, String custName, String custPhoneNo) {
        this.OrderID = OrderID;
        this.custId = custId;
        this.OrderDate = OrderDate;
        this.paymentType = paymentType;
        this.custName = custName;
        this.custPhoneNo = custPhoneNo;
    }

    
    
    public String getCustName() {
        return custName;
    }

    public void setCustName(String custName) {
        this.custName = custName;
    }

    public String getCustPhoneNo() {
        return custPhoneNo;
    }

    public void setCustPhone(String custPhoneNo) {
        this.custPhoneNo = custPhoneNo;
    }
    
    

    public int getOrderID() {
        return OrderID;
    }

    public void setOrderID(int OrderID) {
        this.OrderID = OrderID;
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
    }

    public String getOrderDate() {
        return OrderDate;
    }

    public void setOrderDate(String OrderDate) {
        this.OrderDate = OrderDate;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public double getProdTotal() {
        return prodTotal;
    }

    public void setProdTotal(double prodTotal) {
        this.prodTotal = prodTotal;
    }
}
