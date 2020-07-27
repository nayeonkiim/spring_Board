package com.board.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	
	// 전체 데이터 수
	private int total;
	// 시작 번호
	private int startPage;
	// 끝 번호
	private int endPage;
	private boolean prev;
	private boolean next;
	private Criteria cri;
	
	public PageMaker(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		
		this.endPage = (int)(Math.ceil(cri.getPage() / 10.0)) * 10;
		this.startPage = this.endPage - 9;
		
		int realEnd = (int)(Math.ceil((total * 1.0) / cri.getPerPageNum()));
		
		// 만약 total=80page 라면 endPage=10 이 되므로 realEnd로 8로 바꿔줘야함 
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = startPage == 1 ? false : true;
		this.next = endPage * cri.getPerPageNum() >= total ? false : true;
	}

}
