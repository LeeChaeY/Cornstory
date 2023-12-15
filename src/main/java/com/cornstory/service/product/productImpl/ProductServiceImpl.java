package com.cornstory.service.product.productImpl;

import com.cornstory.common.Search;
import com.cornstory.domain.Work;
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
	public Product getProductByEpisodeNo(int episodeNo) throws Exception {
		return productDao.getProductByEpisodeNo(episodeNo);
	}

	@Override
	public int updateProduct(Product product) throws Exception {
		return productDao.updateProduct(product);
	}

	@Override
	public int updateProductEpisode(Product product) throws Exception {
		return productDao.updateProductEpisode(product);
	}

	@Override
	public int deleteProduct(int prodNo) throws Exception {
		return productDao.deleteProduct(prodNo);
	}

	@Override
	public Map<String, Object> listProduct(Search search, String userId, int userStatus) throws Exception {
		Map<String,Object> map = new HashMap<String,Object>();

		int totalCountPopcorn = productDao.countProductPopCorn(search);
		System.out.println("ProductServiceImpl :: totalCountPopcorn :: "+totalCountPopcorn);

		map.put("startRowNum", (search.getCurrentPage()-1) * search.getPageSize() + 1);
		map.put("endRowNum", search.getCurrentPage() * search.getPageSize());

		List<Product> popcornList = productDao.listProductPopcorn(map);

		map.put("search", search);
		map.put("userId", userId);
		map.put("userStatus", userStatus);

		int totalCountCopyright = productDao.countProductCopyright(map);
		System.out.println("ProductServiceImpl :: totalCountCopyright :: "+totalCountCopyright);

		List<Product> copyrightList = productDao.listProductCopyright(map);

		for (Product product: copyrightList) {
			product.setWorkName(product.getProdName().replace(" 저작권", ""));
		}

		map.put("totalCountPopcorn", totalCountPopcorn);
		map.put("totalCountCopyright", totalCountCopyright);
		map.put("popcornList", popcornList);
		map.put("copyrightList", copyrightList);

		return map;
	}

	@Override
	public int prodNameCheck(int prodCnt) throws Exception {
		return (productDao.countProductProdName(prodCnt) == 0) ? 0 : 1;
	}

	@Override
	public List<Product> getCopylight(String userId) throws Exception {
		return productDao.getCopylight(userId);

	}

	@Override
	public List<Work> listCompleteWork(String userId) throws Exception {
		return productDao.listCompleteWork(userId);
	}

}
