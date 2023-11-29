package spring.cornstory.service.product;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import spring.cornstory.domain.Product;

public interface ProductService {

	public int addProduct(Product product) throws Exception;

}
