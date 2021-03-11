package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
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

}
