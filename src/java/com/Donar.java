/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com;

import java.util.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Bhavesh Singh
 */
@Entity
@Table
public class Donar {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    int id ; 

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }
    
    
    
    int uid ;
    String donaremail ;
    String umob;
    String city ;
    String country ;
    Date d ;

    public Date getD() {
        return d;
    }

    public void setD(Date d) {
        this.d = d;
    }
  

    public String getDonaremail() {
        return donaremail;
    }

    public void setDonaremail(String donaremail) {
        this.donaremail = donaremail;
    }

    public String getUmob() {
        return umob;
    }

    public void setUmob(String umob) {
        this.umob = umob;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
    
    
}
