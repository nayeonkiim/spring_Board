package com.board.mappers;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.board.vo.Criteria;
import com.board.vo.ReplyVO;

public interface ReplyMapper {
	
	// ��� ���
	public int insert(ReplyVO vo);
	
	//��� ��ȸ
	public ReplyVO read(Long bno);
	
	//��� ����
	public int delete(Long targetRno);

	//��� ����
	public int update(ReplyVO vo);
	
	// bno�� �Խù��� �ش��ϴ� ��� ��� ������
	public List<ReplyVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("bno") Long bno);
}
