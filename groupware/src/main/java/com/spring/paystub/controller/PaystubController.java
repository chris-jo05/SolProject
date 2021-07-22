package com.spring.paystub.controller;

import java.text.DecimalFormat;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.paystub.domain.PaystubListVO;
import com.spring.paystub.domain.PaystubVO;
import com.spring.paystub.service.PaystubService;

import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
@RequestMapping("/paystub/*")
public class PaystubController {
	
	@Autowired
	public PaystubService service;
	
	@GetMapping("/paystubList")
	public void listGet(int eno, Model model) {
		log.info("급여 명세서 목록 페이지로 이동합니다.");
		
		//MemberVo member=(MemberVo)session.getAttribute("login");
		List<PaystubListVO> list = service.list(eno);
		
		model.addAttribute("paystubList", list);
		
	}
	
	@GetMapping("/paystubForm")
	public void FormGet(int year, int month, int eno, Model model) {
		log.info("급여 명세서 페이지로 이동합니다.");
		
		PaystubVO vo = service.get(year, month, eno);
		
		int real_amount = 0;
		int totalWages = 0;
		int totalTaxs = 0;
		
		DecimalFormat formatter = new DecimalFormat("###,###");
		
		ObjectMapper objectMapper = new ObjectMapper();
		Map<String, Object> result = objectMapper.convertValue(vo, Map.class);
		
		Iterator<String> keys = result.keySet().iterator();
		while(keys.hasNext()) {
			String strKey = keys.next();
			
			if(!(result.get(strKey) instanceof Integer)) {
				String strValue = (String)result.get(strKey);
				log.info(strKey + " " + strValue);
				
				
				if(strValue.indexOf(":") != -1) {
					String[] strSpl = strValue.split(":");	
					
					if(strSpl.length > 1) {
						log.info(strSpl[0] + " " + Integer.parseInt(strSpl[1]));
							
						if(strSpl[0].equals("wage")) {
							totalWages += Integer.parseInt(strSpl[1]);
							//formatter.format(Integer.parseInt(strSpl[1])).toString();
							log.info("comma : " + formatter.format(Integer.parseInt(strSpl[1])).toString());
							result.put(strKey, formatter.format(Integer.parseInt(strSpl[1])).toString());
						}
						
						if(strSpl[0].equals("tax")) {
							totalTaxs += Integer.parseInt(strSpl[1]);
							log.info("comma : " + formatter.format(Integer.parseInt(strSpl[1])).toString());
							result.put(strKey, formatter.format(Integer.parseInt(strSpl[1])).toString());
						}
					}		
				}
			}		
	
		}
		
		real_amount = totalWages - totalTaxs;
		log.info("실수령액 : " + real_amount + " 지급총액 : " + totalWages + " 공제총액 : " + totalTaxs);
		
		vo.setReal_amount(real_amount);
		vo.setTotalWages(totalWages);
		vo.setTotalTaxs(totalTaxs);
		
		result.put("real_amount", formatter.format(real_amount).toString());
		result.put("totalWages", formatter.format(totalWages).toString());
		result.put("totalTaxs", formatter.format(totalTaxs).toString());
		
		model.addAttribute("paystubVO", result);
	}
	
	@GetMapping("/paystubInsertForm")
	public void insertGet() {
		log.info("급여명세서 삽입 페이지 요청");
		
	}
}
