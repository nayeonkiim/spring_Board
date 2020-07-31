package com.board.vo;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageMaker {
	
	private int total;
	private int startPage;
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
		
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		
		this.prev = startPage == 1 ? false : true;
		this.next = endPage * cri.getPerPageNum() >= total ? false : true;
	}

}
