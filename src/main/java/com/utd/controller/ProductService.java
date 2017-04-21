package com.utd.controller;

import java.util.ArrayList;
import java.util.List;

public class ProductService {

	 public List<Product> getProducts(){
	        List<Product> products = new ArrayList<Product>();
	        products.add(new Product(1,"HP Laptop",799f));
	        products.add(new Product(2,"IBM Desktop",599f));
	        products.add(new Product(3,"Cannon Printer",159f));
	        return products;
	    }
	 
	    public Product getProduct(int id) {
	        Product product = null;
	        switch(id)
	        {
	            case 1:
	                product = new Product(1,"HP Laptop",799f);
	                break;
	            case 2:
	                product = new Product(2,"IBM Desktop",599f);
	                break;
	            case 3:
	                product = new Product(3,"Cannon Printer",159f);
	                break;
	        }
	        return product;
	    }

}
