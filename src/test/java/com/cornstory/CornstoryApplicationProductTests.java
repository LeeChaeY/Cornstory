package com.cornstory;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductDao;

@SpringBootTest
class CornstoryApplicationProductTests {

	@Autowired
	private ProductDao productDao;
	
	@Test
	void contextLoads() {
		
		Product product = new Product("admin", 0, "팝콘 10개", 1200, 10, "popcorn1.jpg", Date.valueOf("2023-11-23"));
		
		System.out.println(" dddddddddddd");
		try {
			productDao.addProduct(product);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	

}
