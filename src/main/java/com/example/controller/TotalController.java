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
import com.example.mapper_oracle.TotalMapper;

@Controller
public class TotalController {

	@Autowired
	TotalMapper mapper;
	
	@RequestMapping("totalYearList.json")
	@ResponseBody
	public List<DayVO> totalYearListJson(HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		return mapper.totalYearList(companyCode);
	}
	
	@RequestMapping("totalMonthList.json")
	@ResponseBody
	public List<DayVO> totalMonthListJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		return mapper.totalMonthList(year, companyCode);
	}
	
	@RequestMapping("salesMonthlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> salesMonthlyAmountJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> sArray = mapper.salesMonthlyAmount(year, companyCode);
		return sArray;
	}
	
	@RequestMapping("refundMonthlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> refundMonthlyAmountJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		return mapper.refundMonthlyAmount(year, companyCode);
	}
	
	@RequestMapping("costMonthlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> costMonthlyAmountJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		return mapper.costMonthlyAmount(year, companyCode);
	}
	
	@RequestMapping("totalMonthlyAmount.json")
	@ResponseBody
	public List<ArrayList<Object>> totalMonthlyAmountJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> sArray = mapper.salesMonthlyAmount(year, companyCode);
		List<HashMap<String, Object>> rArray = mapper.refundMonthlyAmount(year, companyCode);
		List<HashMap<String, Object>> cArray = mapper.costMonthlyAmount(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("날짜");
		arr.add("매출");
		arr.add("환불");
		arr.add("비용");
		listArr.add(arr);
		
		for(int i = 0; i < sArray.size(); i++) {
			arr = new ArrayList<>();
			arr.add(sArray.get(i).get("MONTH") + "월");
			arr.add(sArray.get(i).get("SALESAMOUNT"));
			arr.add(rArray.get(i).get("REFUNDAMOUNT"));
			arr.add(cArray.get(i).get("COSTAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("salesYearlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> salesYearlyAmountJson(HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		return mapper.salesYearlyAmount(companyCode);
	}
	
	@RequestMapping("refundYearlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> refundYearlyAmountJson(HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		return mapper.refundYearlyAmount(companyCode);
	}
	
	@RequestMapping("costYearlyAmount.json")
	@ResponseBody
	public List<HashMap<String, Object>> costYearlyAmountJson(HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		return mapper.costYearlyAmount(companyCode);
	}
	
	@RequestMapping("totalYearlyAmount.json")
	@ResponseBody
	public List<ArrayList<Object>> totalYearlyAmounJson(HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		List<HashMap<String, Object>> sArray = mapper.salesYearlyAmount(companyCode);
		List<HashMap<String, Object>> rArray = mapper.refundYearlyAmount(companyCode);
		List<HashMap<String, Object>> cArray = mapper.costYearlyAmount(companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("날짜");
		arr.add("매출");
		arr.add("환불");
		arr.add("비용");
		listArr.add(arr);
		
		for(int i = 0; i < sArray.size(); i++) {
			arr = new ArrayList<>();
			arr.add("20" + sArray.get(i).get("YEAR") + "년");
			arr.add(sArray.get(i).get("SALESAMOUNT"));
			arr.add(rArray.get(i).get("REFUNDAMOUNT"));
			arr.add(cArray.get(i).get("COSTAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("salesYearlyPayTypeList.json")
	@ResponseBody
	public List<ArrayList<Object>> salesYearlyPayTypeListJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> sArray = mapper.salesYearlyPayTypeList(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("결제타입");
		arr.add("금액");
		listArr.add(arr);
		
		arr = new ArrayList<>();
		for(int i = 0; i < sArray.size(); i++) {
			arr = new ArrayList<>();
			arr.add(sArray.get(i).get("PAYTYPE"));
			arr.add(sArray.get(i).get("SALESAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("refundYearlyPayTypeList.json")
	@ResponseBody
	public List<ArrayList<Object>> refundYearlyPayTypeListJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> rArray = mapper.refundYearlyPayTypeList(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("결제타입");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < rArray.size(); i++) {
			arr = new ArrayList<>();
			arr.add(rArray.get(i).get("PAYTYPE"));
			arr.add(rArray.get(i).get("REFUNDAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("salesMonthlyPayTypeList.json")
	@ResponseBody
	public List<ArrayList<Object>> salesMonthlyPayTypeListJson(String year, String month, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> array = mapper.salesMonthlyPayTypeList(year, month, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("결제타입");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("PAYTYPE"));
			arr.add(array.get(i).get("SALESAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("refundMonthlyPayTypeList.json")
	@ResponseBody
	public List<ArrayList<Object>> refundMonthlyPayTypeListJson(String year, String month, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> array = mapper.refundMonthlyPayTypeList(year, month, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("결제타입");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("PAYTYPE"));
			arr.add(array.get(i).get("REFUNDAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("salesYearlyCategoryList.json")
	@ResponseBody
	public List<ArrayList<Object>> salesYearlyCategoryListJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> array = mapper.salesYearlyCategoryList(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("상품");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("LCATEGORY"));
			arr.add(array.get(i).get("SALESAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("refundYearlyCategoryList.json")
	@ResponseBody
	public List<ArrayList<Object>> refundYearlyCategoryListJson(String year, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		year = year.substring(2);
		List<HashMap<String, Object>> array = mapper.refundYearlyCategoryList(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("상품");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("LCATEGORY"));
			arr.add(array.get(i).get("REFUNDAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("refundMonthlyCategoryList.json")
	@ResponseBody
	public List<ArrayList<Object>> refundMonthlyCategoryListJson(String date, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		date = date.substring(2);
		List<HashMap<String, Object>> array = mapper.refundMonthlyCategoryList(date, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("상품");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("LCATEGORY"));
			arr.add(array.get(i).get("REFUNDAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("totalMonthlyBalance.json")
	@ResponseBody
	public List<ArrayList<Object>> depositYearlyBalanceJsonJson(String year, HttpSession session) {
		year = year.substring(2);
		String companyCode = (String) session.getAttribute("companyCode");
		List<HashMap<String, Object>> dArray = mapper.depositMonthlyBalance(year, companyCode);
		List<HashMap<String, Object>> lArray = mapper.loansMonthlyBalance(year, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("날짜");
		arr.add("예금");
		arr.add("대출");
		listArr.add(arr);
		
		for(int i = 0; i < dArray.size(); i++) {
			arr = new ArrayList<>();
			arr.add(dArray.get(i).get("MONTH") + "월");
			arr.add(dArray.get(i).get("ENDBALANCE"));
			arr.add(lArray.get(i).get("LOANSBALANCE"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("salesMonthlyCategoryList.json")
	@ResponseBody
	public List<ArrayList<Object>> salesMonthlyCategoryListJson(String date, HttpSession session) {
		String companyCode = (String) session.getAttribute("companyCode");
		date = date.substring(2);
		List<HashMap<String, Object>> array = mapper.salesMonthlyCategoryList(date, companyCode);
		
		List<ArrayList<Object>> listArr = new ArrayList<>();
		ArrayList<Object> arr = new ArrayList<>();
		arr.add("상품");
		arr.add("금액");
		listArr.add(arr);
		
		for(int i = 0; i < array.size(); i++) {
			arr = new ArrayList<>();
			arr.add(array.get(i).get("LCATEGORY"));
			arr.add(array.get(i).get("SALESAMOUNT"));
			listArr.add(arr);
		}
		
		return listArr;
	}
	
	@RequestMapping("total")
	public void total() {
	}
	
//	@RequestMapping("main")
//	public void main() {
//	}
}
