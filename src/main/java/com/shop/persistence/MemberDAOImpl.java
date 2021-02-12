package com.shop.persistence;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession session;
	
	private static String namespace = "com.shop.mappers.memberMapper";
	
	@Override
	public void Join(MemberVO vo) throws Exception {
		session.insert(namespace + ".Join", vo);

	}

	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return session.selectOne(namespace + ".login", vo);
	}

}
