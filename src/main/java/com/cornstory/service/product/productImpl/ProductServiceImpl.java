package com.cornstory.service.product.productImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;

//@Repository
@Service
public class ProductServiceImpl implements ProductService{

	private final ProductDao productDao;
	
	@Autowired
//	@Qualifier("productDao")
	public ProductServiceImpl(ProductDao productDao) {
		this.productDao = productDao;
	}
	
	
	@Override
	public int addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productDao.addProduct(product);
	}

}
