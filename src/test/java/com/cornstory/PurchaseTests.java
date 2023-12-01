package com.cornstory;

import com.cornstory.common.Search;
import com.cornstory.domain.Purchase;
import com.cornstory.service.purchase.PurchaseService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.sql.Date;
import java.util.List;
import java.util.Map;

@SpringBootTest
class PurchaseTests {

	@Autowired
	private PurchaseService purchaseService;

	@Test
	void contextLoads() {
//		Purchase purchaseInsertPopcorn = new Purchase(10004, "admin", "test1", 0,
//				3, 1, 0, 590, 59000);
//		Purchase purchaseInsertEpisode = new Purchase(10007, "test01", "test1", 1,
//				0, 1, 590, 588, 2);
//		Purchase purchaseInsertCopyright = new Purchase(10009, "test01", "test1", 2,
//				0, 2, 588, 467, 121);

		try {
			//////////////////////////////////////////////////////////////////////////////
//			C
			//////////////////////////////////////////////////////////////////////////////
//			purchaseService.addPurchase(purchaseInsertPopcorn);
//			purchaseService.addPurchase(purchaseInsertEpisode);
//			purchaseService.addPurchase(purchaseInsertCopyright);


			//////////////////////////////////////////////////////////////////////////////
//			R
			//////////////////////////////////////////////////////////////////////////////
//			Purchase purchase = purchaseService.getPurchase(10000);
//			System.out.println(purchase);


			//////////////////////////////////////////////////////////////////////////////
//			D
			//////////////////////////////////////////////////////////////////////////////
//			purchaseService.deletePurchase(10000);



			//////////////////////////////////////////////////////////////////////////////
//			L
			//////////////////////////////////////////////////////////////////////////////
//			구매 내역
//			Search search = new Search();
//			search.setSearchKeyword("이야기");
//			search.setSearchCondition("0");
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = purchaseService.listPurchase(search, "test1", 1);
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());

//			팝콘
//			Search search = new Search();
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = purchaseService.listPurchase(search, "test1", 0);
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());

//			판매 내역
//			Map<String, Object> map = purchaseService.countWorkTotalPopcorn("test01");
//			System.out.println(map);

//			총 팝콘 매출
//			Map<String, Object> map = purchaseService.listTotalSale(Date.valueOf("2023-10-01"), Date.valueOf("2023-10-31"));
//			System.out.println(map);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
