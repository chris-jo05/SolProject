package com.spring.attendance.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class AttendanceVO {
	private int eno;
	private int dno;
    private String ename;
    private String position;
    private String workDay; 
    private String startTime;     
    private String finishTime;
    private String overTime; 
    private String inout;
}
