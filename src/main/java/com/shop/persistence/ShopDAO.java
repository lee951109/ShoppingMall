package com.shop.persistence;

import java.util.List;

import com.shop.domain.CartVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;

public interface ShopDAO {

	//카테고리별 상품 리스트: 1차
	public List<GoodsVO> list(int cateCode, int cateCodeRef)throws Exception;
	
	//카테고리별 상품 리스트:2차
	public List<GoodsVO> list(int cateCode)throws Exception;

	//상품 상세보기	
	public GoodsVO goodsUserDetail(int gdsNum)throws Exception;
	
	//상품리뷰 작성
	public int registReview(ReviewVO review)throws Exception;
	
	//리뷰 리스트
	public List<ReviewVO> listReview(int gdsNum)throws Exception;
	
	//리뷰 수정
	public int updateReview(ReviewVO review)throws Exception;
	
	//리뷰 삭제
	public int deleteReview(int reviewNum)throws Exception;
	
	//아이디 체크
	public String reviewUserId(int reviewNum)throws Exception;
	
	//장바구니 넣기
	public void addCart(CartVO cart)throws Exception;
	
	//장바구니 리스트
	public List<CartVO> cartList(String userId)throws Exception;

	//장바구니 삭제
	public void deleteCart(CartVO cart)throws Exception;
	
	//주문 정보
	public void orderInfo(OrderVO order)throws Exception;
	
	//주문 상세 정보
	public void orderInfoDetail(OrderDetailVO orderDetail)throws Exception;
	
	//주문후 장바구니 비우기
	public void cartAllDelete(String userId)throws Exception;
}
