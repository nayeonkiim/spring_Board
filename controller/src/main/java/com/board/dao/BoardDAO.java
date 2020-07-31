package com.board.dao;

import java.util.List;

import com.board.vo.BoardVO;
import com.board.vo.Criteria;

public interface BoardDAO {
	
	public void insert(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> list(Criteria cri) throws Exception;

	public int listCount() throws Exception;

	public BoardVO read(int bno) throws Exception;

	public int update(BoardVO boardVO) throws Exception;
	
	public int delete(int bno) throws Exception;
	
	public int getTotalCount(Criteria cri) throws Exception;
}
