package com.app.controller;


import spark.Request;
import spark.Response;
import spark.Spark;

public class EmailController extends Controller{
    @Override 
    public void initRoutes(){
        Spark.get("/email",this::index);
    }

    public String index(Request request,Response response){
        return render(request,"email.ftl");
    }
}