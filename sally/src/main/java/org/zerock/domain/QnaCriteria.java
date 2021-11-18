package org.zerock.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class QnaCriteria {
	// 1) 페이지번호(pageNum)
	private int qnapageNum;
	// 2) 한 페이지당 몇 개의 데이터를 보여줄것인지?(amount)
	private int qnaamount;
	// +
	// 3) 검색종류
	private String type;
	// 4) keyword
	private String keyword;
	
	public QnaCriteria() {
		this(1,5);
	}
	public QnaCriteria(int pageNum, int amount) {
		this.qnapageNum=pageNum;
		this.qnaamount=amount;
	}
}
