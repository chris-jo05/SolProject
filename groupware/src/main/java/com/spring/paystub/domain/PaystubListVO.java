package com.spring.paystub.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class PaystubListVO {
	private int eno;
	private int pay_year;
	private int pay_month;
	private String dname;
	private String position;
	private String acount;
	private String acou_name;
}
