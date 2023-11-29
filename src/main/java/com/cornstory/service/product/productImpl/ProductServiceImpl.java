package com.cornstory.service.product.productImpl;

import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao productDao;
	
	
	@Override
	public int addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productDao.addProduct(product);
	}

}
