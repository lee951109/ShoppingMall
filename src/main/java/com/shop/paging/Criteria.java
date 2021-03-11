package com.shop.paging;

import lombok.ToString;

@ToString
public class Criteria {

	private int page;			//현재 페이지 번호
	private int perPageNum;		//페이지 당 출력되는 게시글 갯수
	
	public Criteria() { //기본생성자이다, 현재 페이지를 1, 페이지 당 출력할 게시글의 갯수를 10으로 기본 세팅!
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	//현재 페이지의 시작 게시글 번호 = (현재 페이지 번호 -1) * 페이지 당 출력할 게시글의 갯수
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	
}
