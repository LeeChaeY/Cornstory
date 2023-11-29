package com.cornstory.service.product;

import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Mapper;

import com.cornstory.domain.Product;

@Mapper
public interface ProductDao {

	public int addProduct(Product product) throws Exception;

}
