package board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import board.bean.BoardDTO;
import board.bean.BoardPaging;
import board.dao.BoardDAO;

@RequestMapping(value="/board")
@Component
@Controller
public class BoardController {
	
	@Autowired
	BoardPaging boardPaging;
	@Autowired
	BoardDAO boardDAO;
	
	
	@RequestMapping(value="boardList",method=RequestMethod.GET)
	public ModelAndView boardList(@RequestParam(required=false) String pg) {
		if(pg==null) pg="1";
		ModelAndView mav = new ModelAndView();
		mav.addObject("pg", pg);
		mav.setViewName("/board/boardList");
		return mav;
	}
	@RequestMapping(value="boardListAction")
	public ModelAndView boardListAction(@RequestParam String pg ) {
		
		ModelAndView mav = new ModelAndView();
		
		int endNum = Integer.parseInt(pg)*10;
		int startNum = endNum-9;
		
		//DB
		int getTotalA = boardDAO.getTotalA(startNum, endNum);
		List<BoardDTO> list = boardDAO.boardList(startNum,endNum);
		
		//페이징처리
		boardPaging.setCurrentPage(Integer.parseInt(pg));
		boardPaging.setPageBlock(5);
		boardPaging.setPageSize(10);
		boardPaging.setTotalA(getTotalA);
		boardPaging.makePagingHTML();
		
		//return
		mav.addObject("pg", pg);
		mav.addObject("list", list);
		mav.addObject("boardPaging", boardPaging);
		mav.setViewName("jsonView");
		return mav;
	}
	
	
	@RequestMapping(value="boardWriteForm",method=RequestMethod.GET)
	public ModelAndView boardWriteForm() {
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/board/boardWriteForm");
		return mav;
	}
	@RequestMapping(value="boardWrite",method=RequestMethod.POST)
	public ModelAndView boardWrite(@RequestParam Map<String,String> map) {
		String pg="1";
		ModelAndView mav = new ModelAndView();
		boardDAO.boardWrite(map);
		mav.addObject("pg",pg);
		mav.setViewName("/board/boardList");
		return mav;
	}
	@RequestMapping(value="boardView", method=RequestMethod.GET)
	public ModelAndView boardView(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		
		BoardDTO boardDTO = boardDAO.boardView(map);
		
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", boardDTO);
		mav.setViewName("/board/boardView");
		return mav;
	}
	
	@RequestMapping(value="boardUpdateForm", method=RequestMethod.GET)
	public ModelAndView boardUpdateForm(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		
		BoardDTO boardDTO = boardDAO.boardView(map);
		mav.addObject("pg", map.get("pg"));
		mav.addObject("list", boardDTO);
		mav.setViewName("/board/boardUpdateForm");
		return mav;
	}
	@RequestMapping(value="boardUpdate", method=RequestMethod.POST)
	public ModelAndView boardUpdate(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		boardDAO.boardUpdate(map);
		mav.addObject("pg",map.get("pg"));
		mav.setViewName("/board/boardList");
		return mav;
	}
	@RequestMapping(value="boardDelete", method=RequestMethod.POST)
	public ModelAndView boardDelete(@RequestParam Map<String, Object>map) {
		ModelAndView mav = new ModelAndView();
		boardDAO.boardDelete(map);
		
		mav.addObject("pg",map.get("pg"));
		mav.setViewName("/board/boardList");
		return mav;
	}
}
