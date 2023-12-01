package com.cornstory.service.product.productImpl;

import com.cornstory.common.Search;
import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	@Override
	public int addProduct(Product product) throws Exception {
		if (product.getProdCategory() == 2)
			product.setEpisodeOrder(productDao.countLastEpisode(product.getWorkNo()));
		return productDao.addProduct(product);
	}

	@Override
	public Product getProduct(int prodNo) throws Exception {
		return productDao.getProduct(prodNo);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return productDao.updateProduct(product);
	}

	@Override
	public int deleteProduct(int prodNo) throws Exception {
		return productDao.deleteProduct(prodNo);
	}

	@Override
	public Map<String, Object> listProduct(Search search, String userId) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();

		int totalCountPopcorn = productDao.countProductPopCorn(search);
		System.out.println("ProductServiceImpl :: totalCountPopcorn :: "+totalCountPopcorn);

		map.put("search", search);
		map.put("userId", userId);
		int totalCountCopyright = productDao.countProductCopyright(map);
		System.out.println("ProductServiceImpl :: totalCountCopyright :: "+totalCountCopyright);

		map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
		map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

		List<Product> popcornList = productDao.listProductPopcorn(map);
		List<Product> copyrightList = productDao.listProductCopyright(map);

		map.put("totalCountPopcorn", totalCountPopcorn);
		map.put("totalCountCopyright", totalCountCopyright);
		map.put("popcornList", popcornList);
		map.put("copyrightList", copyrightList);

		return map;
	}

	@Override
	public int prodNameCheck(String prodName) throws Exception {
		return (productDao.countProductProdName(prodName) == 0) ? 0 : 1;
	}

//	@Override
//	public int listCompleteWork(String userId) throws Exception {
//		return (productDao.listCompleteWork(userId) == 0) ? 0 : 1;
//	}

}
