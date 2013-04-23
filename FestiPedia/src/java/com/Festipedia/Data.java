/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Festipedia;

import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import org.hibernate.Session;

/**
 *
 * @author Ruben
 */
@ManagedBean
@SessionScoped
public class Data {

    private Bands band;
    private HibernateUtil helper;
    private Session session;
    
    public String getName(){
        return "test";
    }
}
