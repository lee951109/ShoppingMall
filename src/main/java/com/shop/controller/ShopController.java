package com.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.domain.CartVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.MemberVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
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
	
	//장바구니 담기
	@ResponseBody
	@RequestMapping(value = "/detail/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session)throws Exception{
		logger.info("post 장바구니 담기");
		
		 int result = 0;
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 
		 if(member != null) {
		  cart.setUserId(member.getUserId());
		  service.addCart(cart);
		  result = 1;
		 }
//		 logger.info("member : " + member);
//		 logger.info("result : " + result);
		 return result;
		}
	
	//장바구니 리스트
	@RequestMapping(value = "/cartList", method = RequestMethod.GET)
	public void cartListGET(HttpSession session, Model model)throws Exception{
		logger.info("get 장바구니 리스트");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		List<CartVO> cartList = service.cartList(userId);
		
		model.addAttribute("cartList", cartList);
		
	}
	
	//장바구니 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCartPOST(HttpSession session,
						@RequestParam(value = "chbox[]")List<String> chArr, CartVO cart )throws Exception{
							//ajax의 [chbox : ]배열에 전달
		logger.info("post 장바구니 삭제");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		int result = 0;
		int cartNum = 0;
		
		if(member != null) {
			cart.setUserId(userId);
			
			for(String i : chArr) { //ajax에서 바든 chArr의 갯수만큼 반복
				cartNum = Integer.parseInt(i); // i번째 데이터를 cartNum에 저장!
				cart.setCartNum(cartNum); //cartNum을 cart.setCartNum을 이용해 주입
				service.deleteCart(cart);
			}
			result = 1;
		}
		return result;
	}
	
	//주문
	@RequestMapping(value = "cartList", method = RequestMethod.POST)
	public String orderPOST(HttpSession session, OrderVO order, OrderDetailVO orderDetail)throws Exception{
		logger.info("post 주문!");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		Calendar cal = Calendar.getInstance(); //현재 시간 가져오기
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
							//DecimailFormat 숫자형 값을 형식화 된 문자열로 변환
		String ymd = ym + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";
		
		for(int i = 0; i <= 6; i++) {
			subNum += (int)(Math.random() * 10);
		}
		
		String orderId = ymd + "-" +subNum; //주문 번호는 년/월/일-랜덤번호로 구성
		
		order.setOrderId(orderId);
		order.setUserId(userId);
		
		service.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		service.orderInfoDetail(orderDetail);
	
		service.cartAllDelete(userId);
		
		return "redirect:/orderList";
	}
	
}
