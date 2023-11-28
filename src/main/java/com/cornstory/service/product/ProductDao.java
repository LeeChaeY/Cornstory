package com.cornstory.service.product;

import org.apache.ibatis.annotations.Mapper;
//import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.cornstory.domain.Product;

@Repository
@Mapper
public interface ProductDao {

	public int addProduct(Product product) throws Exception;

}
