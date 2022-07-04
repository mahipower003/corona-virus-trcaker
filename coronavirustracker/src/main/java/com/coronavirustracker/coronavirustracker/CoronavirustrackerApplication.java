package com.coronavirustracker.coronavirustracker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication @AutoConfiguration @ComponentScan(basePackages = "com.coronavirus")  
public class CoronavirustrackerApplication {

	public static void main(String[] args) {
		SpringApplication.run(CoronavirustrackerApplication.class, args);
	}

}
