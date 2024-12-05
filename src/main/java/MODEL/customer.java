/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package MODEL;

/**
 *
 * @author edrag
 */
public class customer {
    private int custId;
    private String custName;
    private String custPhoneNo;
    
    public customer(){
    }

    public customer(String custName, String custPhoneNo) {
        super();
        this.custName = custName; 
        this.custPhoneNo = custPhoneNo;
    }
    
    public customer(int custId, String custName, String custPhoneNo) {
        super();
        this.custId = custId;
        this.custName = custName;
        this.custPhoneNo = custPhoneNo;
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
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

    public void setCustPhoneNo(String custPhoneNo) {
        this.custPhoneNo = custPhoneNo;
    }
}
