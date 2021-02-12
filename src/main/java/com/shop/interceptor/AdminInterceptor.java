package com.shop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.shop.domain.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter  {

	@Override
	public boolean preHandle(HttpServletRequest req,
					HttpServletResponse res, Object obj)throws Exception{
		
		HttpSession session = req.getSession(); //현재 session을 불러와 session에 저장함
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 //"member"라는 명칭의 세션을 불러와 MemberVO의 형태로 변환한 뒤 member에 저장함
		 
		if(member == null) {
			res.sendRedirect("/member/login");
			return false;
		}
		if(member.getVarify() != 1) {
			res.sendRedirect("/");
			return false;
		}
		return true;
	}
}
