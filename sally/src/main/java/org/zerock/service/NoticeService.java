package org.zerock.service;

import java.util.List;

import org.zerock.domain.NoticeCriteria;
import org.zerock.domain.NoticeVO;

public interface NoticeService {

	// 게시물 작성
	public void write(NoticeVO vo) throws Exception;
	
	// 게시물 조회
	public NoticeVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(NoticeVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;
	
	// 게시물 총 갯수
	public int getTotal(NoticeCriteria cri);
	
	// 게시물 목록 + 페이징
	public List<NoticeVO> listPage(NoticeCriteria cri);

}
