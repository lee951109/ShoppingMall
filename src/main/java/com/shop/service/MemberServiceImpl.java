package com.shop.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.MemberVO;
import com.shop.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	

	@Autowired
	private MemberDAO dao;
	
	//회원가입
	@Override
	public void Join(MemberVO vo) throws Exception{
		dao.Join(vo);
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}
	
	//로그아웃
	@Override
	public void logout(HttpSession session) throws Exception {
		session.invalidate(); //로그아웃시 로그인 할때 만들어진 session을 삭제한다.		
	}
	
}
