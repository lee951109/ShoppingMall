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
import com.shop.service.AdminService;

@Controller
@RequestMapping("/admin/")
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private AdminService service;
	
	//관리자 화면
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public void indexGET()throws Exception{
		logger.info("get 관리자");
	}
	
	//상품 등록 get
	@RequestMapping(value = "/goods/register", method = RequestMethod.GET)
	public void registerGET()throws Exception{
		logger.info("get 상품 등록");
	}
	
	//상품 등록 post
	@RequestMapping(value = "/goods/register", method = RequestMethod.POST)
	public String registerPOST(GoodsVO vo)throws Exception{
		logger.info("post 상품 등록");
		service.register(vo);
		
		return "redirect:/admin/index";
	}
	
	//상품 목록
	@RequestMapping(value = "/goods/list", method = RequestMethod.GET)
	public void goodsListGET(Model model)throws Exception{
		logger.info("get 상품 목록");
		
		List<GoodsVO> list = service.goodslist();
		
		model.addAttribute("list", list);
	}
	
	//상품 디테일
	@RequestMapping(value = "/goods/detail", method = RequestMethod.GET)
	public void goodsDetailGET(@RequestParam("n")int gdsNum, Model model)throws Exception{
		logger.info("get 상품 디테일 페이지");
		
		GoodsVO goods = service.goodsDetail(gdsNum);
		
		model.addAttribute("goods", goods);
	}
}
