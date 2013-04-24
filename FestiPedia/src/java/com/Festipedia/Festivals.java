/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Festipedia;

/**
 *
 * @author Ruben
 */
public class Festivals {
    
    private int id;
    private String name;
    private String location;
    private String date;
    private int duration;

    /**
     * 
     * @param id
     * @param name
     * @param location
     * @param date
     * @param duration 
     */
    public Festivals(int id, String name, String location, String date, int duration) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.date = date;
        this.duration = duration;
    }
    
    /**
     * 
     */
    public Festivals(){}

    /**
     * 
     * @return 
     */
    public int getId() {
        return id;
    }

    /**
     * 
     * @return 
     */
    public String getName() {
        return name;
    }

    /**
     * 
     * @return 
     */
    public String getLocation() {
        return location;
    }

    /**
     * 
     * @return 
     */
    public String getDate() {
        return date;
    }

    /**
     * 
     * @return 
     */
    public int getDuration() {
        return duration;
    }
    
    /**
     * 
     * @param id 
     */
    public void setId(int id) {
        this.id = id;
    }
        
    /**
     * 
     * @param name 
     */
    public void setName(String name) {
        this.name = name;
    }
    
    /**
     * 
     * @param location 
     */
    public void setLocation(String location) {
        this.location = location;
    }

    /**
     * 
     * @param date 
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * 
     * @param duration 
     */
    public void setDuration(int duration) {
        this.duration = duration;
    }
    
}
