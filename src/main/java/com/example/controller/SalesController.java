package com.example.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper_oracle.CostMapper;
import com.example.mapper_oracle.SalesMapper;
import com.example.mapper_oracle.TMLMapper;


@Controller
public class SalesController {
   
   @Autowired
   SalesMapper salesMapper;
   
   @Autowired
   CostMapper costMapper;
   
   @Autowired
   TMLMapper TMLMapper;
   
   @RequestMapping("salesList")
   public void salesList() {
   }
   
      @RequestMapping("salesCategoryCount.json")
      @ResponseBody
      public List<HashMap<String, Object>> salesCategoryCountJson(HttpSession session) {
    	  String companyCode = (String) session.getAttribute("companyCode");
         
         return salesMapper.salesCategoryCount(companyCode);
      }

         @RequestMapping("salesPayTypeList.json")
         @ResponseBody
         public List<ArrayList<Object>> salesPayTypeListJson(HttpSession session, String date, String payType, String lCategory) {
        	 String companyCode = (String) session.getAttribute("companyCode");
        	 date = date.substring(2);
        	 
        	 List<HashMap<String, Object>> array = salesMapper.salesPayTypeList(date, companyCode, payType, lCategory);
        	 ArrayList<String> sArray = new ArrayList<String>(Arrays.asList("매출", "환불"));
        	 List<ArrayList<Object>> listArr = new ArrayList<>(); 
             ArrayList<Object> arr = new ArrayList<>();
             arr.add("유형");
             arr.add("매출");
             arr.add("환불");
             listArr.add(arr);
             
            	 arr = new ArrayList<>();
            	 arr.add(payType);
            	 if(sArray.size() == array.size()) {
            		 for(int i = 0; i < sArray.size(); i++) {
            			 arr.add(array.get(i).get("SALESAMOUNT"));
            		 }
            	 }
            	 
            	 if(sArray.size()-1 == array.size()) {
            		 if(array.get(array.size()-1).get("SALESTYPE") == sArray.get(array.size()-1)) {
            			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
            			 arr.add(0);
            		 }
            		 if(array.get(array.size()-1).get("SALESTYPE") != sArray.get(array.size()-1)) {
            			 arr.add(0);
            			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
            		 }
            	 }
            	 
            	 if(sArray.size()-2 == array.size()) {
            		 arr.add(0);
            		 arr.add(0);
            	 }
            	 
            	 listArr.add(arr);
            	 
             return listArr;
         }
         
         
         @RequestMapping("salesMCategoryList.json")
         @ResponseBody
         public List<ArrayList<Object>> salesMCategoryListJson(HttpSession session, String date, String mCategory, String lCategory) {
        	 String companyCode = (String) session.getAttribute("companyCode");
        	 date = date.substring(2);
        	 
        	 List<HashMap<String, Object>> array = salesMapper.salesMCategoryList(date, companyCode, mCategory, lCategory);
        	 ArrayList<String> sArray = new ArrayList<String>(Arrays.asList("매출", "환불"));
        	 List<ArrayList<Object>> listArr = new ArrayList<>(); 
             ArrayList<Object> arr = new ArrayList<>();
             arr.add("유형");
             arr.add("매출");
             arr.add("환불");
             listArr.add(arr);
             
            	 arr = new ArrayList<>();
            	 arr.add(mCategory);
            	 if(sArray.size() == array.size()) {
            		 for(int i = 0; i < sArray.size(); i++) {
            			 arr.add(array.get(i).get("SALESAMOUNT"));
            		 }
            	 }
            	 
            	 if(sArray.size()-1 == array.size()) {
            		 if(array.get(array.size()-1).get("SALESTYPE") == sArray.get(array.size()-1)) {
            			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
            			 arr.add(0);
            		 }
            		 if(array.get(array.size()-1).get("SALESTYPE") != sArray.get(array.size()-1)) {
            			 arr.add(0);
            			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
            		 }
            	 }
            	 
            	 if(sArray.size()-2 == array.size()) {
            		 arr.add(0);
            		 arr.add(0);
            	 }
            	 
            	 listArr.add(arr);
            	 
             return listArr;

         }
         
