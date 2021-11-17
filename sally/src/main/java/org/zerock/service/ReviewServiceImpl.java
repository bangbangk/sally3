package org.zerock.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;
import org.zerock.mapper.ProductMapper;
import org.zerock.mapper.ReviewMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ReviewServiceImpl implements ReviewService {

	// springframework 버전 4.3 이상이면 생략가능
	// @Setter(onMethod_=@Autowired)
	private ReviewMapper mapper;
	private ProductMapper productmapper;

	// 리뷰 쓰기
	@Transactional
	@Override
	public int register(ReviewVO vo) {
		log.info("register...." + vo);
		productmapper.updateReviewCnt(vo.getGdsNum(), 1);
		return mapper.insert(vo);
	}

	// 리뷰상세페이지(select된 결과가 한 건이니까 ReviewVO 타입)
	@Override
	public ReviewVO get(int rno) {
		log.info("get...." + rno);
		return mapper.read(rno);
	}

	// 리뷰삭제
	@Transactional
	@Override
	public int remove(int rno) {
		log.info("remove....." + rno);
		ReviewVO vo = mapper.read(rno);
		productmapper.updateReviewCnt(vo.getGdsNum(), -1);
		return mapper.delete(rno);
	}

	// 리뷰수정
	@Override
	public int modify(ReviewVO vo) {
		log.info(vo);
		return mapper.update(vo);
	}

	// 리뷰목록리스트(select된 결과가 여러 건이니까 ArrayList 타입)
	@Override
	public ReviewPageDTO getReviewList(ReviewCriteria rvcri, int gdsNum) {
		log.info("get Review List of a Product : " + gdsNum);
		return new ReviewPageDTO(mapper.getReviewCountByGdsNum(gdsNum),
								 mapper.getReviewListWithPaging(rvcri, gdsNum));
	}
}
