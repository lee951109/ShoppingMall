package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CartVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderDetailVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;
import com.shop.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDAO dao;
	
	//카테고리별 상품 리스트 1차	
	@Override
	public List<GoodsVO> list(int cateCode, int level) throws Exception {
		int cateCodeRef = 0;
		
		if(level == 1) { //1차 분류
			
			 cateCodeRef = cateCode;
			
			return dao.list(cateCode, cateCodeRef);
			
		}else {	//2차 분류
			
			return dao.list(cateCode);
		}
	}
	
	//상품 상세보기
	@Override
	public GoodsVO goodsUserDetail(int gdsNum) throws Exception {
		return dao.goodsUserDetail(gdsNum);
	}

	//상품리뷰 등록
	@Override
	public int registReview(ReviewVO review) throws Exception {
		return dao.registReview(review);
		
	}

	//리뷰 리스트
	@Override
	public List<ReviewVO> listReview(Criteria cri, int gdsNum) throws Exception {
		return dao.listReview(cri, gdsNum);
	}

	//리뷰 수정
	@Override
	public void updateReview(ReviewVO review) throws Exception {
		dao.updateReview(review);
	}

	//리뷰 삭제
	@Override
	public void deleteReview(int reviewNum) throws Exception {
		dao.deleteReview(reviewNum);
	}

	//장바구니 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
		
	}

	//장바구니 리스트
	@Override
	public List<CartVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}
	
	//장바구니 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
		
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
		
	}

	//주문 상세 정보
	@Override
	public void orderInfoDetail(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfoDetail(orderDetail);
		
	}
}
