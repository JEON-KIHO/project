package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.DayVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansVO;
import com.example.domain.SalesVO;
import com.example.mapper_oracle.ReadMapper;

@Controller
public class ReadController {

	@Autowired
	ReadMapper mapper;
	
	@RequestMapping("readData")
	public void read() {
	}	
	
	@RequestMapping("salesData.json")
	@ResponseBody
	public List<DayVO> salesDataJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		List<DayVO> list = mapper.salesData(date, companyCode);
		List<DayVO> array = new ArrayList<>();
		for(DayVO vo:list) {
			String strDate = vo.getDay().substring(0, 10);
			String year = strDate.split("-")[0];
			String month = strDate.split("-")[1];
			String day = strDate.split("-")[2];
			date = year +"/"+ month +"/"+ day;
			vo.setDay(date);
			array.add(vo);
		}
		return array;
	}
	
	@RequestMapping("refundData.json")
	@ResponseBody
	public List<DayVO> refundDataJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		List<DayVO> list = mapper.refundData(date, companyCode);
		List<DayVO> array = new ArrayList<>();
		for(DayVO vo:list) {
			String strDate = vo.getDay().substring(0, 10);
			String year = strDate.split("-")[0];
			String month = strDate.split("-")[1];
			String day = strDate.split("-")[2];
			date = year +"/"+ month +"/"+ day;
			vo.setDay(date);
			array.add(vo);
		}
		return array;
	}
	
	@RequestMapping("costData.json")
	@ResponseBody
	public List<DayVO> costDataJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		List<DayVO> list = mapper.costData(date, companyCode);
		List<DayVO> array = new ArrayList<>();
		for(DayVO vo:list) {
			String strDate = vo.getDay().substring(0, 10);
			String year = strDate.split("-")[0];
			String month = strDate.split("-")[1];
			String day = strDate.split("-")[2];
			date = year +"/"+ month +"/"+ day;
			vo.setDay(date);
			array.add(vo);
		}
		return array;
	}
	
//	@RequestMapping("invenData.json")
//	@ResponseBody
//	public DayVO invenDataJson(String date) {
//		date = date.substring(2);
//		String companyCode = "347-88-00867";
//		DayVO vo  = mapper.invenData(date, companyCode);
//			String strDate = vo.getDay().substring(0, 10);
//			String year = strDate.split("-")[0];
//			String month = strDate.split("-")[1];
//			String day = strDate.split("-")[2];
//			date = year +"/"+ month +"/"+ day;
//			vo.setDay(date);
//		return vo;
//	}
	
	@RequestMapping("depositData.json")
	@ResponseBody
	public List<DepositVO> depositDataJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		List<DepositVO> list  = mapper.depositData(date, companyCode);
		List<DepositVO> array = new ArrayList<>();
		for(DepositVO vo:list) {
			String strDate = vo.getDeposit_day().substring(0, 10);
			String year = strDate.split("-")[0];
			String month = strDate.split("-")[1];
			String day = strDate.split("-")[2];
			date = year +"/"+ month +"/"+ day;
			vo.setDeposit_day(date);
			array.add(vo);
		}
		return array;
	}
	
	@RequestMapping("loansData.json")
	@ResponseBody
	public List<LoansVO> loansDataJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		List<LoansVO> list  = mapper.loansData(date, companyCode);
		List<LoansVO> array = new ArrayList<>();
		for(LoansVO vo:list) {
			String strDate = vo.getLoans_repaymentDay().substring(0, 10);
			String year = strDate.split("-")[0];
			String month = strDate.split("-")[1];
			String day = strDate.split("-")[2];
			date = year +"/"+ month +"/"+ day;
			vo.setLoans_repaymentDay(date);
			array.add(vo);
		}
		return array;
	}
	
	@RequestMapping("readSales.json")
	@ResponseBody
	public List<HashMap<String, Object>> readSalesJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		return mapper.readSales(date, companyCode);
	}
	
	@RequestMapping("readRefund.json")
	@ResponseBody
	public List<HashMap<String, Object>> readRefundJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		return mapper.readRefund(date, companyCode);
	}
	
	@RequestMapping("readCost.json")
	@ResponseBody
	public List<HashMap<String, Object>> readCostJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		return mapper.readCost(date, companyCode);
	}
	
//	@RequestMapping("readInven.json")
//	@ResponseBody
//	public List<HashMap<String, Object>> readInvenJson(String date) {
//		date = date.substring(2);
//		String companyCode = "347-88-00867";
//		return mapper.readInven(date, companyCode);
//	}
	
	@RequestMapping("readDeposit.json")
	@ResponseBody
	public List<HashMap<String, Object>> readDepositJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		return mapper.readDeposit(date, companyCode);
	}
	
	@RequestMapping("readLoans.json")
	@ResponseBody
	public List<HashMap<String, Object>> readLoansJson(String date) {
		date = date.substring(2);
		String companyCode = "347-88-00867";
		return mapper.readLoans(date, companyCode);
	}
}
