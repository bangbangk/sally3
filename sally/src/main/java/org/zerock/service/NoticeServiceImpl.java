package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.NoticeCriteria;
import org.zerock.domain.NoticeVO;
import org.zerock.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	private NoticeMapper mapper;

	// 게시물 작성
	@Override
	public void write(NoticeVO vo) throws Exception {

		mapper.write(vo);
	}

	// 게시물 조회
	@Override
	public NoticeVO view(int bno) throws Exception {

	 return mapper.view(bno);
	}
	
	// 게시물 수정
	@Override
	public void modify(NoticeVO vo) throws Exception {
	  
		mapper.modify(vo);
	}
	
	// 게시물 삭제
	public void delete(int bno) throws Exception {
		mapper.delete(bno);
	}
	
	// 게시물 총 갯수
	@Override
	public int getTotal(NoticeCriteria cri) {
	 return mapper.getTotal(cri);
	}
	
	// 게시물 목록 + 페이징
	@Override
	public List<NoticeVO> listPage(NoticeCriteria cri) {
	 return mapper.listPage(cri);
	}

}
