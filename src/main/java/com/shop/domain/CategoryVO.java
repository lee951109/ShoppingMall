package com.shop.domain;

import lombok.Data;

@Data
public class CategoryVO {

	private String cateName; 		//카테고리 이름
	private String cateCode;		//카테고리 코드번호
	private String cateCodeRef;		//카테고리 코드 참조번호
}

/*
 cateName varchar(20)not null,
 cateCode varchar(20)not null,
 cateCodeRef varchar(30) not null;
  
 */
