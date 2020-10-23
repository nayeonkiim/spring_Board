package com.myboard.spring.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.myboard.spring.service.BoardService;
import com.myboard.spring.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@RequestMapping("/")
	public String main() {
		return "redirect:/board/boardView/1";
	}
	
	//page �ش� �Խñ� ����
	@RequestMapping("/board/boardView/{page}")
	public String toMainView(@PathVariable int page, Model model) {
		//startpage, endpage ������ �Ѿ��
		int[] pageNumInfo = service.selectPageNum(page);
		
		model.addAttribute("curPage",page);
		model.addAttribute("pageNumInfo",pageNumInfo);
		model.addAttribute("list",service.selectBoardList(page));
		return "/board/boardView";
	}
	
	//�� �б�
	@RequestMapping("/board/boardRead/{bId}/{curPage}")
	public String toReadView(@PathVariable int bId, @PathVariable int curPage, Model model) {
		BoardVO boardVo = service.selectOneBoardList(bId);
		model.addAttribute("board", boardVo);
		model.addAttribute("curPage",curPage);
		return "/board/boardRead";
	}
	
	//�Խñ� ������������ �̵�
	@RequestMapping("/board/boardMod/{bId}/{curPage}")
	public String modify(@PathVariable int bId, @PathVariable int curPage,Model model) {
		BoardVO boardVo = service.selectOneBoardList(bId);
		model.addAttribute("board", boardVo);
		model.addAttribute("curPage",curPage);
		return "/board/boardMod";
	}
	
	//�Խñ� ���� �ݿ� �� ���б� ȭ������ �̵�
	@RequestMapping("/board/boardModSubmit/{bId}/{curPage}")
	public String modifySubmit(@PathVariable int bId, @PathVariable int curPage, BoardVO boardvo, Model model) {
		System.out.println(boardvo.getbTitle());
		boolean reflect = service.modInfo(bId, boardvo);
		if(reflect) {
			return "redirect:/board/boardRead/{bId}/{curPage}";
		}
		model.addAttribute("reflectFail","��������");
		return "/board/boardMod";
	}
	
	//�۾��� ȭ�� ��û - ��� ���� ȭ��(bId={bId}), ���۾��� ȭ��(bId= 0)
	@RequestMapping("/board/boardWrite/{bId}")
	public String boardWrite(@PathVariable int bId, Model model) {
		model.addAttribute("bId",bId);
		return "/board/boardWriting";
	}
	
	//�۾��� DB �ݿ� - ��۰� ���� ���� �ʿ�(������ bId�� 0���� ����, 
	@RequestMapping("/board/boardWriteSubmit/{bId}")
	public String boardFinalWrite(@PathVariable int bId, BoardVO boardvo) {
		service.insertWriting(bId, boardvo);
		return "redirect:/board/boardView/1";
	}
}
