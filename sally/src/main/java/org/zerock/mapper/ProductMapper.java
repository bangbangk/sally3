package org.zerock.mapper;

import org.apache.ibatis.annotations.Param;

public interface ProductMapper {

	public void updateReviewCnt(@Param("gdsNum") int gdsNum,
								@Param("rvamount") int rvamount);
	
	public void updateQnaCnt(@Param("gdsNum") int gdsNum,
							 @Param("qnaamount") int qnaamount);

}
