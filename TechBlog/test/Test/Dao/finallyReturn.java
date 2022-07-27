/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Test.Dao;

/**
 *
 * @author Lenovo
 */
public class finallyReturn {

    boolean finallyTest() {
        try {

            System.out.println("Fuck");
            return true;
        } catch (Exception ex) {
            System.out.println(ex);
        } finally {
            System.out.println("suppp");

        }
        return false;
    }

    public static void main(String[] args) {
     boolean s =    new finallyReturn().finallyTest();
        System.out.println(s);
    }

}
