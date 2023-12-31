package com.cornstory.service.product;

import com.cornstory.common.Search;
import com.cornstory.domain.Product;
import com.cornstory.domain.Work;

import java.util.List;
import java.util.Map;

public interface ProductService {

	public int addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public Product getProductByEpisodeNo(int episodeNo) throws Exception;

	public int updateProduct(Product product) throws Exception;

	public int updateProductEpisode(Product product) throws Exception;

	public int deleteProduct(int prodNo) throws Exception;

	public Map<String,Object> listProduct(Search search, String userId, int userStatus) throws Exception;

	public int prodNameCheck(int prodCnt) throws Exception;

	public List<Work> listCompleteWork(String userId) throws Exception;

	public List<Product> getCopylight(String userId) throws Exception;
}
