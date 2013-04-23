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
@ManagedBean(name = "data")
@SessionScoped
public class Data {

    private Bands band=null;
    private HibernateUtil helper;
    private Session session =null;
    
    private String bandName = "", bandGenre = "", bandUrl = "";
    
    public Data(){}
    
    
    
    public String getBandName(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        band = (Bands)session.get(Bands.class, id);
        bandName = band.getName();
        
        return bandName;
    }
    
    public String getBandGenre(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        band = (Bands)session.get(Bands.class, id);
        bandGenre = band.getMusicStyle();
        
        return bandGenre;
    }
    
    public String getBandUrl(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        band = (Bands)session.get(Bands.class, id);
        bandUrl = band.getUrl();
        
        return bandUrl;
    }
    
}
