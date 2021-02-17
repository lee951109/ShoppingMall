package com.shop.persistence;

import com.shop.domain.MemberVO;

public interface MemberDAO {

	//회원가입
	public void Join(MemberVO vo) throws Exception;
	
	//아이디 중복 체크
	public int idCheck(String userId) throws Exception;
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
}
