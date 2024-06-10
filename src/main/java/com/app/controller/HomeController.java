package com.app.controller;


import java.io.File;
import java.io.IOException;

import com.app.config.AppConfig;
import com.app.model.User;
import com.app.service.UserService;
import com.app.util.GoogleUtilApi;
import com.google.inject.Guice;
import com.google.inject.Injector;

import spark.Request;
import spark.Response;
import spark.Spark;

public class HomeController extends Controller{
    @Override
    public  void initRoutes() {
        Spark.get("/",this::index);
        Spark.get("/login",this::login);
        Spark.get("/logOut",this::logOut);

    }

    @Override
    public String index(Request request,Response response){
        if(request.session().attribute("user")!=null){
            return render(request,"home.ftl");
        }
        return render(request,"login.ftl");
    }

            
    private Response auth(Request request,Response response) throws IOException
    {     
        if(request.session().attribute("user")==null){
            Injector injector = Guice.createInjector(new AppConfig());
            UserService userService = injector.getInstance(UserService.class);
            User user = userService.creatUser(request);
            request.session().attribute("user",user);
            SpreadsheetController spreadsheetController= injector.getInstance(SpreadsheetController.class);
            EmailController emailController = injector.getInstance(EmailController.class);
            TableController tableController = injector.getInstance(TableController.class);
            spreadsheetController.initRoutes();
            emailController.initRoutes();
            tableController.initRoutes();
        } 
        response.redirect("/");  
        return response;
    }


    private Response login(Request request ,Response response) throws IOException{
        Injector injector = Guice.createInjector(new AppConfig());
        GoogleUtilApi googleUtilApi = injector.getInstance(GoogleUtilApi.class);
        googleUtilApi.getCredentials(response);
        Spark.get("/auth",this::auth);
        response.redirect("/auth");
        return response;      
    }

    private Response logOut(Request request ,Response response) throws IOException{
        request.session().removeAttribute("user");
        File f = new File("tokens/StoredCredential");
        if(f.exists()){
            f.delete();
        }
        response.redirect("/");
        return response;
    }
    
}
