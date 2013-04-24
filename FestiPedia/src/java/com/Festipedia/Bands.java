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

    /**
     * @param id
     * @param name
     * @param musicStyle
     * @param url 
     */
    public Bands(int id, String name, String musicStyle, String url) {
        this.id = id;
        this.name = name;
        this.musicStyle = musicStyle;
        this.url = url;
    }
    
    public Bands(){}

    /**
     * @return id
     */
    public int getId() {
        return id;
    }

    /**
     * 
     * @return name
     */
    public String getName() {
        return name;
    }

    /**
     * 
     * @return musicStyle
     */
    public String getMusicStyle() {
        return musicStyle;
    }

    /**
     * 
     * @return url
     */
    public String getUrl() {
        return url;
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
     * @param musicStyle 
     */
    public void setMusicStyle(String musicStyle) {
        this.musicStyle = musicStyle;
    }

    /**
     * 
     * @param url 
     */
    public void setUrl(String url) {
        this.url = url;
    }
    
    
}
