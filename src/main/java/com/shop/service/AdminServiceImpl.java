package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;
import com.shop.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
	}
	
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);

	}
	
	//상품 목록 + 페이징
	@Override
	public List<GoodsVO> goodslist(Criteria cri) throws Exception {
		return dao.goodslist(cri);
	}
	
	//상품 조회
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		return dao.goodsDetail(gdsNum);
	}
	
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {	
		dao.goodsModify(vo);
	}
	
	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}
	
	//상품 총 갯수
	@Override
	public int count(Criteria cri) throws Exception {
		return dao.count(cri);
	}
	
	//모든 유저 주문 목록
	@Override
	public List<OrderVO> allOrderList() throws Exception {
		return dao.allOrderList();
	}
	
	//특정 주문 목록
	@Override
	public List<OrderVO> orderDetail(OrderVO order) throws Exception {
		return dao.orderDetail(order);
	}

	//배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		dao.delivery(order);
		
	}

	//주문시 재고 삭제
	@Override
	public void deleteStock(GoodsVO goods) throws Exception {
		dao.deleteStock(goods);
	}

	//모든 리뷰
	@Override
	public List<ReviewVO> allReview() throws Exception {
		return dao.allReview();
	}
	
	//리뷰 삭제
	@Override
	public void reviewDelete(int reviewNum) throws Exception {
		dao.reviewDelete(reviewNum);
	}

}
