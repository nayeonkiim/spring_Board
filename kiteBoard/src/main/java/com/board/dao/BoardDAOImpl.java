package com.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.board.vo.BoardVO;
import com.board.vo.Criteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(BoardVO boardVO) throws Exception {
		sqlSession.insert("com.board.mappers.boardMapper.insert",boardVO);
	}

	@Override
	public List<BoardVO> list(Criteria cri) throws Exception {
		
		return sqlSession.selectList("com.board.mappers.boardMapper.listPage",cri);
	}

	@Override
	public BoardVO read(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.board.mappers.boardMapper.read",bno);
		
	}

	@Override
	public int update(BoardVO boardVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("com.board.mappers.boardMapper.update",boardVO);
		
	}

	@Override
	public int delete(int bno) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("com.board.mappers.boardMapper.delete",bno);
	}

	@Override
	public int listCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("com.board.mappers.boardMapper.listCount");
	}

}
