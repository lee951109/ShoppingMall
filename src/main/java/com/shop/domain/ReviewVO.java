package com.shop.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewVO {

	private String userId; 			//유저 아이디
	private int gdsNum;				//상품 등록 번호
	private int reviewNum;			//리뷰 번호
	private String reviewContent;	//리뷰 내용
	private Date reviewDate;		//리뷰 작성일
	
	private MemberVO memberVO;
}
