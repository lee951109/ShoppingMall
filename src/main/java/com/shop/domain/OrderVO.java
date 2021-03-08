package com.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderVO {

	private String orderId;			//주문자 아이디
	private String UserId;			//유저 아이디
	private String orderRec;		//주문 수신자 Receiver
	private String userAddr1;		//주소1
	private String userAddr2;		//주소2
	private String userAddr3;		//주소3
	private String orderPhone;		//주문자 핸드폰 본호
	private int amount;				// 총 주문 금액	
	private Timestamp orderDate;	//주문 날짜
	}
