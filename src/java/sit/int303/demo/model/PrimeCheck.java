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
public class PrimeCheck {

    int userNum;

    public int getUserNum() {
        return userNum;
    }

    public void setUserNum(int userNum) {
        this.userNum = userNum;
    }

    public int checkPrime(int userNum) {
        for (int i = 2; i < userNum / 2 + 1; i++) {
            if (userNum % i == 0) {
                return i;
            }
        }
        return (userNum < 2 ? -1 : 1);
    }
}
