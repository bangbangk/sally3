package org.zerock.controller;

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
import org.zerock.domain.QnaCriteria;
import org.zerock.domain.QnaPageDTO;
import org.zerock.domain.QnaVO;
import org.zerock.service.QnaService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@RequestMapping("/qnas")
public class QnaController {
	
	private QnaService service;
	
	@PostMapping(value = "/new",
				consumes = "application/json",
				produces = { MediaType.TEXT_PLAIN_VALUE })
// 접근제어자	리턴타입					메소드명
	public ResponseEntity<String> create(@RequestBody QnaVO vo) {
		log.info("QnaVO : " + vo);
		
		int insertCount = service.register(vo);
		
		log.info("Qna INSERT COUNT : " + insertCount);
		
		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK) : new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	} // 댓글쓰기 끝

	@GetMapping(value = "/pages/{gdsNum}/{qnaPage}",
				produces = { MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QnaPageDTO> getList(
			@PathVariable("qnaPage") int qnaPage,
			@PathVariable("gdsNum") int gdsNum) {
		log.info("getQnaList......QnaController");
		QnaCriteria qnacri = new QnaCriteria(qnaPage, 5);
		log.info(qnacri);
		
		//							select한 결과					통신이 정상적으로 처리
		return new ResponseEntity<>(service.getQnaList(qnacri, gdsNum), HttpStatus.OK);
	} // 댓글 목록 리스트 끝
	
	@GetMapping(value = "/{bno}",
				produces = { MediaType.APPLICATION_XML_VALUE,
							MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<QnaVO> get(@PathVariable("bno") int bno) {
		log.info("get : " + bno);
		//							select한 결과			통신이 정상적으로 처리
		return new ResponseEntity<>(service.get(bno), HttpStatus.OK);
	} // 댓글 상세 페이지
	
	@DeleteMapping(value = "/{bno}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("bno") int bno) {
		log.info("remove : " + bno);
		
		return service.remove(bno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	} // 댓글 삭제
	
	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{bno}",
			consumes = "application/json",
			produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(
					@RequestBody QnaVO vo,
					@PathVariable("bno") int bno) {
		vo.setBno(bno);
		
		log.info("bno : " + bno);
		log.info("modify : " + vo);
		
		return service.modify(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
