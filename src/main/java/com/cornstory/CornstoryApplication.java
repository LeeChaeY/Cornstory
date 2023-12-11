package com.cornstory;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
public class CornstoryApplication {

	public static void main(String[] args) {
		SpringApplication.run(CornstoryApplication.class, args);
	}

	@RequestMapping("/")
	public String index() {

		System.out.println("[ MainController.index() start........]");//<== 디버깅용
		//==> web.xml : <welcome-file>~~~.html or ~~.jsp</welcome-fle> : 물리적인 파일이어야 함.
		return "redirect:/index";
	}

}
