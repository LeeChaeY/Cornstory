package com.cornstory;

import java.sql.Date;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;

@SpringBootTest
//@ComponentScan(basePackages = {"com.cornstory", "com.cornstory.service.product"})
class ProductTests {

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	
//	@Autowired
//	@Qualifier("productDao")
//	public ProductDao productDao;
	
	
	@Test
	void contextLoads() {
		
//		Product product = new Product("admin", 0, "팝콘 10개", 1200, 10, "popcorn1.jpg", Date.valueOf("2023-11-23"));
		
		Product product = new Product(10001, 10000, "test1", 1, "작품1", 3, 1, "episode1.jpg", Date.valueOf("2023-11-24"));
		
		System.out.println(" dddddddddddd");
		try {
			productService.addProduct(product);
//			productDao.addProduct(product);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	

}
