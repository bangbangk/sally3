package org.zerock.service;

import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.ReviewPageDTO;
import org.zerock.domain.ReviewVO;

public interface ReviewService {
	// 리뷰쓰기(insert) - Create
	public int register(ReviewVO vo);
	// 리뷰 상세페이지(select) - Read
	// select 된 결과가 한 건이니까 ReviewVO 타입
	public ReviewVO get(int rno);
	// 리뷰삭제(delete) - Delete
	public int remove(int rno);
	// 리뷰 수정(update) - Update
	public int modify(ReviewVO vo);
	// 리뷰 리스트(select한 결과가 여러 건이니까 ArrayList 타입)
	public ReviewPageDTO getReviewList(ReviewCriteria rvcri, int gdsNum);
}
