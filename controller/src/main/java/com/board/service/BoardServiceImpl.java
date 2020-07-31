package com.board.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		
		dao.insert(boardVO);
	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
	
		return dao.list(cri);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(bno);
	}

	@Override
	public boolean update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return dao.update(boardVO) == 1;
		
	}

	@Override
	public boolean delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return dao.delete(bno) == 1;
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount();
	}

	@Override
	public int TotalCount(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return dao.getTotalCount(cri);
	}	
}
