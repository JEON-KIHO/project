package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mapper_oracle.AdminMapper;
import com.example.mapper_oracle.CostMapper;
import com.example.mapper_oracle.GraphMapper;
import com.example.mapper_oracle.SalesMapper;
import com.example.service.AdminService;

@Controller
public class SController {
   @Autowired
   AdminMapper aMapper;
   @Autowired
   GraphMapper gMapper;
   @Autowired
   CostMapper cMapper;
   @Autowired
   SalesMapper sMapper;
   
   @Autowired
   AdminService service;


    //카드,현금,기타별 총금액
      @RequestMapping("payTypeList.json")
      @ResponseBody
      public List<HashMap<String, Object>> payTypeList(String date,HttpSession session){
         String companyCode=(String) session.getAttribute("companyCode");
         String  strDate = date.substring(2);
         String year = strDate.split("/")[0];
         String month = strDate.split("/")[1];
         String day = strDate.split("/")[2];
         date = year +"/"+ month +"/"+ day;
         List<HashMap<String,Object>> sArray=gMapper.salesAmount(strDate, companyCode);
         List<HashMap<String,Object>> rArray=gMapper.refundAmount(strDate, companyCode);
         HashMap<String,Object> cMap=gMapper.costTotalView(strDate, companyCode);
         
         List<HashMap<String, Object>> list = new ArrayList<>();
         for(HashMap<String, Object> map : sArray) {
            list.add(map);
         }
         
         for(HashMap<String, Object> map : rArray) {
            list.add(map);
         }
         HashMap<String, Object> map = new HashMap<>();
         map.put("COSTTOTAL", cMap.get("COSTTOTAL"));
         list.add(map);
         
         return list;
      }
      
      
   //환불 매출그래프   
      @RequestMapping("costrefundList.json")
      @ResponseBody
      public List<ArrayList<Object>> costrefundList(String date,HttpSession session) {
         String companyCode=(String) session.getAttribute("companyCode");
         String strDate = date.substring(2);
         String year = strDate.split("/")[0];
         String month = strDate.split("/")[1];
         String day = strDate.split("/")[2];
         date = year +"/"+ month +"/"+ day;
         HashMap<String,Object> sMap=gMapper.salesTotalView(date, companyCode);
         HashMap<String,Object> rMap=gMapper.refundTotalView(date, companyCode);
         
         List<ArrayList<Object>> listArr=new ArrayList<>();
         ArrayList<Object> arr=new ArrayList<>();
         arr.add("");
         arr.add("매출");
         arr.add("환불");
         listArr.add(arr);
         
         arr = new ArrayList<>();
         arr.add("합계");
         arr.add(sMap.get("SALESTOTAL"));
         arr.add(rMap.get("REFUNDTOTAL"));
         listArr.add(arr);
         
         return listArr;
      }
   //달렷 그래프
   @RequestMapping("GraphList.json")
   @ResponseBody
   public List<ArrayList<Object>> GraphList(String date,HttpSession session) {
      String companyCode=(String) session.getAttribute("companyCode");
      String strDate = date.substring(2);
      String year = strDate.split("/")[0];
      String month = strDate.split("/")[1];
      String day = strDate.split("/")[2];
      date = year +"/"+ month +"/"+ day;
      HashMap<String,Object> sMap=gMapper.salesTotalView(date, companyCode);
      HashMap<String,Object> rMap=gMapper.refundTotalView(date, companyCode);
      HashMap<String,Object> cMap=gMapper.costTotalView(date, companyCode);
      
      List<ArrayList<Object>> listArr=new ArrayList<>();
      ArrayList<Object> arr=new ArrayList<>();
      arr.add(" ");
      arr.add("매출");
      arr.add("환불");
      arr.add("비용");
      listArr.add(arr);
      
      arr = new ArrayList<>();
      arr.add(" ");
      arr.add(sMap.get("SALESTOTAL"));
      arr.add(rMap.get("REFUNDTOTAL"));
      arr.add(cMap.get("COSTTOTAL"));
      listArr.add(arr);
      
      return listArr;
   }

