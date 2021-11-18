package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.QnaCriteria;
import org.apache.ibatis.annotations.Param;
import org.zerock.domain.QnaVO;

public interface QnaMapper {
	// qna쓰기(insert) - Create
	public int insert(QnaVO vo);

	// qna상세페이지(select) - Read
	// select된 결과가 한 건이니까 QnaVO 타입
	public QnaVO read(int bno);

	// qna삭제(delete) - Delete
	public int delete(int bno);

	// qna수정(update) - Update
	public int update(QnaVO vo);

	// qna목록리스트(select된 결과가 여러 건이니까 ArrayList 타입)
	public List<QnaVO> getQnaListWithPaging(@Param("qnacri") QnaCriteria qnacri,
											@Param("gdsNum") int gdsNum);

	public int getQnaCountByGdsNum(int gdsNum);

}
