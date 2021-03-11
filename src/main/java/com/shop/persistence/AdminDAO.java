package com.shop.persistence;

import java.util.List;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.paging.Criteria;

public interface AdminDAO {
	
	//카테고리
	public List<CategoryVO> category()throws Exception;

	//상품등록
	public void register(GoodsVO vo) throws Exception;
	
	//상품 목록 + 페이징
	public List<GoodsVO> goodslist(Criteria cri) throws Exception;
	
	//상품 조회
	public GoodsVO goodsDetail(int gdsNum) throws Exception;
	
	//상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	//상품 총 개수
	public int count(Criteria cri) throws Exception;
}