         @RequestMapping("salesSubTotalList.json")
         @ResponseBody
         public List<ArrayList<Object>> salesSubTotalListJson(HttpSession session, String date, String lCategory) {
        	 String companyCode = (String) session.getAttribute("companyCode");
        	date = date.substring(2);
        	
        	List<HashMap<String, Object>> array = salesMapper.salesSubTotalList(date, companyCode, lCategory);
        	ArrayList<String> sArray = new ArrayList<String>(Arrays.asList("매출", "환불"));
       	 	List<ArrayList<Object>> listArr = new ArrayList<>(); 
            ArrayList<Object> arr = new ArrayList<>();
            arr.add("유형");
            arr.add("매출");
            arr.add("환불");
            listArr.add(arr);
            
           	 arr = new ArrayList<>();
           	 arr.add(lCategory);
           	 if(sArray.size() == array.size()) {
           		 for(int i = 0; i < sArray.size(); i++) {
           			 arr.add(array.get(i).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-1 == array.size()) {
           		 if(array.get(array.size()-1).get("SALESTYPE") == sArray.get(array.size()-1)) {
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           			 arr.add(0);
           		 }
           		 if(array.get(array.size()-1).get("SALESTYPE") != sArray.get(array.size()-1)) {
           			 arr.add(0);
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-2 == array.size()) {
           		 arr.add(0);
           		 arr.add(0);
           	 }
           	 
           	 listArr.add(arr);
           	 
            return listArr;
         }
         
         
         @RequestMapping("salesPayTypeTotalList.json")
         @ResponseBody
         public List<ArrayList<Object>> salesPayTypeTotalListKson(HttpSession session, String date, String payType) {
        	 String companyCode = (String) session.getAttribute("companyCode");
         	date = date.substring(2);
        	 
         	List<HashMap<String, Object>> array = salesMapper.salesPayTypeTotalList(date, companyCode, payType);
         	ArrayList<String> sArray = new ArrayList<String>(Arrays.asList("매출", "환불"));
       	 	List<ArrayList<Object>> listArr = new ArrayList<>(); 
            ArrayList<Object> arr = new ArrayList<>();
            arr.add("유형");
            arr.add("매출");
            arr.add("환불");
            listArr.add(arr);
            
           	 arr = new ArrayList<>();
           	 arr.add(payType);
           	 if(sArray.size() == array.size()) {
           		 for(int i = 0; i < sArray.size(); i++) {
           			 arr.add(array.get(i).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-1 == array.size()) {
           		 if(array.get(array.size()-1).get("SALESTYPE") == sArray.get(array.size()-1)) {
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           			 arr.add(0);
           		 }
           		 if(array.get(array.size()-1).get("SALESTYPE") != sArray.get(array.size()-1)) {
           			 arr.add(0);
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-2 == array.size()) {
           		 arr.add(0);
           		 arr.add(0);
           	 }
           	 
           	 listArr.add(arr);
           	 
            return listArr;
         }
         
         @RequestMapping("salesLCategoryTotalList.json")
         @ResponseBody
         public List<ArrayList<Object>> salesLCategoryTotalListKson(HttpSession session, String date, String lCategory) {
        	 String companyCode = (String) session.getAttribute("companyCode");
         	date = date.substring(2);
        	 
         	List<HashMap<String, Object>> array = salesMapper.salesLCategoryTotalList(date, companyCode, lCategory);
         	ArrayList<String> sArray = new ArrayList<String>(Arrays.asList("매출", "환불"));
       	 	List<ArrayList<Object>> listArr = new ArrayList<>(); 
            ArrayList<Object> arr = new ArrayList<>();
            arr.add("유형");
            arr.add("매출");
            arr.add("환불");
            listArr.add(arr);
            
           	 arr = new ArrayList<>();
           	 arr.add(lCategory);
           	 if(sArray.size() == array.size()) {
           		 for(int i = 0; i < sArray.size(); i++) {
           			 arr.add(array.get(i).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-1 == array.size()) {
           		 if(array.get(array.size()-1).get("SALESTYPE") == sArray.get(array.size()-1)) {
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           			 arr.add(0);
           		 }
           		 if(array.get(array.size()-1).get("SALESTYPE") != sArray.get(array.size()-1)) {
           			 arr.add(0);
           			 arr.add(array.get(array.size()-1).get("SALESAMOUNT"));
           		 }
           	 }
           	 
           	 if(sArray.size()-2 == array.size()) {
           		 arr.add(0);
           		 arr.add(0);
           	 }
           	 
           	 listArr.add(arr);
           	 
            return listArr;
         }
         
         @RequestMapping("monthlyTotalAmount.json")
         @ResponseBody
         public int monthlyTotalAmountJson(String date, HttpSession session) {
        	 String companyCode = (String) session.getAttribute("companyCode");
          	date = date.substring(2);
        	 int salesAmount = salesMapper.salesAmount(date, companyCode);
        	 int refundAmount = salesMapper.refundAmount(date, companyCode);
        	 int amount = 0;
        	 if(salesAmount >= refundAmount) {
        		 amount = salesAmount;
        	 }
        	 if(salesAmount <= refundAmount) {
        		 amount = refundAmount;
        	 }
        	 return amount;
         }
         
         @RequestMapping("thisMonthList.json")
         @ResponseBody
         public List<HashMap<String, Object>> thisMonthListJson(HttpSession session) {
        	 GregorianCalendar cal = new GregorianCalendar();
        	 String thisYear = cal.get(GregorianCalendar.YEAR)-1+"";
        	 String thisMonth = cal.get(GregorianCalendar.MONTH)+1+"";
        	 String date = thisYear +"/"+ "12";
        	 String companyCode = (String) session.getAttribute("companyCode");
           	date = date.substring(2);
        	 int salesAmount = salesMapper.salesAmount(date, companyCode);
        	 int refundAmount = salesMapper.refundAmount(date, companyCode);
        	 HashMap<String, Object> cMap = costMapper.monthlyCostList(date, companyCode);
        	 List<HashMap<String, Object>> tMap = TMLMapper.targetList(date, companyCode);
        	 HashMap<String, Object> map = new HashMap<>();
        	 List<HashMap<String, Object>> array = new ArrayList<>();
        	 map.put("date", date);
        	 map.put("salesAmount", salesAmount);
        	 map.put("refundAmount", refundAmount);
        	 map.put("costAmount", cMap.get("COSTAMOUNT"));
        	 for(HashMap<String, Object> m:tMap) {
        		 map.put("targetSales", m.get("TARGETSALES"));
        		 map.put("targetCost", m.get("TARGETCOST"));
        	 }
        	 
        	 int year = Integer.parseInt(date.split("/")[0]);
        	 int month = Integer.parseInt(date.split("/")[1]);
        	 if(month > 01 && month < 12) {
        		 month--;
        		 if(month <= 9) {
        			 for(int i = 1; i <= 9; i++) {
            			 if(month == i) {
            				 String strYear = year+"";
            				 String strMonth = "0" + i;
            				 date = strYear+"/"+strMonth;
            			 }
            		 }
        		 }
        		 if(month >= 10) {
        			 date = year+"/"+month;
        		 }
        	 }
        	 else if(month == 12) {
        		 month--;
        		 date = year+"/"+month;
        	 }
        	 else if(month == 01) {
        		 year = year - 1;
        		 month = 12;
        		 date = year+"/"+month;
        	 }
        	 int lastSalesAmount = salesMapper.salesAmount(date, companyCode);
        	 int lastRefundAmount = salesMapper.refundAmount(date, companyCode);
        	 HashMap<String, Object> lastcMap = costMapper.monthlyCostList(date, companyCode);
        	 if(lastSalesAmount != 0 && lastRefundAmount != 0 && lastcMap != null) {
        		 map.put("lastSalesAmount", lastSalesAmount);
            	 map.put("lastRefundAmount", lastRefundAmount);
            	 map.put("lastCostAmount", lastcMap.get("COSTAMOUNT"));
            	 array.add(map);
        	 }
        	 
        	 return array;
         }
         
         @RequestMapping("SRdailyYearList.json")
     	@ResponseBody
     	public List<HashMap<String, Object>> dailyYearJson(HttpSession session) {
        	 String companyCode = (String) session.getAttribute("companyCode");
     		List<HashMap<String, Object>> array = salesMapper.SRdailyYearList(companyCode);
     		List<HashMap<String, Object>> listArr = new ArrayList<>();
     		for(int i = 0; i < array.size(); i++) {
     			HashMap<String, Object> y = new HashMap<>();
     			y.put("year", "20" + array.get(i).get("YEAR"));
     			listArr.add(y);
     		}
     		return listArr;
     	}
     	
     	@RequestMapping("SRdailyMonthList.json")
     	@ResponseBody
     	public List<HashMap<String, Object>> dailyMonthJson(HttpSession session, String year) {
     		year = year.substring(2);
     		String companyCode = (String) session.getAttribute("companyCode");
     		List<HashMap<String, Object>> array = salesMapper.SRdailyMonthList(year, companyCode);
     		List<HashMap<String, Object>> listArr = new ArrayList<>();
     		for(int i = 0; i < array.size(); i++) {
     			HashMap<String, Object> y = new HashMap<>();
     			y.put("month", array.get(i).get("MONTH"));
     			listArr.add(y);
     		}
     		return listArr;
     	}
     	
     	@RequestMapping("SRYearList.json")
     	@ResponseBody
     	public List<Integer> SRYearListJson(HttpSession session) {
     		String companyCode = "347-88-00867";
     		return salesMapper.SRYearList(companyCode);
     	}
     	
     	@RequestMapping("SRMonthList.json")
     	@ResponseBody
     	public List<Integer> SRMonthListJson(HttpSession session, String year) {
     		year = year.substring(2);
     		String companyCode = "347-88-00867";
     		return salesMapper.SRMonthList(year, companyCode);
     	}
     	
     	@RequestMapping("test")
     	public void test() {
     		
     	}
         
}