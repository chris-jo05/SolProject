package com.spring.anonymous.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class AnonymousReplyVO {

	private int reno;
	private int ano;
	private String rwriter;
	private String rcontents;
	private String rpassword;
	private Date replydate;
	private Date replyupdate;
	
}
