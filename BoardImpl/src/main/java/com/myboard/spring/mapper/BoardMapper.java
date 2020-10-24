package com.myboard.spring.mapper;

import java.util.List;
import java.util.Map;

import com.myboard.spring.config.Mapper;
import com.myboard.spring.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//전체 글 갯수 select
	public int selectBoardCount();
	//keyword 기준 글 갯수 return
	public int selectBoardCountWithKeyword(Map<String, Object> map);
	//전체 게시글 select
	public List<BoardVO> selectBoardAllList(Map<String, Object> map);
	//keyword 기준 전체 게시글 return
	public List<BoardVO> selectBoardAllListWithKeyword(Map<String, Object> map);
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
	//조회수 update
	public void updatebHit(int bId);
	//공감,비공감 업데이트
	public void updatebGoodHate(Map<String, Object> map);
	//공감,비공감 select
	public int selectbGoodHate(Map<String, Object> map);
	//키워드로 글 다시 출력
	public void selectByKeyword(Map<String, String> map);

}
