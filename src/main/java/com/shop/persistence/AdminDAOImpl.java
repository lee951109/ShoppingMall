package com.shop.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.domain.CategoryVO;
import com.shop.domain.GoodsVO;
import com.shop.domain.OrderVO;
import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;
@Repository
public class AdminDAOImpl implements AdminDAO {

	private static String namespace = "com.shop.mappers.adminMapper";
	@Autowired
	private SqlSession session;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return session.selectList(namespace + ".category");
	}
	
	//상품 등록
	@Override
	public void register(GoodsVO vo) throws Exception {
		session.insert(namespace + ".register", vo);

	}

	//상품 목록 + 페이징
	@Override
	public List<GoodsVO> goodslist(Criteria cri) throws Exception {
		return session.selectList(namespace + ".goodslist", cri);
	}

	//상품 조회
	@Override
	public GoodsVO goodsDetail(int gdsNum) throws Exception {
		return session.selectOne(namespace +".goodsDetail", gdsNum);
	}

	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		session.update(namespace + ".goodsModify", vo);
		
	}

	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		session.delete(namespace + ".goodsDelete", gdsNum);
	}

	//상품 총 개수
	@Override
	public int count(Criteria cri) throws Exception {
		return session.selectOne(namespace + ".count", cri);
		
	}

	//모든 유저 주문 목록
	@Override
	public List<OrderVO> allOrderList() throws Exception {
		return session.selectList(namespace + ".allOrderList");
	}

	//특정 주문 목록
	@Override
	public List<OrderVO> orderDetail(OrderVO order) throws Exception {
		return session.selectList(namespace + ".orderDetail", order);
	}
	
	//배송 상태
	@Override
	public void delivery(OrderVO order) throws Exception {
		session.update(namespace + ".delivery", order);
		
	}

	//주문시 재고 삭제
	@Override
	public void deleteStock(GoodsVO goods) throws Exception {
		session.update(namespace + ".deleteStock", goods);
	}

	//모든 리뷰
	@Override
	public List<ReviewVO> allReview() throws Exception {
		return session.selectList(namespace + ".allReview");
	}

	//리뷰 삭제
	@Override
	public void reviewDelete(int reviewNum) throws Exception {
		session.delete(namespace + ".reviewDelete", reviewNum);
	}

}
