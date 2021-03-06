package com.spring.calendar.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class CalendarVO {
	private int cno;
	private int eno;
	private int dno;
	private String title;
	private String content;
	private String groupId;
	private String author;
	private String startDate;
	private String endDate;
	private String cal_startTime;
    private String cal_endTime;
    private String rep;
    private String memo;
    private String cal_color;
    private String cal_check;
}
