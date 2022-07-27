/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.techblog.entities;

/**
 *
 * @author Lenovo
 */
public class Category {

    private String cid, category, discription;

    public Category() {
    }

    public Category(String cid, String category, String discription) {
        this.cid = cid;
        this.category = category;
        this.discription = discription;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    @Override
    public String toString() {
        return "Category{" + "cid=" + cid + ", category=" + category + ", discription=" + discription + '}';
    }

}
