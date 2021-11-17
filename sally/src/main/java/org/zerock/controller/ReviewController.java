package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.service.ReviewService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/reviews")
public class ReviewController {
	
	private ReviewService service;
	
	@PostMapping(value = "/new",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE })
// 접근제어자	리턴타입					메소드명
	public ResponseEntity<String> create(@RequestBody ReviewVO vo) {
		log.info("ReviewVO : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Review INSERT COUNT : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	} // 댓글쓰기 끝

	@GetMapping(value = "/pages/{gdsNum}/{reviewPage}",
				produces = { MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewPageDTO> getList(
			@PathVariable("reviewPage") int reviewPage,
			@PathVariable("gdsNum") int gdsNum) {
		log.info("getList......controller");
		ReviewCriteria rvcri = new ReviewCriteria(reviewPage, 3);
		log.info(rvcri);
		
		//							select한 결과					통신이 정상적으로 처리
		return new ResponseEntity<>(service.getReviewList(rvcri, gdsNum), HttpStatus.OK);
	} // 댓글 목록 리스트 끝
	
	@GetMapping(value = "/{rno}",
				produces = { MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<ReviewVO> get(@PathVariable("rno") int rno) {
		log.info("get : " + rno);
		//							select한 결과			통신이 정상적으로 처리
		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	} // 댓글 상세 페이지
	
	@DeleteMapping(value = "/{rno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") int rno) {
		log.info("remove : " + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	} // 댓글 삭제
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{rno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
					@RequestBody ReviewVO vo,
					@PathVariable("rno") int rno) {
		vo.setRno(rno);
		
		log.info("rno : " + rno);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
