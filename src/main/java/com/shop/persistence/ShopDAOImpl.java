package com.shop.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.GoodsVO;

@Repository
public class ShopDAOImpl implements ShopDAO {

	private static String namespace = "com.shop.mapper.shopMapper";
	
	@Autowired
	private SqlSession session;
	
	//카테고리별 상품 리스트 1차
	@Override
	public List<GoodsVO> list(int cateCode, int cateCodeRef)throws Exception {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("cateCode", cateCode);
		map.put("cateCodeRef", cateCodeRef); 
		//map에 cateCode, cateCodeRef를 넣어줌
		
		return session.selectList(namespace + ".list_1", map);
	
	}
	 
	//2차 분류
	@Override
	public List<GoodsVO> list(int cateCode) throws Exception {
		return session.selectList(namespace + ".list_2", cateCode);
	}
	
	//상품 상세보기
	@Override
	public GoodsVO goodsUserDetail(int gdsNum) throws Exception {
		return session.selectOne(namespace + ".goodsUserDetail", gdsNum);
	}

}
