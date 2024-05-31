package com.app.model;

import java.util.Map;

public class Spreadsheet {
    private String id;
    private String name;
    private Map<String,Object> data;

    public String getId(){
        return this.id;
    }
    public Map<String,Object> getData(){
        return this.data;
    }

    public String getName(){
        return this.name;
    }
    
    public Spreadsheet setName(String name ){
        this.name = name;
        return this;
    }
    public Spreadsheet setId(String id){
        this.id = id;
        return this;
    }
    public Spreadsheet setData(Map<String,Object> data){
        this.data = data;
        return this;
    }
    
}
