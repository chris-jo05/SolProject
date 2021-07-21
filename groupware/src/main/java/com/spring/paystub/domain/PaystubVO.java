package com.spring.paystub.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class PaystubVO {
	private int eno;
	private int pay_year;
	private int pay_month;
	private String ename;
	
	private String normal_wage;
	private String bonus_wage;
	private String position_wage;
	private String overtime_wage;
	private String holiday_wage;
	private String benefits;
	private String etc_wage;
	
	private String income_tax;
	private String resident_tax;
	private String national_pension;
	private String health_insurance;
	private String emp_Insurance;
	private String longterm_care;
	
	private int real_amount;
	private int totalWages;
	private int totalTaxs;
}
