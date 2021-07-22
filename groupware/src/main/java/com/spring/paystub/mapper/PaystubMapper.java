package com.spring.paystub.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.paystub.domain.PaystubListVO;
import com.spring.paystub.domain.PaystubVO;

public interface PaystubMapper {
	public List<PaystubListVO> list(int eno);
	public int insert(PaystubVO vo);
	public PaystubVO get(@Param("pay_year") int pay_year,@Param("pay_month") int pay_month, @Param("eno") int eno);
}
