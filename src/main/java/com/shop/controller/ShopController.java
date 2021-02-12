package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ShopController {
	
	//로그 기록을 남기기 위함.
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	//메인 페이지 이동
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String mainPageGET() {
		logger.info("메인 페이지 진입");
		
		return "main";
	}
}
