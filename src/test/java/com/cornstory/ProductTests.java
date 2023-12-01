package com.cornstory;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import com.cornstory.common.Search;
import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cornstory.domain.Product;

@SpringBootTest
class ProductTests {

	@Autowired
	private ProductService productService;

	@Test
	void contextLoads() {

//		Product productInsertPopcorn = new Product("admin", 0, "팝콘 1100개", "popcorn1.jpg", 99000, 1100);
//		Product productInsertEpisode = new Product(10002, 10002, "test01", 1, "작품2", 1, "episode1.jpg", 2);
//		Product productInsertCopyright = new Product(10002, "test1", 2, "작품2 저작권", 2, "copyright2.jpg", 121);


//		Product productUpdatePopcorn = new Product(10002, 30330, 23, "Popcorn1111.jpg");
//		Product productUpdateCopyright = new Product(10008, 45);
		
//		System.out.println(" dddddddddddd");
		try {
			//////////////////////////////////////////////////////////////////////////////
//			C
			//////////////////////////////////////////////////////////////////////////////
//			productService.addProduct(productInsertPopcorn);
//			productService.addProduct(productInsertEpisode);
//			productService.addProduct(productInsertCopyright);


			//////////////////////////////////////////////////////////////////////////////
//			R
			//////////////////////////////////////////////////////////////////////////////
//			product = productService.getProduct(10004);
//			System.out.println(product);


			//////////////////////////////////////////////////////////////////////////////
//			U
			//////////////////////////////////////////////////////////////////////////////
//			productService.updateProduct(productUpdatePopcorn);
//			productService.updateProduct(productUpdateCopyright);


			//////////////////////////////////////////////////////////////////////////////
//			D
			//////////////////////////////////////////////////////////////////////////////
//			productService.deleteProduct(10011);



			//////////////////////////////////////////////////////////////////////////////
//			L
			//////////////////////////////////////////////////////////////////////////////
//			팝콘
//			Search search = new Search();
//			search.setSearchKeyword("10");
//			search.setSearchCondition("0");
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = productService.listProductPopcorn(search, "");
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());


//			저작권
//			Search search = new Search();
//			search.setSearchKeyword("10");
//			search.setSearchCondition("0");
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = productService.listProduct(search, "");
//			System.out.println(map);
//			System.out.println(((List)map.get("popcornList")).size());
//			System.out.println(((List)map.get("copyrightList")).size());

//			나의 저작권
//			Search search = new Search();
//			search.setSearchKeyword("저작");
//			search.setSearchCondition("0");
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = productService.listProduct(search, "test01");
//			System.out.println(map);
//			System.out.println(((List)map.get("popcornList")).size());
//			System.out.println(((List)map.get("copyrightList")).size());



			//////////////////////////////////////////////////////////////////////////////
//			REST
			//////////////////////////////////////////////////////////////////////////////
//			prodNameCheck 테스트
//			int count = productService.prodNameCheck("팝콘 1100개");
//			System.out.println(count);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
