package com.shop.paging;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount; 			//전체 게시글의 갯수
	private int startPage;				//시작 페이지 번호
	private int endPage;				//끝 페이지 번호
	private boolean prev;				//이전 버튼
	private boolean next;				// 다음 버튼!
	private int displayPageNum = 10;	//하단 페이징 번호의 개숫
	
	private Criteria cri;
	
	private void calcData() { //게시글의 전체 갯수가 설정되는 시점에 caleData()메서드를 호출하여 필요한 데이터를	계싼
		//끝 페이지번호 = Math.ceil(현재페이지 / 페이지 번호의 갯수) * 페이징 번호의 갯수
		//Math.ceil()는 주어진 숫자보다 크거나 같은 숫자 중 가장 작은 숫자를 int로 반환함
		endPage = (int)(Math.ceil(cri.getPage() / (double)displayPageNum) * displayPageNum);
		
		//시작 페이지 번호 = (끝 페이지 번호 - 페이징 번호의 갯수) +1
		startPage = (endPage - displayPageNum) + 1;
		
		//끝 페이지 번호 보정 계산식
		//끝 페이지 번호 = Math.ceil(전체 게시글 갯수 / 페이지 당 출력할 게시글의 갯수)
		int tempEndPage = (int)(Math.ceil(totalCount / (double)cri.getPerPageNum()));
		
		//이전의 결과 값과 보정된 결과 값을 비교 후, 보정한 결과 값을 페이지 끝 번호 변수에 저장
		if(endPage > tempEndPage) {
			endPage = tempEndPage;
		}
		prev = startPage == 1 ? false : true;
		//다음 버튼 = 끝 페이지 * 페이지당 출력할 게시글의 갯수 >= 전체 게시글 갯수 ?false:true
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
		//true = 10 * 10 >= 101 ? false: true
	}
	
	public String makeQuery(int page) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
					.queryParam("page", page)
					.queryParam("perPageNum", cri.getPerPageNum())
					.build();
		
		return uriComponents.toUriString();
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		calcData();
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	
	
}
