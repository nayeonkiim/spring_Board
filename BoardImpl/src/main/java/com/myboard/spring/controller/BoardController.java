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
	
	//page 해당 게시글 보기
	@RequestMapping("/board/boardView/{page}")
	public String toMainView(@PathVariable int page, Model model) {
		//startpage, endpage 정보가 넘어옴
		int[] pageNumInfo = service.selectPageNum(page);
		
		model.addAttribute("curPage",page);
		model.addAttribute("pageNumInfo",pageNumInfo);
		model.addAttribute("list",service.selectBoardList(page));
		return "/board/boardView";
	}
	
	//글 읽기
	@RequestMapping("/board/boardRead/{bId}/{curPage}")
	public String toReadView(@PathVariable int bId, @PathVariable int curPage, Model model) {
		BoardVO boardVo = service.selectOneBoardList(bId);
		model.addAttribute("board", boardVo);
		model.addAttribute("curPage",curPage);
		return "/board/boardRead";
	}
	
	//게시글 수정페이지로 이동
	@RequestMapping("/board/boardMod/{bId}/{curPage}")
	public String modify(@PathVariable int bId, @PathVariable int curPage,Model model) {
		BoardVO boardVo = service.selectOneBoardList(bId);
		model.addAttribute("board", boardVo);
		model.addAttribute("curPage",curPage);
		return "/board/boardMod";
	}
	
	//게시글 수정 반영 후 글읽기 화면으로 이동
	@RequestMapping("/board/boardModSubmit/{bId}/{curPage}")
	public String modifySubmit(@PathVariable int bId, @PathVariable int curPage, BoardVO boardvo, Model model) {
		System.out.println(boardvo.getbTitle());
		boolean reflect = service.modInfo(bId, boardvo);
		if(reflect) {
			return "redirect:/board/boardRead/{bId}/{curPage}";
		}
		model.addAttribute("reflectFail","수정실패");
		return "/board/boardMod";
	}
	
	//글쓰기 화면 요청 - 댓글 쓰기 화면(bId={bId}), 새글쓰기 화면(bId= 0)
	@RequestMapping("/board/boardWrite/{bId}")
	public String boardWrite(@PathVariable int bId, Model model) {
		model.addAttribute("bId",bId);
		return "/board/boardWriting";
	}
	
	//글쓰기 DB 반영 - 댓글과 새글 구분 필요(새글은 bId가 0으로 들어옴, 
	@RequestMapping("/board/boardWriteSubmit/{bId}")
	public String boardFinalWrite(@PathVariable int bId, BoardVO boardvo) {
		service.insertWriting(bId, boardvo);
		return "redirect:/board/boardView/1";
	}
}
