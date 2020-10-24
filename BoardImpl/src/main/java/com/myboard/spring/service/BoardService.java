package com.myboard.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myboard.spring.mapper.BoardMapper;
import com.myboard.spring.vo.BoardVO;

@Service
public class BoardService {
	
	//�� �������� ��� �Խù� ����
	static final int pagePerNum = 10;
	static final int perPageBlock = 10;
	
	@Autowired
	private BoardMapper mapper;
	
	public int[] selectPageNum(int page) {
		int numOfpost = mapper.selectBoardCount();
		int totalPage = numOfpost/10;
		
		if(numOfpost%10 != 0) {
			totalPage += 1;
		}
		
		//�Ʒ� ���� ����� ����
		int startPage = (page/perPageBlock) * 10 + 1;
		int endPage = startPage+10 < totalPage ? startPage+10 : totalPage;
		
		return new int[] {startPage, endPage};
	}
	
	//���� �� ��� ȭ�� ����
	public Map<String, Object> selectBoardList(int page){
		//�� �Խñ� ��, �� ������ ��
		Map<String, Integer> map = new HashMap<>();
		map.put("starting",(page-1)*pagePerNum);
		map.put("pagePerNum",pagePerNum);
		
		Map<String, Object> listMap = new HashMap<>();
		listMap.put("lists",mapper.selectBoardAllList(map));
		listMap.put("perPageBlock",perPageBlock);
		//10���� select ��.
		return listMap;
	}
	
	//�� ���� ���
	public BoardVO selectOneBoardList(int bId) {
		//��ȸ�� ������Ʈ
		mapper.updatebHit(bId);
		
		BoardVO vo = mapper.selectOneList(bId);
		return vo;
	}
	
	//�� ���� ����(����� ���븸 ���� ����)
	public boolean modInfo(int bId, BoardVO getInfo) {
		
		try {
			BoardVO boardVo = selectOneBoardList(bId);
			boardVo.setbTitle(getInfo.getbTitle());
			boardVo.setbContent(getInfo.getbContent());
			mapper.updateBoardInfo(boardVo);
			return true;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	//�� ���
	public void insertWriting(int bId, BoardVO boardvo) {
		BoardVO bGroupNum = null;
		Integer setBGroup = 0;
		int setBOrder = 0, setBIndent = 0;
		
		//����� ���
		if(bId != 0) {
			bGroupNum =  mapper.selectOneList(bId);
			setBOrder = bGroupNum.getbOrder()+1;
			setBGroup = bGroupNum.getbGroup();
			setBIndent = bGroupNum.getbIndent()+1;
			
			//��۵��� bOrder �ϳ��� +1
			try {
				Map<String,Integer> map = new HashMap<>();
				map.put("bGroup", bGroupNum.getbGroup());
				map.put("bOrder", bGroupNum.getbOrder());
				
				mapper.updateComments(map);
			}catch(Exception e) {
				e.printStackTrace();
			}
			
		//������ ��� bGroup�� bId �������� �־���
		}else {
			setBGroup = mapper.maxBId(bId)+1;
		}
		
		//���� ���� ��ü insert
		try {
			BoardVO comment = new BoardVO(boardvo);
			comment.setbId(0);
			comment.setbGroup(setBGroup);
			comment.setbOrder(setBOrder);  
			comment.setbIndent(setBIndent);
			comment.setbHit(0);
			comment.setbGood(0);
			comment.setbHate(0);
			
			mapper.insertWrite(comment);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Integer updatebGoodbHateNum(Map<String, Object> map) {
		try {
			//1 ���� ������Ʈ
			mapper.updatebGoodHate(map);
			Integer result = mapper.selectbGoodHate(map);
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
