package com.shop.persistence;

import java.util.List;

import com.shop.domain.GoodsVO;

public interface ShopDAO {

	//카테고리별 상품 리스트: 1차
	public List<GoodsVO> list(int cateCode, int cateCodeRef)throws Exception;
	
	//카테고리별 상품 리스트:2차
	public List<GoodsVO> list(int cateCode)throws Exception;
	
	//상품 상세보기
	public GoodsVO goodsUserDetail(int gdsNum)throws Exception;
}
