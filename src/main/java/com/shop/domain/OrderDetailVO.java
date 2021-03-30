package com.shop.domain;

import lombok.Data;

@Data
public class OrderDetailVO {
	
	private int orderDetailsNum; //주문 상세 번호
	private int gdsNum;			 //상품 번호
	private int cartStock;		 //카트 재고
	private String orderId;		 //주문 번호
}
