package com.shop.service;

import java.util.List;

import com.shop.domain.GoodsVO;

public interface AdminService {

	//상품 등록
	public void register(GoodsVO vo)throws Exception;
	
	//상품 목록
	public List<GoodsVO> goodslist()throws Exception;
	
	//상품 조회
	public GoodsVO goodsDetail(int gdsNum)throws Exception;
}
