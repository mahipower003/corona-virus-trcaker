package com.coronavirus.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class Homecontroller {
	
	
	@RequestMapping("/home")
	public ModelAndView returnhome()
	{
		ModelAndView mv=new ModelAndView();
		mv.setViewName("home");
		return mv;
	}

}
