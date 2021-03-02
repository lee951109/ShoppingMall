package com.shop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.shop.domain.GoodsVO;
import com.shop.service.ShopService;

@Controller
public class ShopController {
	
	//로그 기록을 남기기 위함.
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	@Autowired
	ShopService service;
	
	//메인 페이지 이동
	@RequestMapping(value = "/", method=RequestMethod.GET)
	public String mainPageGET() {
		logger.info("메인 페이지 진입");
		
		return "main";
	}
	
	//카테고리별 상품 리스트
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void listGET(@RequestParam("c")int cateCode,
						@RequestParam("l")int level, Model model)throws Exception{
		logger.info("get 상품리스트");
		
		List<GoodsVO> list = null;
		list = service.list(cateCode, level);
		
		model.addAttribute("list", list);
	}
	
	//상품 상세조회
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public void detailGET(@RequestParam("n")int gdsNum, Model model)throws Exception{
		logger.info("get 상품 상세 조회");
		
		GoodsVO detail = service.goodsUserDetail(gdsNum);
		model.addAttribute("detail", detail);
		
			
	}
}
