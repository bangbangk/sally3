package org.zerock.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.GoodsVO;
import org.zerock.service.GoodsService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/goods")
public class ProductController {
	
	private GoodsService service;
	
	// 제품 상세페이지
	//@RequestMapping(value = "/goods/detail", method = RequestMethod.GET)
	@GetMapping("detail")
	public void list(@RequestParam("gdsNum") int gdsNum, Model model) {
		log.info("detail");
		GoodsVO goods = service.goodsDetail(gdsNum);
		model.addAttribute("goods", goods);
	}
	
	
}