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
public class stringBuild {

    public static void main(String[] args) {
        StringBuilder bd = new StringBuilder();
        bd.append("sachin");
        System.out.println(bd);
        
        
        float floatVar = 4.5f;
        int intVar = 5;
        String stringVar ="Sachin";
        
        String fs;
        fs = String.format("The value of the float "
                + "variable is %f, while "
                + "the value of the "
                + "integer variable is %d, "
                + " and the string is %s",
                floatVar, intVar, stringVar);
        System.out.println(fs);
    }

}
