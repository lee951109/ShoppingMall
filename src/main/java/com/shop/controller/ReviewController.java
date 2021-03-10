package com.shop.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shop.domain.MemberVO;
import com.shop.domain.ReviewVO;
import com.shop.service.ShopService;

@RestController
@RequestMapping("/replies")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ShopService service;
	
	//리뷰 등록
	@RequestMapping(value = "/detail", method = RequestMethod.POST)
	public ResponseEntity<String> registReview(@RequestBody ReviewVO review, HttpSession session){
		logger.debug("리뷰작성>>{}", review);
		
		MemberVO member = (MemberVO)session.getAttribute("member");
			String userId = member.getUserId();
		
		try {
			service.registReview(review);
			//제대로 등록되었으면 "ReviewRegisterOK" 문자열과 HTTP상태 정상
			return new ResponseEntity<>("ReviewRegisterOK",HttpStatus.OK);
		}catch(Exception e) {
			//제대로 등록 안 되었으면 예외 메시지오 HTTP 상태 400
			return new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
	}
}
