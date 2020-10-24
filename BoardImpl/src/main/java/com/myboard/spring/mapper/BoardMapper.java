package com.myboard.spring.mapper;

import java.util.List;
import java.util.Map;

import com.myboard.spring.config.Mapper;
import com.myboard.spring.vo.BoardVO;

@Mapper
public interface BoardMapper {
	//��ü �� ���� select
	public int selectBoardCount();
	//keyword ���� �� ���� return
	public int selectBoardCountWithKeyword(Map<String, Object> map);
	//��ü �Խñ� select
	public List<BoardVO> selectBoardAllList(Map<String, Object> map);
	//keyword ���� ��ü �Խñ� return
	public List<BoardVO> selectBoardAllListWithKeyword(Map<String, Object> map);
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
	//��ȸ�� update
	public void updatebHit(int bId);
	//����,����� ������Ʈ
	public void updatebGoodHate(Map<String, Object> map);
	//����,����� select
	public int selectbGoodHate(Map<String, Object> map);
	//Ű����� �� �ٽ� ���
	public void selectByKeyword(Map<String, String> map);

}
