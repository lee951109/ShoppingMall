package com.shop.sample;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component //<--를 통해서 해당 객체는 스프링에서 관리해야하는 객체로 인식되어진다
@Data //<--를 통해서 해당 객체의 Getter/Setter/ToString이 자동 형성된다.
public class Chef { //의존성 주입 테스트

}
