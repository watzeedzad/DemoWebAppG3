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
public class TestDice {

    public static void main(String[] args) {
        Dice dice01 = new Dice();
        for (int i = 0; i < 10; i++) {
            dice01.roll();
            System.out.println("face : "+dice01.getFace());
        }
    }
}
