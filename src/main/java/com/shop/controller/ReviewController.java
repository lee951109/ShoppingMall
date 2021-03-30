package com.shop.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.shop.domain.MemberVO;
import com.shop.domain.ReviewVO;
import com.shop.service.ShopService;

@RestController
@RequestMapping("/reviews/")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ShopService service;
	
	//리뷰 등록
		@PostMapping(value = "/new")
		public ResponseEntity<String> registReview(@RequestBody ReviewVO review, HttpSession session){
			logger.info("리뷰 작성!!");
			
			ResponseEntity<String> entity = null;
			try {
				MemberVO member = (MemberVO)session.getAttribute("member");
				review.setUserId(member.getUserId()); //로그인 세션을 review.setUserId에 넣음
				
				service.registReview(review);
				entity = new ResponseEntity<>("regSuccess", HttpStatus.OK);
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		//리뷰 목록
		@RequestMapping(value = "/all/{gdsNum}", method = RequestMethod.GET)
		public ResponseEntity<List<ReviewVO>> listReview(@PathVariable("gdsNum")int gdsNum) throws Exception{
			logger.info("리뷰 목록쓰");
			ResponseEntity<List<ReviewVO>> entity = null;
				try {
					entity = new ResponseEntity<>(service.listReview(gdsNum), HttpStatus.OK);
				}catch(Exception e) {
					e.printStackTrace();
					entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
				}
				return entity;
		}
		
		//리뷰 수정
		@RequestMapping(value = "/{reviewNum}", method = {RequestMethod.PUT, RequestMethod.PATCH})
		public ResponseEntity<String> updateReview(@PathVariable("reviewNum")int reviewNum, ReviewVO vo,
													HttpSession session,@RequestBody ReviewVO review){ 
													//RequestBody는 HTTP 요청의 body내용을 자바 객체로 맵핑하는 역할
			logger.info("리뷰 수정");
			
			ResponseEntity<String> entity = null;
			try {
				MemberVO member = (MemberVO)session.getAttribute("member");
				//System.out.println("member : " + member);
				String userId = service.idCheck(vo.getReviewNum());
				//System.out.println("userId : " + userId);
				
				if(member.getUserId().equals(userId)) {
					review.setUserId(member.getUserId());
					review.setReviewNum(reviewNum);
					service.updateReview(review);
					entity = new ResponseEntity<String>("modSuccess", HttpStatus.OK);
				}
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
		}
		
		//리뷰 삭제
		@RequestMapping(value = "/{reviewNum}", method = RequestMethod.DELETE)
		public ResponseEntity<String> deleteReview(@PathVariable("reviewNum")int reviewNum,
													HttpSession session, ReviewVO review){
			logger.info("리뷰 삭제");
			ResponseEntity<String> entity = null;
			try {
				
				MemberVO member = (MemberVO)session.getAttribute("member");
				String userId = service.idCheck(review.getReviewNum());
				
				if(member.getUserId().equals(userId)) {
					review.setUserId(member.getUserId());
					service.deleteReview(reviewNum);
					entity = new ResponseEntity<String>("delSuccess", HttpStatus.OK);
				}
			}catch(Exception e) {
				e.printStackTrace();
				entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
			}
			return entity;
			
		}

}
