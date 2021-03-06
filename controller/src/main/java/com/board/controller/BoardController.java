package com.board.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.service.BoardService;
import com.board.vo.BoardVO;
import com.board.vo.Criteria;
import com.board.vo.PageMaker;

@Controller
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Inject
	BoardService service;
	
	@RequestMapping(value="/board/writeView", method = RequestMethod.GET)
	public void writeView() throws Exception{
		logger.info("writeView");
	}
	
	@RequestMapping(value="/board/write", method = RequestMethod.POST)
	public String write(BoardVO boardVO, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		logger.info("write");
		
		service.write(boardVO);
		
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum",cri.getPerPageNum());
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/board/list", method = RequestMethod.GET)
	public String list(Model model, Criteria cri) throws Exception{
		logger.info("list");
		
		model.addAttribute("list",service.list(cri));
		
		int total = service.TotalCount(cri);
		logger.info("total: "+total);
		
		model.addAttribute("pageMaker", new PageMaker(cri,total));
		
		return "board/list";
	}
	
	@RequestMapping(value="/board/readView", method=RequestMethod.GET)
	public String read(int bno, @ModelAttribute("cri") Criteria cri, Model model) throws Exception{

		model.addAttribute("read",service.read(bno));
		
		return "board/readView";
	}
	
	@RequestMapping(value="/board/updateView", method=RequestMethod.GET)
	public String updateView(int bno,  @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		
		model.addAttribute("update",service.read(bno));
		return "board/updateView";
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	public String update(BoardVO boardVO,  @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception {
		
		if (service.update(boardVO)) {
			rttr.addFlashAttribute("page","success");
		}
		/*
		 * rttr.addAttribute("page", cri.getPage());
		 * rttr.addAttribute("perPageNum",cri.getPerPageNum());
		 * rttr.addAttribute("type", cri.getType()); rttr.addAttribute("keyword",
		 * cri.getKeyword());
		 */
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
	@RequestMapping(value="board/delete", method=RequestMethod.POST)
	public String delete(int bno,@ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) throws Exception{
		
		if(service.delete(bno)) {
			rttr.addFlashAttribute("page",cri.getPage());
		}
		
		/*
		 * rttr.addAttribute("page", cri.getPage());
		 * rttr.addAttribute("perPageNum",cri.getPerPageNum());
		 * rttr.addAttribute("type", cri.getType()); rttr.addAttribute("keyword",
		 * cri.getKeyword());
		 */
		
		return "redirect:/board/list" + cri.getListLink();
	}

}
