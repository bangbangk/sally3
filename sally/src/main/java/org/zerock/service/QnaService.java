package org.zerock.service;

import org.zerock.domain.QnaCriteria;
import org.zerock.domain.QnaPageDTO;
import org.zerock.domain.QnaVO;

public interface QnaService {
	// qna쓰기(insert) - Create
	public int register(QnaVO vo);

	// qna 상세페이지(select) - Read
	// select 된 결과가 한 건이니까 QnaVO 타입
	public QnaVO get(int bno);

	// qna삭제(delete) - Delete
	public int remove(int bno);

	// qna 수정(update) - Update
	public int modify(QnaVO vo);

	// qna 리스트(select한 결과가 여러 건이니까 ArrayList 타입)
	public QnaPageDTO getQnaList(QnaCriteria qnacri, int gdsNum);
}
