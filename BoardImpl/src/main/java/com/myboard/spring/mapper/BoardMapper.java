package com.myboard.spring.mapper;

import java.util.List;
import java.util.Map;

import com.myboard.spring.config.Mapper;
import com.myboard.spring.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//��ü �� ���� select
	public int selectBoardCount();
	//��ü �Խñ� select
	public List<BoardVO> selectBoardAllList(Map<String,Integer> map);
	//�� �ϳ� select
	public BoardVO selectOneList(int bId);
	//�� �ϳ� update
	public void updateBoardInfo(BoardVO boardVo);
	//�� �ϳ� insert
	public void insertWrite(BoardVO boardvo);
	//���� ū bId �� ����
	public Integer maxBId(int bId);
	//��۵� bOreder + 1
	public void updateComments(Map<String, Integer> map);
}
