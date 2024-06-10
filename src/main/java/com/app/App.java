package com.app;

import com.app.config.AppConfig;
import com.app.controller.HomeController;
import com.google.inject.Guice;
import com.google.inject.Injector;
import static spark.debug.DebugScreen.enableDebugScreen;
import spark.Spark;

/**
 * the app entry
 */
public class App 
{
    public static void main( String[] args )
    {
        
        App.run();
    }


    public static void run(){
        enableDebugScreen();
        Injector injector = Guice.createInjector(new AppConfig());
        int port = Integer.parseInt(System.getenv().getOrDefault("PORT", "8080"));
        Spark.port(port);
        Spark.staticFiles.location("/public");
        HomeController  homeController = injector.getInstance(HomeController.class);
        homeController.initRoutes();
        
       
    
    }
}
