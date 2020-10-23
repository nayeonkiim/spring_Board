package com.myboard.spring.vo;

import java.util.Date;

public class BoardVO {
	private int bId;
	private String bUserId;
	private String bUsername;
	private Date bDate;
	private String bTitle;
	private String bContent;
	private int bGroup;
	private int bOrder;
	private int bIndent;
	private int bHit;
	private int bGood;
	private int bHate;
	
	public BoardVO() {
		
	}
	public BoardVO(BoardVO vo) {
		this.bUserId = vo.bUserId;
		this.bUsername = vo.bUsername;
		this.bTitle = vo.bTitle;
		this.bContent = vo.bContent;
	}
	
	public int getbId() {
		return bId;
	}
	public void setbId(int bId) {
		this.bId = bId;
	}
	public String getbUserId() {
		return bUserId;
	}
	public void setbUserId(String bUserId) {
		this.bUserId = bUserId;
	}
	public String getbUsername() {
		return bUsername;
	}
	public void setbUsername(String bUsername) {
		this.bUsername = bUsername;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public String getbContent() {
		return bContent;
	}
	public void setbContent(String bContent) {
		this.bContent = bContent;
	}
	public int getbGroup() {
		return bGroup;
	}
	public void setbGroup(int bGroup) {
		this.bGroup = bGroup;
	}
	public int getbOrder() {
		return bOrder;
	}
	public void setbOrder(int bOrder) {
		this.bOrder = bOrder;
	}
	public int getbIndent() {
		return bIndent;
	}
	public void setbIndent(int bIndent) {
		this.bIndent = bIndent;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	public int getbGood() {
		return bGood;
	}
	public void setbGood(int bGood) {
		this.bGood = bGood;
	}
	public int getbHate() {
		return bHate;
	}
	public void setbHate(int bHate) {
		this.bHate = bHate;
	}
}