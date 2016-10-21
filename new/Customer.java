/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author int303
 */
public class Customer {

    private int customerId;
    private String discountCode;
    private String zip;
    private String name;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String phone;
    private String fax;
    private String email;
    private int creditLimit;

    public Customer() {
    }

    private Customer(ResultSet rs) throws SQLException {
        customerId = rs.getInt("customer_id");
        discountCode = rs.getString("discount_code");
        zip = rs.getString("zip");
        name = rs.getString("name");
        addressLine1 = rs.getString("addressline1");
        addressLine2 = rs.getString("addressline2");
        city = rs.getString("city");
        state = rs.getString("state");
        phone = rs.getString("phone");
        fax = rs.getString("fax");
        email = rs.getString("email");
        creditLimit = rs.getInt("credit_limit");
    }

    public int getCustomerId() {
        return customerId;
    }

    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public String getDiscountCode() {
        return discountCode;
    }

    public void setDiscountCode(String discountCode) {
        this.discountCode = discountCode;
    }

    public String getZip() {
        return zip;
    }

    public void setZip(String zip) {
        this.zip = zip;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddressLine1() {
        return addressLine1;
    }

    public void setAddressLine1(String addressLine1) {
        this.addressLine1 = addressLine1;
    }

    public String getAddressLine2() {
        return addressLine2;
    }

    public void setAddressLine2(String addressLine2) {
        this.addressLine2 = addressLine2;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getFax() {
        return fax;
    }

    public void setFax(String fax) {
        this.fax = fax;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(int creditLimit) {
        this.creditLimit = creditLimit;
    }

    private final static String SQL_FIND_BY_NAME = "select * from customer where name like ?";

    public static List<Customer> findByName(String param) {
        List<Customer> customers = null;
        Customer c = null;
        Connection conn = ConnectionBuilder.getConnection();
        try {
            PreparedStatement pstm = conn.prepareStatement(SQL_FIND_BY_NAME);
            pstm.setString(1, param + "%");
            ResultSet rs = pstm.executeQuery();

            while (rs.next()) {
                c = new Customer(rs);
                if (customers == null) {
                    customers = new ArrayList();
                }
                customers.add(c);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return customers;
    }
}
