package com.onlyhisson.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainMenuController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@RequestMapping(value = "/main.do", method = RequestMethod.GET)
	public String mainPage() throws Exception {
		logger.info("main page");
		
		return "main";
	}
	
	@RequestMapping(value = "/blank.do", method = RequestMethod.GET)
	public String blankPage() throws Exception {
		logger.info("blank page");
		
		return "menu/blank";
	}
	
	@RequestMapping(value = "/cards.do", method = RequestMethod.GET)
	public String cardsPage() throws Exception {
		logger.info("cards page");
		
		return "menu/cards";
	}
	
	@RequestMapping(value = "/charts.do", method = RequestMethod.GET)
	public String chartsPage() throws Exception {
		logger.info("charts page");
		
		return "menu/charts";
	}
	
	@RequestMapping(value = "/forgot-password.do", method = RequestMethod.GET)
	public String forgotPwPage() throws Exception {
		logger.info("forgot-password page");
		
		return "menu/forgot-password";
	}
	
	@RequestMapping(value = "/navbar.do", method = RequestMethod.GET)
	public String navbarPage() throws Exception {
		logger.info("navbar page");
		
		return "menu/navbar";
	}
	
	@RequestMapping(value = "/tables.do", method = RequestMethod.GET)
	public String tablesPage() throws Exception {
		logger.info("tables page");
		
		return "menu/tables";
	}
}
