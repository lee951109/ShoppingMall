package com.shop.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.domain.ReviewVO;
import com.shop.service.ShopService;

@RestController
@RequestMapping("/replies/")

public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ShopService service;
	
	//리뷰 등록
	@PostMapping(value = "/review", //post 방식
				consumes = "application/json", //JSON 데이터만 처리
				produces = {MediaType.TEXT_PLAIN_VALUE}) // 문자열 변환
									//@RequestBody를 적용하여 매개값을 JSON데이터로 변환하도록 지정함
	public ResponseEntity<String> registReply(@RequestBody ReviewVO review) throws Exception{
		//ResponseEntity -> 서버의 상태코드, 응답 메시지 등을 담을 수 있는 클래스 타입
		logger.info("ReviewVO : " + review);
		int insertCount = service.registReview(review);
		logger.info("Review Insert Count : " + insertCount);
		
			//insert가 성공할 경우 1이 리턴 
		return insertCount == 1 //3항 연산자 사용 (insertCount가 1 이 될경우)
				? new ResponseEntity<>("success", HttpStatus.OK) // 참일때
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); //거짓일때
	}
}
