package com.shop.service;

import java.util.List;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;

public interface AdminService {
	
	//카테고리
	public List<CategoryVO> category()throws Exception;

	//상품 등록
	public void register(GoodsVO vo)throws Exception;
	
	//상품 목록 + 페이징
	public List<GoodsVO> goodslist(Criteria cri)throws Exception;
	
	//상품 조회
	public GoodsVO goodsDetail(int gdsNum)throws Exception;
	
	//상품 수정
	public void goodsModify(GoodsVO vo)throws Exception;
	
	//상품 삭제
	public void goodsDelete(int gdsNum)throws Exception;
	
	//상품 총 개수
	public int count(Criteria cri)throws Exception;
	
	//모든 유저 주문 목록
	public List<OrderVO> allOrderList() throws Exception;
		
	//특정 주문 목록
	public List<OrderVO> orderDetail(OrderVO order) throws Exception;
	
	//배송 상태
	public void delivery(OrderVO order) throws Exception;
	
	//주문시 재고 삭제
	public void deleteStock(GoodsVO goods) throws Exception;
	
	//모든 리뷰
	public List<ReviewVO> allReview() throws Exception;
	
	//리뷰 삭제
	public void reviewDelete(int reviewNum) throws Exception;
}
