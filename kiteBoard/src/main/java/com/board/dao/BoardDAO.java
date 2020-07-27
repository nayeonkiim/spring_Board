package com.board.dao;

import java.util.List;

import com.board.vo.BoardVO;
import com.board.vo.Criteria;

public interface BoardDAO {
	
	// 글쓰기
	public void write(BoardVO boardVO) throws Exception;
	
	//게시물 목록 조회
	public List<BoardVO> list(Criteria cri) throws Exception;

	//게시물 총 갯수
	public int listCount() throws Exception;
	
	//게시물 조회
	public BoardVO read(int bno) throws Exception;

	//게시물 수정
	public int update(BoardVO boardVO) throws Exception;
	
	//게시물 삭제
	public int delete(int bno) throws Exception;
}
