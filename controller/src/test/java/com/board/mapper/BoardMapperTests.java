package com.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.dao.BoardDAO;
import com.board.vo.BoardVO;
import com.board.vo.Criteria;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class BoardMapperTests {
	
	@Autowired
	BoardDAO dao;
	
	@Test
	public void testPaging() throws Exception {
		Criteria cri = new Criteria();
		cri.setPage(1);
		cri.setPerPageNum(10);
		
		List<BoardVO> blist = dao.list(cri);
		
		blist.forEach(board -> log.info(board));
	}
}
