package com.board.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
public class Criteria {
	
	private int page;
	private int perPageNum;
	private String type;
	private String keyword;
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	
	public String[] getTypeArr() {
		return type == null? new String[] {}: type.split("");
	}

}