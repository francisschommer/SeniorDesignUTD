package com.utd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HelloWorldController {

	
	@RequestMapping("/hello")
	public ModelAndView welcomeMessage(
			@RequestParam(value = "name", required = false) String name) {
		// Name of your jsp file as parameter
		System.out.println("name="+name);
		if(name != null){
		if(name.toLowerCase().contains("francis") || name.toLowerCase().contains("viktoriya")){
			name = name + " . I hear that you have a Rydo!";
		}}
		ModelAndView view = new ModelAndView("hello");
		view.addObject("nameFromController", name);
		return view;
	}
	
	@RequestMapping("/about")
	public ModelAndView aboutPage(
			@RequestParam(value = "name", required = false) String name) {
		// Name of your jsp file as parameter
		ModelAndView view = new ModelAndView("about");
		view.addObject("nameFromController", name);
		return view;
	}
	
	
	
	
	
}