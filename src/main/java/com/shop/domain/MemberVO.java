package com.shop.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data //lombok을 이용한 어노테이션(Getter, Setter, ToString을 따로 안 설정해도 된다)
public class MemberVO {

	private String userId;		//userID
	private String userName;	//uaerName
	private String userPass;	//userPassWord
	private String email;		//email
	private String phone; 		//핸드폰 번호
	private String address1;	//우편번호
	private String address2;	//주소
	private String address3;	//상세주소
	private int varify;		//이메일 인증(0:미인증, 1:확인)
	private Timestamp regDate;	//시간
}


/*  userId varchar(50) not null,
	userPass varchar(100) not null,
	userName varchar(30) not null,
	email varchar(100) not null,
	phone varchar(30) not null,
	address1 varchar(20) not null,
	address2 varchar(100) not null,
	address3 varchar(100) not null,
	varfiy int not null,
	regDate TimeStamp not null,
	primary key(userid)
   */