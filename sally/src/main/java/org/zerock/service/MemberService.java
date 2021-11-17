package org.zerock.service;

import java.util.List;

import org.zerock.domain.MemberVO;

public interface MemberService {
	
	// 회원가입
	public void memberJoin(MemberVO member) throws Exception;
	
	// 아이디 중복 검사
	public int idCheck(String memberId) throws Exception;
	
	// 로그인
    public MemberVO memberLogin(MemberVO member) throws Exception;
    
    // 회원정보 수정
    public void updateMember(MemberVO member) throws Exception;
    
    // 회원 탈퇴
 	public void withdrawal(MemberVO member) throws Exception;
}
