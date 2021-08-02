package com.spring.anonymous.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AnonymousVO {
	private int ano;
	private String atitle;
	private String awriter;
	private String acontents;
	private Date adate;
	private Date aupdatedate;
	private String apassword;
}