   @RequestMapping("salesCategoryAmountList.json")
   @ResponseBody
   public List<ArrayList<Object>> salesCategoryAmountListJson(String date,HttpSession session) {
      String companyCode =(String) session.getAttribute("companyCode");
      date = date.substring(2);
      List<HashMap<String, Object>> array = gMapper.salesCategoryAmountList(date, companyCode);
      
      List<ArrayList<Object>> listArr=new ArrayList<>();
      ArrayList<Object> arr=new ArrayList<>();
      for(HashMap<String, Object> map:array) {
         arr=new ArrayList<>();
         arr.add(map.get("LCATEGORY"));
         arr.add(map.get("SALESAMOUNT"));
         listArr.add(arr);
      }
      return listArr;
   }
   
   @RequestMapping("refundCategoryAmountList.json")
   @ResponseBody
   public List<ArrayList<Object>> refundCategoryAmountListJson(String date,HttpSession session) {
      String companyCode =(String) session.getAttribute("companyCode");
      date = date.substring(2);
      List<HashMap<String, Object>> array = gMapper.refundCategoryAmountList(date, companyCode);
      
      List<ArrayList<Object>> listArr=new ArrayList<>();
      ArrayList<Object> arr=new ArrayList<>();
      System.out.println(array.size());
      for(HashMap<String, Object> map:array) {
         arr=new ArrayList<>();
         arr.add(map.get("LCATEGORY"));
         arr.add(map.get("REFUNDAMOUNT"));
         listArr.add(arr);
      }
      return listArr;
   }
   
   @RequestMapping("salesTotalAmount.json")
   @ResponseBody
   public HashMap<String, Object> salesTotalAmountJson(String date,HttpSession session) {
      String companyCode =(String) session.getAttribute("companyCode");
      date = date.substring(2);
      return gMapper.salesTotalAmount(date, companyCode);
   }
   
   @RequestMapping("refundTotalAmount.json")
   @ResponseBody
   public HashMap<String, Object> refundTotalAmountJson(String date,HttpSession session) {
      String companyCode =(String) session.getAttribute("companyCode");
      date = date.substring(2);
      return gMapper.refundTotalAmount(date, companyCode);
   }
   
   @RequestMapping("costTotalAmount")
   @ResponseBody
   public HashMap<String, Object> costTotalAmountJson(String date,HttpSession session) {
      String companyCode =(String) session.getAttribute("companyCode");
      date = date.substring(2);
      return gMapper.costTotalAmount(date, companyCode);
   }

   @RequestMapping("categoryList.json")
   @ResponseBody
   public List<ArrayList<Object>> categoryListJson(String date,HttpSession session) {
      String companyCode = (String) session.getAttribute("companyCode");
      List<HashMap<String, Object>> cList = gMapper.categoryList(date, companyCode);
      List<HashMap<String, Object>> scArray = gMapper.salesCategoryAmountList(date, companyCode);
      List<HashMap<String, Object>> rcArray = gMapper.refundCategoryAmountList(date, companyCode);
      
      List<ArrayList<Object>> listArr=new ArrayList<>();
      ArrayList<Object> arr=new ArrayList<>();
      arr.add("대분류");
      arr.add("매출액");
      arr.add("환불액");
      listArr.add(arr);
      for(int i = 0; i < cList.size(); i++) {
         int scnt = 0;
         int rcnt = 0;
         arr=new ArrayList<>();
         String LC = (String) cList.get(i).get("LCATEGORY");
         arr.add(cList.get(i).get("LCATEGORY"));
         
         for(int sc = 0; sc < scArray.size(); sc++) {
            String SLC = (String) scArray.get(sc).get("LCATEGORY");
            if(LC.equals(SLC)) {
               arr.add(scArray.get(sc).get("SALESAMOUNT"));
               scnt++;
            }
         }
         if(scnt==0) {
             arr.add(0);
          }
         
         for(int rc = 0; rc < rcArray.size(); rc++) {
            String RLC = (String) rcArray.get(rc).get("LCATEGORY");
            if(LC.equals(RLC)) {
               arr.add(rcArray.get(rc).get("REFUNDAMOUNT"));
               rcnt++;
            }
         }
         if(rcnt==0) {
             arr.add(0);
          }
         
         if(arr.size() > 1) {
            listArr.add(arr);    
         }
      }
      return listArr;
   }
    @RequestMapping("dataLists.json")
      @ResponseBody
      public List<HashMap<String, Object>> dataListsJson(String date,HttpSession session) {
        String companyCode=(String) session.getAttribute("companyCode");
         String strDate = date.substring(2);
         String year = strDate.split("/")[0];
         String month = strDate.split("/")[1];
         String day = strDate.split("/")[2];
         date = year +"/"+ month+"/"+day;
         
         return gMapper.dataLists(date,companyCode);
      }
    
