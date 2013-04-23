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

    //constructor
    public Festivals(int id, String name, String location, String date, int duration) {
        this.id = id;
        this.name = name;
        this.location = location;
        this.date = date;
        this.duration = duration;
    }
    
    public Festivals(){}

    //getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getLocation() {
        return location;
    }

    public String getDate() {
        return date;
    }

    public int getDuration() {
        return duration;
    }
    
    //setters
    public void setId(int id) {
        this.id = id;
    }
        
    public void setName(String name) {
        this.name = name;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }


    public void setDate(String date) {
        this.date = date;
    }


    public void setDuration(int duration) {
        this.duration = duration;
    }
    
}
