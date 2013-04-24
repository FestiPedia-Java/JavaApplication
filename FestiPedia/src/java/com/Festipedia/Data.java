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
    private Festivals fest=null;
    
    private HibernateUtil helper;
    private Session session =null;
    
    private String bandName = "", bandGenre = "", bandUrl = "";
    private String festName = "", festLocation = "", festDate = "";
    private int festDuration=0;
    
    public Data(){}

    /**
     * Gegevens ophalen voor de band die aangeklikt werd
     * Band naam
     * @param id
     * @return 
     */
    public String getBandName(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de band op met de id die meegegeven werd 
         */
        band = (Bands)session.get(Bands.class, id);
        bandName = band.getName();
        
        return bandName;
    }
    
    /**
     * Band Genre
     * @param id
     * @return 
     */
    public String getBandGenre(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de band op met de id die meegegeven werd 
         */
        band = (Bands)session.get(Bands.class, id);
        bandGenre = band.getMusicStyle();
        
        return bandGenre;
    }
    
    /**
     * Band website
     * @param id
     * @return 
     */
    public String getBandUrl(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de band op met de id die meegegeven werd 
         */
        band = (Bands)session.get(Bands.class, id);
        bandUrl = band.getUrl();
        
        return bandUrl;
    }
    
    /**
     * Gegevens ophalen voor de festival die aangeklikt werd 
     * Festival naam
     * @param id
     * @return 
     */
    public String getFestName(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de festival op met de id die meegegeven werd 
         */
        fest = (Festivals)session.get(Festivals.class, id);
        festName = fest.getName();
        
        return festName;
    }
    
    /**
     * Festival locatie
     * @param id
     * @return 
     */   
    public String getFestLocation(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de festival op met de id die meegegeven werd 
         */
        fest = (Festivals)session.get(Festivals.class, id);
        festLocation = fest.getLocation();
        
        return festLocation;
    }
    
    /**
     * Festival datum
     * @param id
     * @return 
     */
     public String getFestDate(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de festival op met de id die meegegeven werd 
         */
        fest = (Festivals)session.get(Festivals.class, id);
        festDate = fest.getDate();
        
        return festDate;
    }
    
    /**
     * Festival aantal dagen
     * @param id
     * @return 
     */
    public int getFestDuration(int id){
        session = helper.getSessionFactory().openSession();
        session.beginTransaction();
        /** 
         * De sessie haalt de festival op met de id die meegegeven werd 
         */
        fest = (Festivals)session.get(Festivals.class, id);
        festDuration = fest.getDuration();
        
        
        return festDuration;
    }
    
}
