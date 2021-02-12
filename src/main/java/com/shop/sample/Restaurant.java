package com.shop.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;

@Component
@Data
public class Restaurant {

	@Setter(onMethod_=@Autowired) //는 setter메서드의 생성시 메서드에 추가할 어노테이션을 지정한다
	private Chef chef; 				// 해당 어노테이션에서는 @Autowired가 추가된다.
}
