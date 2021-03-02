package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
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
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {	
		dao.goodsModify(vo);
	}
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}


}
