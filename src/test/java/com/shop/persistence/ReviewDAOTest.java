package com.shop.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shop.domain.ReviewVO;
import com.shop.paging.Criteria;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class ReviewDAOTest {
	
	private static final Logger logger = LoggerFactory.getLogger(ReviewDAOTest.class);
	
	@Autowired
	private ShopDAO dao;
//	
//	@Test
//	public void testReviewCreate()throws Exception{
//		for(int i = 0; i <= 100; i++) {
//			ReviewVO vo = new ReviewVO();
//			vo.setGdsNum(1);
//			vo.setReviewContent(i+"번째 리뷰임^^");
//			vo.setUserId("lee");
//			dao.registReview(vo);
//		}
//	}
//	
//	@Test
//	public void testReviewList()throws Exception{
//		logger.info(dao.listReview(1).toString());
//	}
//	
//	@Test
//	public void testReviewUpdate()throws Exception{
//		ReviewVO vo = new ReviewVO();
//		vo.setGdsNum(1);
//		vo.setReviewNum(2);
//		vo.setReviewContent(2+"번째 리뷰 수정이다");
//		dao.updateReview(vo);
//	}
//	
//	@Test
//	public void testReviewDelete()throws Exception{
//		dao.deleteReview(3);
//	}
	
//	@Test
//	public void testReviewPageing()throws Exception{
//		
//		Criteria cri = new Criteria();
//		cri.setPerPageNum(20);
//		cri.setPage(1);
//		
//		List<ReviewVO> reviews = dao.listReview(1, cri);
//		
//		for(ReviewVO vo : reviews) {
//			logger.info(vo.getReviewNum() + ":" + vo.getReviewContent());
//		}
//	}
}
