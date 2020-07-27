package com.board.service;

import java.util.List;

import com.board.vo.BoardVO;
import com.board.vo.Criteria;

public interface BoardService {
	
	// 게시글 작성
	public void write(BoardVO boardVO) throws Exception;
	
	//게시글 조회
	public List<BoardVO> list(Criteria cri) throws Exception;
	
	//게시물 총 갯수
	public int listCount() throws Exception;
	
	//하나 게시글 조회
	public BoardVO read(int bno) throws Exception; 
	
	// 게시글 수정
	public boolean update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public boolean delete(int bno) throws Exception;
}
