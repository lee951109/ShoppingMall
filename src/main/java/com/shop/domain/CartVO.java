package com.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CartVO {

	private int gdsNum;				//상품 번호
	private int cartNum;			//장바구니 번호
	private int cartStock;			//장바구니 재고 (담은 갯수)
	private String userId;			//유저 아이디
	private Timestamp addDate;		//장바구니에 넣은 날짜

	private GoodsVO goodsVO;
}
