package com.board.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.vo.Criteria;
import com.board.vo.ReplyVO;

public interface ReplyMapper {
	
	// 댓글 등록
	public int insert(ReplyVO vo);
	
	//댓글 조회
	public ReplyVO read(Long bno);
	
	//댓글 삭제
	public int delete(Long targetRno);

	//댓글 수정
	public int update(ReplyVO vo);
	
	// bno에 게시물에 해당하는 댓글 모두 가져옴
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
}
