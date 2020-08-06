package com.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.board.mappers.ReplyMapper;
import com.board.vo.Criteria;
import com.board.vo.ReplyVO;


import org.springframework.beans.factory.annotation.Autowired;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReplyServiceImpl implements ReplyService{

	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;
	
	@Override
	public int register(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("register......."+vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get......."+bno);
		return mapper.read(bno);
	}

	@Override
	public int modify(ReplyVO vo) {
		// TODO Auto-generated method stub
		
		log.info("modify......."+vo);
		
		return mapper.update(vo);
	}

	@Override
	public int remove(Long rno) {
		// TODO Auto-generated method stub
		
		log.info("remove.........."+rno);
		return mapper.delete(rno);
	}

	@Override
	public List<ReplyVO> getList(Criteria cri, Long bno) {
		// TODO Auto-generated method stub
		
		log.info("get Reply List of a Board"+bno);
		
		return mapper.getListWithPaging(cri, bno);
	}
	
}
