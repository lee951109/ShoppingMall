package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.GoodsVO;
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
}
