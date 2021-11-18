package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.CateVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.GoodsVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.AdminMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminMapper adminMapper;
	
	/* 상품 등록 */
	@Transactional
	@Override
	public void goodsEnroll(GoodsVO goods) {
		
		log.info("(srevice)goodsEnroll........");
		
		adminMapper.goodsEnroll(goods);
		
		if(goods.getImageList() == null || goods.getImageList().size() <= 0) {
			return;
		}
		
		goods.getImageList().forEach(attach ->{
			
			attach.setGdsNum(goods.getGdsNum());
			adminMapper.imageEnroll(attach);
			
		});
	}
	
	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {
		
		log.info("(service)cateList........");
		
		return adminMapper.cateList();
	}
	/* 2차 카테고리 리스트 */
	@Override
	public List<CateVO> cate2List(String cate1) {
		log.info("(service)2차 cateList........"+cate1);
		
		return adminMapper.cate2List(cate1);
	}
	
	/* 상품 리스트 */
	@Override
	public List<GoodsVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}

	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}
	
	/* 상품 조회 페이지 */
	@Override
	public GoodsVO goodsGetDetail(int gdsNum) {
		
		log.info("(service)goodsGetDetail......." + gdsNum);
		
		return adminMapper.goodsGetDetail(gdsNum);
	}
	
	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int goodsModify(GoodsVO vo) {
		
		int result = adminMapper.goodsModify(vo);
		
		if(result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {
			
			adminMapper.deleteImageAll(vo.getGdsNum());
			
			vo.getImageList().forEach(attach -> {
				
				attach.setGdsNum(vo.getGdsNum());
				adminMapper.imageEnroll(attach);
				
			});
			
		}
		
		return result;
		
	}
	
	/* 상품 정보 삭제 */
	@Override
	public int goodsDelete(int gdsNum) {

		log.info("goodsDelete..........");
		
		return adminMapper.goodsDelete(gdsNum);
	}
	
	
	/* 회원 관리*/
	@Override
	public List<MemberVO> memberList(Criteria cri) {
		
		log.info("(service)memberList......");
		
		return adminMapper.memberList(cri);
	}
	
	/* 회원 전체 인원 */
	public int memberGetTotal(Criteria cri) {
		log.info("memberGetTotal().........");
		return adminMapper.memberGetTotal(cri);
	}
	
	/* 회원 정보 조회 페이지 */
	@Override
	public MemberVO memberGetDetail(String memberId) {
		
		log.info("(service)memberGetDetail......." + memberId);
		
		return adminMapper.memberGetDetail(memberId);
	}
	
	
	/* 회원 정보 수정 */
	@Transactional
	@Override
	public int memberModify(MemberVO vo) {
		
		int result = adminMapper.memberModify(vo);
		
		return adminMapper.memberModify(vo);
		
	}
	
	/* 회원 정보 삭제 */
	/*@Override
	public void memberDelete(MemberVO vo) {

		log.info("memberDelete..........");
		
		return;
	}*/
	
}