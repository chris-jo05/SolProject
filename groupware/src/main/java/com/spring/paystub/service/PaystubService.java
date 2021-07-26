package com.spring.paystub.service;

import java.util.List;

import com.spring.paystub.domain.PaystubListVO;
import com.spring.paystub.domain.PaystubVO;

public interface PaystubService {
	public List<PaystubListVO> list(int eno, int pay_year);
	public boolean insert(PaystubVO vo);
	public PaystubVO get(int pay_year, int pay_month, int eno);
}
