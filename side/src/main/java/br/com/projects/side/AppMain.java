package br.com.projects.side;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import br.com.projects.side.utils.AppContext;

@SpringBootApplication
public class AppMain {
    public static void main( String[] args ){
       SpringApplication.run(AppContext.class, args);
    }
}
