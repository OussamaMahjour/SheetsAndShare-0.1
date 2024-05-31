package com.app.controller;

import spark.Request;
import spark.Response;
import spark.Spark;

public class TableController extends Controller{
    @Override 
    public void initRoutes(){
        Spark.get("/table",this::index);
    }

    public String index(Request request, Response response){
        return render(request, "table.ftl");
    }
}