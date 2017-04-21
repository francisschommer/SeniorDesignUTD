package com.utd.controller;

import java.math.BigDecimal;

public class Product {

    public Product(int i, String string, float f) {
		// TODO Auto-generated constructor stub
    	id = i;
    	name = string;
    	price = f;
    	
	}
	private int id; 
    private String name;
    private String description;
    private float price;

    // Add/generate getters/setters/c'tors/equals/hashcode boilerplate.
}
