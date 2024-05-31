package com.app;

import com.app.config.AppConfig;
import com.app.controller.EmailController;
import com.app.controller.HomeController;
import com.app.controller.SpreadsheetController;
import com.app.controller.TableController;
import com.app.model.User;
import com.app.repository.Repository;
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
        Injector injector = Guice.createInjector(new AppConfig());
        Spark.port(8080);
        Spark.staticFiles.location("/public");
        HomeController  homeController = injector.getInstance(HomeController.class);
        
        
        Spark.before((req,res)->{
            if(req.session().attribute("user")==null 
            && !req.pathInfo().equals("/")
            && !(req.pathInfo().equals("/auth") && req.session().attribute("loggin")!=null)  
            && !req.pathInfo().equals("/login")       
            ){

               res.redirect("/");
            }
            if(req.session().attribute("init")!=null){
            SpreadsheetController spreadsheetController= injector.getInstance(SpreadsheetController.class);
            EmailController emailController = injector.getInstance(EmailController.class);
            TableController tableController = injector.getInstance(TableController.class);
            spreadsheetController.initRoutes();
            emailController.initRoutes();
            tableController.initRoutes();
       
                
            }
            
        });
                
        homeController.initRoutes();
        
        
       


        enableDebugScreen();
        
    }
}
