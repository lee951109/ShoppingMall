package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.GoodsVO;
import com.shop.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;
	
	//상품등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		dao.register(vo);

	}
	//상품 목록
	@Override
	public List<GoodsVO> goodslist() throws Exception {
		System.out.println("서비스");
		return dao.goodslist();
	}
	//상품 조회
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		return dao.goodsDetail(gdsNum);
	}

}
