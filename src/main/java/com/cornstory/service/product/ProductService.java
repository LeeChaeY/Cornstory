package com.cornstory.service.product;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Product;

//@Service
public interface ProductService {

	public int addProduct(Product product) throws Exception;

}
