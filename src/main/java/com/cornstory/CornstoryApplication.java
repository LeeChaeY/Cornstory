package com.cornstory;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@MapperScan("com.cornstory.mapper")
public class CornstoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(CornstoryApplication.class, args);
	}

}
