package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.QnaCriteria;
import org.zerock.domain.QnaVO;
import org.zerock.domain.QnaPageDTO;
import org.zerock.mapper.ProductMapper;
import org.zerock.mapper.QnaMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QnaServiceImpl implements QnaService {

	// springframework 버전 4.3 이상이면 생략가능
	// @Setter(onMethod_=@Autowired)
	private QnaMapper mapper;
	private ProductMapper productmapper;

	// qna 쓰기
	@Transactional
	@Override
	public int register(QnaVO vo) {
		log.info("register...." + vo);
		productmapper.updateQnaCnt(vo.getGdsNum(), 1);
		return mapper.insert(vo);
	}

	// qna상세페이지(select된 결과가 한 건이니까 QnaVO 타입)
	@Override
	public QnaVO get(int bno) {
		log.info("get...." + bno);
		return mapper.read(bno);
	}

	// qna삭제
	@Transactional
	@Override
	public int remove(int bno) {
		log.info("remove....." + bno);
		QnaVO vo = mapper.read(bno);
		productmapper.updateQnaCnt(vo.getGdsNum(), -1);
		return mapper.delete(bno);
	}

	// qna수정
	@Override
	public int modify(QnaVO vo) {
		log.info(vo);
		return mapper.update(vo);
	}

	// qna목록리스트(select된 결과가 여러 건이니까 ArrayList 타입)
	@Override
	public QnaPageDTO getQnaList(QnaCriteria qnacri, int gdsNum) {
		log.info("get Qna List of a Product : " + gdsNum);
		return new QnaPageDTO(mapper.getQnaCountByGdsNum(gdsNum),
								 mapper.getQnaListWithPaging(qnacri, gdsNum));
	}
}
