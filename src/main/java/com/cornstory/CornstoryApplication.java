package com.cornstory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
//@MapperScan("com.cornstory.dao")
//@ComponentScan(basePackages = "com.cornstory")
public class CornstoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(CornstoryApplication.class, args);
	}

}
