package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.GoodsVO;

public interface GoodsMapper {
	
	//상품 목록 대분류
	public List<GoodsVO> category(String cateName) throws Exception;
	
	//상품 목록 소분류
	public List<GoodsVO> list(String cateCode) throws Exception;

}
