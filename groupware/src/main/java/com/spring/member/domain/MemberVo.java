package com.spring.member.domain;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
public class MemberVo {
	private int eno;			// 사원 번호
	private int dno;			// 부서 번호
	private String id; 			// 아이디
	private String password;	// 비밀번호
	private String ename;		// 사원 이름
	private String position;	// 직급
	private String birthday; 	// 생일
	private String address; 	// 주소
	private String mobile;		// 휴대폰번호
//	@DateTimeFormat(pattern="yyyy/MM/dd")
//	private Date hireDate;		// 입사일
	private String hireDate;
	private String leaveDate; 	// 퇴사일
	private String acou_name;	// 은행 이름
	private String acount;		// 계좌 번호
	private String gender;		// 성별
	private String dname;
	private String dphone;	
}
