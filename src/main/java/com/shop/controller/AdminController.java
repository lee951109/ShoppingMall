package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	//관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void indexGET()throws Exception{
		logger.info("get 관리자");
	}
	
	//상품 등록
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void registerGET()throws Exception{
		logger.info("get 상품 등록");
	}
}
