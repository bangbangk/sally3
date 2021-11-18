package org.zerock.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.NoticeCriteria;
import org.zerock.domain.NoticePageDTO;
import org.zerock.domain.NoticeVO;
import org.zerock.service.NoticeService;

import lombok.extern.log4j.Log4j;
	
//@SuppressWarnings("unused")
@Log4j
@Controller
@RequestMapping("/notice/*")
public class NoticeController {
	
	@Inject
	NoticeService service;
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void getWrite() throws Exception{
		
	}
	
	// 게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(NoticeVO vo) throws Exception{
		service.write(vo);
		
		return "redirect:/notice/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model, NoticeCriteria cri) throws Exception{
		NoticeVO vo = service.view(bno);
		model.addAttribute("view", vo);
		model.addAttribute("cri", cri);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		NoticeVO vo = service.view(bno);
		   
		 model.addAttribute("view", vo);
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String postModify(NoticeVO vo) throws Exception {

	 service.modify(vo);
	   
	 return "redirect:/notice/view?bno=" + vo.getBno();
	}
	
	// 게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno) throws Exception {
	  
	 service.delete(bno);  

	 return "redirect:/notice/list";
	}
	
	// 게시물 목록 + 페이징 추가
	@GetMapping("/list")
	public void getListPage(Model model, NoticeCriteria cri) {
        
        log.info("getListPage");
        
        model.addAttribute("list", service.listPage(cri));
        
        int total = service.getTotal(cri);
        
        NoticePageDTO pageMake = new NoticePageDTO(cri, total);
        
        model.addAttribute("pageMake", pageMake);
    }
	
	
}