    @RequestMapping("readTarget.json")
    @ResponseBody
    public int readTargetJson(String date,HttpSession session) {
       date = date.substring(2);
       String companyCode = (String) session.getAttribute("companyCode");
       return aMapper.readTarget(date, companyCode);
    }

    @RequestMapping("mainDailyYearList.json")
 	@ResponseBody
 	public List<HashMap<String, Object>> mainDailyYearJson(HttpSession session) {
    	String companyCode=(String) session.getAttribute("companyCode");
 		List<HashMap<String, Object>> array = gMapper.mainDailyYearList(companyCode);
 		List<HashMap<String, Object>> listArr = new ArrayList<>();
 		for(int i = 0; i < array.size(); i++) {
 			HashMap<String, Object> y = new HashMap<>();
 			y.put("year", "20" + array.get(i).get("YEAR"));
 			listArr.add(y);
 		}
 		return listArr;
 	}
 	
 	@RequestMapping("mainDailyMonthList.json")
 	@ResponseBody
 	public List<HashMap<String, Object>> mainDailyMonthJson(HttpSession session, String year) {
 		year = year.substring(2);
 		String companyCode=(String) session.getAttribute("companyCode");
 		List<HashMap<String, Object>> array = gMapper.mainDailyMonthList(year, companyCode);
 		List<HashMap<String, Object>> listArr = new ArrayList<>();
 		for(int i = 0; i < array.size(); i++) {
 			HashMap<String, Object> y = new HashMap<>();
 			y.put("month", array.get(i).get("MONTH"));
 			listArr.add(y);
 		}
 		return listArr;
 	}
 	
 	@RequestMapping("mainYearList.json")
 	@ResponseBody
 	public List<Integer> mainYearListJson(HttpSession session) {
 		String companyCode=(String) session.getAttribute("companyCode");
 		return gMapper.mainYearList(companyCode);
 	}
 	
 	@RequestMapping("mainMonthList.json")
 	@ResponseBody
 	public List<Integer> mainMonthListJson(HttpSession session, String year) {
 		year = year.substring(2);
 		String companyCode=(String) session.getAttribute("companyCode");
 		return gMapper.mainMonthList(year, companyCode);
 	}
 	
 	@RequestMapping("mainMonthlyAmount.json")
 	@ResponseBody
 	public int mainMonthlyAmountJson(HttpSession session, String date) {
 		int amount = 0;
 		date = date.substring(2);
 		String companyCode=(String) session.getAttribute("companyCode");
 		int costAmount =cMapper.monthlyCostListMain(date, companyCode);
 		int salesAmount = sMapper.salesAmount(date, companyCode);
 		int refundAmount = sMapper.refundAmount(date, companyCode);
 		amount = costAmount + salesAmount + refundAmount;
 		amount = amount/6;
 		return amount;
 	}
   
}