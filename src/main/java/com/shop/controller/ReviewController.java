package com.shop.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;
import com.shop.service.ShopService;

@RestController
@RequestMapping("/detail")
public class ReviewController {

	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);
	
	@Autowired
	ShopService service;
	
	//리뷰 목록
	@GetMapping(value = "/page/{gdsNum}/{page}",
					produces = {MediaType.APPLICATION_XML_VALUE,
								MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ReviewVO>> listReview(@PathVariable("page")int page,
													 @PathVariable("gn")int gdsNum)throws Exception{
		logger.info("REST GET 리뷰 목록!");
		Criteria cri = new Criteria();
		logger.info("cri: " + cri);
		
		return new ResponseEntity<>(service.listReview(cri, gdsNum), HttpStatus.OK);
	}
	
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody ReviewVO review)throws Exception {
		logger.info("ReplyVO :"+review);
		int insertCount = service.registReview(review);
		logger.info("Reply INSERT COUNT"+insertCount);
		return insertCount==1?new ResponseEntity<>("success",HttpStatus.OK)
				:new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR); // 삼항연산자처리
	}
	
}
