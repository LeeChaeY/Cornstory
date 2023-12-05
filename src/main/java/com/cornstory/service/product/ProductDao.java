package com.cornstory.service.product;

import com.cornstory.common.Search;
import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Mapper;

import com.cornstory.domain.Product;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductDao {

	public int addProduct(Product product) throws Exception;

	public Product getProduct(int prodNo) throws Exception;

	public int updateProduct(Product product) throws Exception;

	public int deleteProduct(int prodNo) throws Exception;

	public int countProductPopCorn(Search search) throws Exception;

	public List<Product> listProductPopcorn(Map map) throws Exception;

	public int countProductCopyright(Map map) throws Exception;

	public  List<Product> listProductCopyright(Map map) throws Exception;

	public int countProductProdName(String prodName) throws Exception;

//	public int listCompleteWork(String userId) throws Exception;

	public int countLastEpisode(int workNo) throws Exception;

	public List<Product> getCopylight(String userId) throws Exception;
}
