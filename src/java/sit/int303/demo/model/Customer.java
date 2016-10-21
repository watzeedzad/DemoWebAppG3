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
import java.util.Objects;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author jiraw
 */
public class Customer {

    int custId;
    String discountCode;
    String zip;
    String name;
    String addrLine1;
    String addrLine2;
    String city;
    String state;
    String phone;
    String fax;
    String email;
    int creditLimit;

    private Customer(ResultSet rs) throws SQLException {
        this.addrLine1 = rs.getString("addressline1");
        this.addrLine2 = rs.getString("addressline2");
        this.city = rs.getString("city");
        this.creditLimit = rs.getInt("credit_limit");
        this.custId = rs.getInt("customer_id");
        this.discountCode = rs.getString("discount_code");
        this.email = rs.getString("email");
        this.fax = rs.getString("fax");
        this.name = rs.getString("name");
        this.phone = rs.getString("phone");
        this.state = rs.getString("state");
        this.zip = rs.getString("zip");
    }

    public Customer() {
        
    }

    public int getCustId() {
        return custId;
    }

    public void setCustId(int custId) {
        this.custId = custId;
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

    public String getAddrLine1() {
        return addrLine1;
    }

    public void setAddrLine1(String addrLine1) {
        this.addrLine1 = addrLine1;
    }

    public String getAddrLine2() {
        return addrLine2;
    }

    public void setAddrLine2(String addrLine2) {
        this.addrLine2 = addrLine2;
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

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 13 * hash + this.custId;
        hash = 13 * hash + Objects.hashCode(this.name);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Customer other = (Customer) obj;
        if (this.custId != other.custId) {
            return false;
        }
        return true;
    }

    private static final String FIND_BY_NAME = "select * from customer where lower(name) like ? ORDER BY customer_id";
    private static final String FIND_BY_ID = "select * from customer where customer_id = ?";

    public static List<Customer> findByName(String param) {
        List<Customer> customers = null;
        Customer c = null;
        Connection conn = ConnectionBuilder.getConnection();
        try {
            PreparedStatement pstm = conn.prepareStatement(FIND_BY_NAME);
            pstm.setString(1, param.toLowerCase() + "%");
            ResultSet rs = pstm.executeQuery();
            while (rs.next()) {
                c = new Customer(rs);
                if (customers == null) {
                    customers = new ArrayList<>();
                }
                customers.add(c);
            }
            conn.close();
            rs.close();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return customers;
    }

    public static Customer findByID(int id) {
        Customer c = null;
        Connection conn = ConnectionBuilder.getConnection();
        try {
            PreparedStatement pstm = conn.prepareStatement(FIND_BY_ID);
            pstm.setInt(1, id);
            ResultSet rs = pstm.executeQuery();
            if (rs.next()) {
                c = new Customer(rs);
            }
            conn.close();
            rs.close();
            pstm.close();
        } catch (SQLException ex) {
            Logger.getLogger(Customer.class.getName()).log(Level.SEVERE, null, ex);
        }
        return c;
    }
}
