/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.practice.model;

import java.io.Serializable;

/**
 *
 * @author INT303
 */
public class MessageBean implements Serializable {
    private String data ;

    public MessageBean() {
        data ="";
    }

    public MessageBean(String data) {
        this.data = data;
    }

    public String getData() {
        return data;
    }

    public void setData(String data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return data ;
    }
    
}
