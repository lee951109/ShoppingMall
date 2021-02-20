package com.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.GoodsVO;
@Repository
public class AdminDAOImpl implements AdminDAO {

	private static String namespace = "com.shop.mappers.adminMapper";
	@Autowired
	private SqlSession session;
	
	
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		session.insert(namespace + ".register", vo);

	}

	//상품 목록
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		return session.selectList(namespace + ".goodslist");
	}

	//상품 조회
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		return session.selectOne(namespace +".goodsDetail", gdsNum);
	}

}
