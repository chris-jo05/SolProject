package com.spring.teamView.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TeamCriteria {
	private int pageNum; // 사용자가 클릭하는 페이지 번호
	private int amount; // 하나의 페이지에 보여줄 게시물 갯수
	
	public TeamCriteria() {
		this(1, 6);
	}

	public TeamCriteria(int pageNum, int amount) {
		super();
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
