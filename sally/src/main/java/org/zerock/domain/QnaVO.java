package org.zerock.domain;

import java.util.Date;

import lombok.Data;

@Data
public class QnaVO {
	// Qna 번호
	private int bno;
	// Qna 제목
	private String title;
	// Qna 내용
	private String content;
	// 작성자
	private String writer;
	// 등록일
	private Date regdate;
	// 조회수
	private int views;
	// 상품 번호
	private int gdsNum;
}
