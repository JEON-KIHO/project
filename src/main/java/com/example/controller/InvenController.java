package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.DayVO;
import com.example.mapper_oracle.InvenMapper;

@Controller
public class InvenController {
	
	@Autowired
	InvenMapper mapper;
	
	@RequestMapping("invenList")
	public void invenList() {
	}
	
	@RequestMapping("invenDailyYear.json")
	@ResponseBody
	public List<DayVO> invenDailyYearJson(HttpSession session) {
		String companyCode = "347-88-00867";
		List<DayVO> array = mapper.invenDailyYearList(companyCode);
		return array;
	}
	
	@RequestMapping("invenDailyMonth.json")
	@ResponseBody
	public List<DayVO> invenDailyMonthJson(String date, HttpSession session) {
		String companyCode = "347-88-00867";
		String year = date.substring(2);
		List<DayVO> array = mapper.invenDailyMonthList(year, companyCode);
		return array;
	}
	
	@RequestMapping("invenDaily.json")
	@ResponseBody
	public List<DayVO> invenDailyJson(String date, HttpSession session) {
		String companyCode = "347-88-00867";
		String year = date.split("/")[0].substring(2);
		String month = date.split("/")[1];
		date = year+"/"+month;
		List<DayVO> array = mapper.invenDailyList(date, companyCode);
		return array;
	}

	@ResponseBody
	@RequestMapping("invenList.json")
	public List<HashMap<String, Object>> invenListJson(String date, HttpSession session) {
		String companyCode = "347-88-00867";
		String year = date.split("/")[0].substring(2);
		String month = date.split("/")[1];
		String day = date.split("/")[2];
		if(day.length() == 1) {
			day = "0" + day;
		}
		String strDate = year +"/"+ month +"/"+ day;
		List<HashMap<String, Object>> array = mapper.invenList(strDate, companyCode);
		return array;
	}
	
	@RequestMapping("endInvenList.json")
	@ResponseBody
	public List<HashMap<String, Object>> endInvenListJson(HttpSession session) {
		String companyCode = "347-88-00867";
		return mapper.endInvenList(companyCode);
	}
}
