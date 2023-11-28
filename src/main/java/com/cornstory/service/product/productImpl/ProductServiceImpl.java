package com.cornstory.service.product.productImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.cornstory.domain.Product;
import com.cornstory.service.product.ProductDao;
import com.cornstory.service.product.ProductService;

//@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	public void setProductDao(ProductDao productDao) {
		System.out.println(":: "+getClass()+".setProductDao() Call.....");
		this.productDao = productDao;
	}
	
	
	@Override
	public int addProduct(Product product) throws Exception {
		// TODO Auto-generated method stub
		return productDao.addProduct(product);
	}

}
