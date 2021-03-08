package com.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewVO {

	private String userId; 			//유저 아이디
	private int gdsNum;				//상품 등록 번호
	private int replyNum;			//리뷰 번호
	private String replyContent;	//리뷰 내용
	private Timestamp replyDate;	//리뷰 작성일
	private Timestamp updateDate;  	//리뷰 수정일
}