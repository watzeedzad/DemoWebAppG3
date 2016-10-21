/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.int303.demo.model;

/**
 *
 * @author jiraw
 */
public class HiLow {

    private Dice d1 = new Dice();
    private Dice d2 = new Dice();
    private Dice d3 = new Dice();

    public HiLow(){
        d1 = new Dice();
        d2 = new Dice();
        d3 = new Dice();
    }
    
    public Dice getD1() {
        return d1;
    }

    public Dice getD2() {
        return d2;
    }

    public Dice getD3() {
        return d3;
    }

    public void roll() {
        d1.roll();
        d2.roll();
        d3.roll();
    }
    
    public int getValue(){
        return d1.getFace()+d2.getFace()+d3.getFace();
    }
    
    public String getHiLow(){
        int value = getValue();
        if (value>11) {
            return "Hi";
        }
        else if (value<11){
            return "Low";
        }
        else{
            return "Hi-Low";
        }
    }
}
