package com.spring.paystub.service;

import java.util.List;

import com.spring.paystub.domain.PaystubListVO;
import com.spring.paystub.domain.PaystubVO;

public interface PaystubService {
	List<PaystubListVO> list(int eno);
	PaystubVO get(int pay_year, int pay_month, int eno);
}
