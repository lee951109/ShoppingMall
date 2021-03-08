package com.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class GoodsVO{

	private int gdsNum;				//상품 번호
	private String gdsName;			//상품 이름
	private int cateCode;			//상품 분류
	private int gdsPrice;			//상품 가격
	private int gdsStock;			//상품 수량
	private String gdsDes;			//상품 설명
	private String gdsImg;			//상품 이미지
	private String gdsThumbImg;		//상품 섬네일
	private Timestamp gdsDate;		//등록 날짜
	
	private CategoryVO categoryVO;

}
/*
 	gdsNum int not null,
 	gdsName varchar(50) not null,
 	cateCode varchar(30) not null,
 	gdsPrice int not null,
 	gdsStock int not null,
 	gdsDes varchar(500) not null,
 	gdsImg varchar(300) not null,
 	gdsDate Timestamp not null,
 	gdsThumbImg varchar(200)
 	
*/
