package com.elitecore.mom;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan(basePackages = { "Controller","Service"} )
public class SterliteTechMomApplication  extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(SterliteTechMomApplication.class, args);
	}

	@Override
    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(SterliteTechMomApplication.class);
    }
}
