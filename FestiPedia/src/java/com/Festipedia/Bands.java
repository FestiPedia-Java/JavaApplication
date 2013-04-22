/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.Festipedia;

/**
 *
 * @author Ruben
 */
public class Bands {
    
    private int id;
    private String name;
    private String musicStyle;
    private String url;

    //constructor
    public Bands(int id, String name, String musicStyle, String url) {
        this.id = id;
        this.name = name;
        this.musicStyle = musicStyle;
        this.url = url;
    }
    
    public Bands(){}

    //getters
    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getMusicStyle() {
        return musicStyle;
    }

    public String getUrl() {
        return url;
    }

    //setters
    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setMusicStyle(String musicStyle) {
        this.musicStyle = musicStyle;
    }

    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
