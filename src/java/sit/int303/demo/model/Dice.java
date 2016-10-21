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
public class Dice {

    private final static int NO_OF_FACE = 6;
    private int face;

    public int getFace() {
        return face;
    }

    public void setFace(int face) {
        this.face = face;
    }

    public void roll() {
        face = (int) (Math.random() * NO_OF_FACE) + 1;
    }

    public Dice(int face) {
        this.face = face;
    }

    public Dice() {
        roll();
    }

}
