<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
	
<jsp:include page="/WEB-INF/views/main_header.jsp"></jsp:include>
	
<link rel="stylesheet" type="text/css" href="/resources/css/main/layout.css">
<link rel="stylesheet" href="/resources/css/main_header.css">
<link rel="stylesheet" href="/resources/css/main_footer.css">
<link rel="stylesheet" href="/resources/css/member/withdrawal.css">

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<div class="wrapper">
	<form id="withdrawal_form" method="post">
		<div class="wrap">
			<h2>회원탈퇴</h2>
			<div class="id_wrap">
				<div class="id_name">아이디</div>
				<input class="id_input_box" class="form-control" type="text" id="memberId" name="memberId" value="${member.memberId}" readonly="readonly"/>
			</div>
			<div class="pw_wrap">
				<div class="pw_name">비밀번호</div>
				<div class="pw_input_box">
					<input type="password" class="pw_input" name="memberPw">
				</div>
				<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
			</div>
			<div class="pwck_wrap">
				<div class="pwck_name">비밀번호 확인</div>
				<div class="pwck_input_box">
					<input type="password" class="pwck_input">
				</div>
				<span class="final_pwck_ck">비밀번호 확인을 입력해주세요.</span>
				<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
               	<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
			</div>				
			<div class="withdrawal_button_wrap">
				<input type="submit" class="withdrawal_button" value="회원탈퇴">
				<a class="home_button" href="/sally">메인페이지로</a>
			</div>
		</div>
	</form>
</div>
    
    <script>
    
    /* 유효성 검사 통과유무 변수 */
    var pwCheck = false;            // 비번
    var pwckCheck = false;            // 비번 확인
    var pwckcorCheck = false;        // 비번 확인 일치 확인

	$(document).ready(function(){
		$("#withdrawal_button").click(function(){
			
			 /* 입력값 변수 */
	        var pw = $('.pw_input').val();                // 비밀번호 입력란
	        var pwck = $('.pwck_input').val();            // 비밀번호 확인 입력란
	        
	        /* 비밀번호 유효성 검사 */
	        if(pw == ""){
	            $('.final_pw_ck').css('display','block');
	            pwCheck = false;
	        }else{
	            $('.final_pw_ck').css('display', 'none');
	            pwCheck = true;
	        }
	        /* 비밀번호 확인 유효성 검사 */
	        if(pwck == ""){
	            $('.final_pwck_ck').css('display','block');
	            pwckCheck = false;
	        }else{
	            $('.final_pwck_ck').css('display', 'none');
	            pwckCheck = true;
	        }

	        
	        /* 최종 유효성 검사 */
	        if(pwCheck&&pwckCheck&&pwckcorCheck){
	 		
	        	$("#modify_form").attr("action", "/member/withdrawal");
	            $("#modify_form").submit();   
	        } 
	        
	        return false; 
		});
	});
	
	
	/* 비밀번호 확인 일치 유효성 검사 */
	 
	$('.pwck_input').on("propertychange change keyup paste input", function(){
	 
	    var pw = $('.pw_input').val();
	    var pwck = $('.pwck_input').val();
	    $('.final_pwck_ck').css('display', 'none');
	 
	    if(pw == pwck){
	        $('.pwck_input_re_1').css('display','block');
	        $('.pwck_input_re_2').css('display','none');
	        pwckcorCheck = true;
	    }else{
	        $('.pwck_input_re_1').css('display','none');
	        $('.pwck_input_re_2').css('display','block');
	        pwckcorCheck = false;
	    }        
	    
	});    

	</script>
<jsp:include page="/WEB-INF/views/main_footer.jsp"></jsp:include>