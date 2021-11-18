package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ReviewCriteria;
import org.zerock.domain.ReviewVO;

public interface ReviewMapper {
	// 리뷰쓰기(insert) - Create
	public int insert(ReviewVO vo);
	// 리뷰상세페이지(select) - Read
	// select된 결과가 한 건이니까 ReviewVO 타입
	public ReviewVO read(int rno);
	// 리뷰삭제(delete) - Delete
	public int delete(int rno);
	// 리뷰수정(update) - Update
	public int update(ReviewVO vo);
	// 리뷰목록리스트(select된 결과가 여러 건이니까 ArrayList 타입)
	public List<ReviewVO> getReviewListWithPaging(@Param("rvcri") ReviewCriteria rvcri,
												  @Param("gdsNum") int gdsNum);
	public int getReviewCountByGdsNum(int gdsNum);
}
