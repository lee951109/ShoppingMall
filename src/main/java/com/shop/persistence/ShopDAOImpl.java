package com.shop.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.CartVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;

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
	
	//상품리뷰 등록
	@Override
	public int registReview(ReviewVO review) throws Exception {
		return session.insert(namespace + ".registReview", review);

	}
	
	//리뷰 리스트
	@Override
	public List<ReviewVO> listReview(Criteria cri, int gdsNum) throws Exception {
		return session.selectList(namespace +".listReview",gdsNum);
	}

	//리뷰 수정
	@Override
	public void updateReview(ReviewVO review) throws Exception {
		session.update(namespace + ".updateReview", review);
	}

	//리뷰 삭제
	@Override
	public void deleteReview(int reviewNum) throws Exception {
		session.delete(namespace + ".deleteReview", reviewNum);
	}

	//장바구니 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		session.insert(namespace + ".addCart", cart);
		
	}

	//장바구니 리스트
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		return session.selectList(namespace + ".cartList", userId);
	}
	
	//장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		session.delete(namespace + ".deleteCart", cart);
		
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		session.insert(namespace + ".orderInfo", order);
		
	}

	//주문 상세 정보
	@Override
	public void orderInfoDetail(OrderDetailVO orderDetail) throws Exception {
		session.insert(namespace + ".orderInfoDetail", orderDetail);
		
	}

}
