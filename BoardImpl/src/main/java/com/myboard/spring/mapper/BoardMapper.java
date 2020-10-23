package com.myboard.spring.mapper;

import java.util.List;
import java.util.Map;

import com.myboard.spring.config.Mapper;
import com.myboard.spring.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//전체 글 갯수 select
	public int selectBoardCount();
	//전체 게시글 select
	public List<BoardVO> selectBoardAllList(Map<String,Integer> map);
	//글 하나 select
	public BoardVO selectOneList(int bId);
	//글 하나 update
	public void updateBoardInfo(BoardVO boardVo);
	//글 하나 insert
	public void insertWrite(BoardVO boardvo);
	//제일 큰 bId 값 리턴
	public Integer maxBId(int bId);
	//댓글들 bOreder + 1
	public void updateComments(Map<String, Integer> map);
}
