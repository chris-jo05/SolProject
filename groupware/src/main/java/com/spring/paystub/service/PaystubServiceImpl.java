package com.spring.paystub.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.paystub.domain.PaystubListVO;
import com.spring.paystub.domain.PaystubVO;
import com.spring.paystub.mapper.PaystubMapper;

@Service
public class PaystubServiceImpl implements PaystubService {

	@Autowired
	public PaystubMapper mapper;
	
	@Override
	public List<PaystubListVO> list(int eno) {
		return mapper.list(eno);
	}
	
	@Override
	public PaystubVO get(int pay_year, int pay_month, int eno) {
		return mapper.get(pay_year, pay_month, eno);
	}
	
	@Override
	public boolean insert(PaystubVO vo) {
		return mapper.insert(vo) > 0 ? true : false;
	}
}
