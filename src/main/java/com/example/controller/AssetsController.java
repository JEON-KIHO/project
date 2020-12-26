package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.AdminVO;
import com.example.domain.DayVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansVO;
import com.example.mapper_oracle.DepositMapper;
import com.example.mapper_oracle.LoansMapper;
import com.example.mapper_oracle.TotalMapper;

@Controller
public class AssetsController {
   @Autowired
   DepositMapper Dmapper;
   
   @Autowired
   LoansMapper Lmapper;
   
   @Autowired
   TotalMapper Tmapper;
   
   
   //deposit예금
   @RequestMapping("/assets")
   public String list(Model model, HttpSession session){
     String companyCode = (String) session.getAttribute("companyCode");
      model.addAttribute("Dlist", Dmapper.Dlist(companyCode));
      model.addAttribute("Llist", Lmapper.Llist(companyCode));
      return "assets";
   }
   
   @RequestMapping("depositassets")
   public void depositassets(Model model, String depositAccountCode){
      model.addAttribute("vo", Dmapper.depositassets(depositAccountCode));
   }
   
   @RequestMapping("depositassetsread")
   @ResponseBody
   public List<DepositVO> read(Model model, String depositAccountCode, String date){
      String strDate = date.substring(2);
        String year = strDate.split("/")[0];
        String month = strDate.split("/")[1];
        date = year +"/"+ month;
      
      model.addAttribute("depositassetsread", Dmapper.depositassetsread(depositAccountCode, date));

      return Dmapper.depositassetsread(depositAccountCode, date);
   }

   
   @RequestMapping("depositpercent.json")
   @ResponseBody
   public List<ArrayList<Object>> depositpercen(HttpSession session, HttpServletRequest request){
      String companyCode = (String)session.getAttribute("companyCode");
      List<HashMap<String, Object>> array = Dmapper.depositpercent(companyCode);
      
      List<ArrayList<Object>> listArr = new ArrayList<>();
      ArrayList<Object> arr = new ArrayList<>();
      arr.add("계좌번호:은행명" );
      arr.add("잔액");
      listArr.add(arr);
      
      for(HashMap<String, Object> map:array) {
         arr = new ArrayList<>();
         arr.add(map.get("DEPOSITACCOUNTCODE") + ":" + map.get("DEPOSITACCOUNTBANKNAME"));
         arr.add(map.get("DEPOSITPERCENT"));
         listArr.add(arr);
      }
      
      return listArr;
   }
   
   @RequestMapping("depositpercent")
   public void depositpercent(){
      
   }
   
   @RequestMapping("DEYearList.json")
   @ResponseBody
   public List<Integer> DEYearListJson(Model model, HttpSession session, String depositAccountCode) {
      String companyCode = (String) session.getAttribute("companyCode");
        model.addAttribute("DEYearList", Dmapper.DEYearList(depositAccountCode, companyCode));
     return Dmapper.DEYearList(companyCode, depositAccountCode);
   }
   
   @RequestMapping("DEMonthList.json")
   @ResponseBody
   public List<Integer> DEMonthListJson(Model model, HttpSession session, String year, String depositAccountCode) {
      year = year.substring(2);
      String companyCode = (String) session.getAttribute("companyCode");
      model.addAttribute("DEMonthList", Dmapper.DEMonthList(year, companyCode, depositAccountCode));
      return Dmapper.DEMonthList(year, companyCode, depositAccountCode);
   }
   
   @RequestMapping("DEdailyYearList.json")
   @ResponseBody
   public List<HashMap<String, Object>> dailyYearJson(HttpSession session, String depositAccountCode) {
      String companyCode = (String) session.getAttribute("companyCode");
      List<HashMap<String, Object>> array = Dmapper.DEdailyYearList(depositAccountCode, companyCode);
      List<HashMap<String, Object>> listArr = new ArrayList<>();
      
      for(int i = 0; i < array.size(); i++) {
      
         HashMap<String, Object> y = new HashMap<>();
         y.put("year", "20" + array.get(i).get("YEAR"));
         listArr.add(y);
      }
      return listArr;
   }
   
   @RequestMapping("DEdailyMonthList.json")
   @ResponseBody
   public List<HashMap<String, Object>> dailyMonthJson(HttpSession session, String year, String depositAccountCode) {
      year = year.substring(2);
//      String companyCode = (String) session.getAttribute("companyCode");
      String companyCode = "347-88-00867";
      List<HashMap<String, Object>> array = Dmapper.DEdailyMonthList(year, companyCode, depositAccountCode);
      List<HashMap<String, Object>> listArr = new ArrayList<>();
      for(int i = 0; i < array.size(); i++) {
         HashMap<String, Object> y = new HashMap<>();
         y.put("month", array.get(i).get("MONTH"));
         listArr.add(y);
      }
      return listArr;
   }
   
   
   //loans대출
   @RequestMapping("loanspercent.json")
   @ResponseBody
   public List<ArrayList<Object>> loanspercen(HttpSession session, HttpServletRequest request){
      String companyCode = (String)session.getAttribute("companyCode");
      List<HashMap<String, Object>> array = Lmapper.loanspercent(companyCode);
      
      List<ArrayList<Object>> listArr = new ArrayList<>();
      ArrayList<Object> arr = new ArrayList<>();
      arr.add("계좌번호:은행명");
      arr.add("잔액");
      listArr.add(arr);
      
      for(HashMap<String, Object> map:array) {
         arr = new ArrayList<>();
         arr.add(map.get("LOANSACCOUNTCODE") + ":" + map.get("LOANSACCOUNTBANKNAME"));
         arr.add(map.get("LOANSPERCENT"));
         listArr.add(arr);
      }
      
      return listArr;
   }
   
   @RequestMapping("loanspercent")
   public void loanspercent(){
      
   }
   
   @RequestMapping("loansassets")
   public void loansassets(Model model, String loansAccountCode){
      model.addAttribute("vo", Lmapper.loansassets(loansAccountCode));
   }
   
   @RequestMapping("loansassetsread")
   @ResponseBody
   public List<LoansVO> loansread(Model model, String loansAccountCode, String date){
      String strDate = date.substring(2);
        String year = strDate.split("/")[0];
        String month = strDate.split("/")[1];
        date = year +"/"+ month;
      
      model.addAttribute("loansassetsread", Lmapper.loansassetsread(loansAccountCode, date));

      return Lmapper.loansassetsread(loansAccountCode, date);
   }
   

   @RequestMapping("LOYearList.json")
    @ResponseBody
    public List<Integer> LOYearListJson(Model model, HttpSession session, String loansAccountCode) {
      String companyCode = (String) session.getAttribute("companyCode");
         model.addAttribute("LOYearList", Lmapper.LOYearList(loansAccountCode, companyCode));
      return Lmapper.LOYearList(companyCode, loansAccountCode);
    }
    
    @RequestMapping("LOMonthList.json")
    @ResponseBody
    public List<Integer> LOMonthListJson(Model model, HttpSession session, String year, String loansAccountCode) {
       year = year.substring(2);
       String companyCode = (String) session.getAttribute("companyCode");
       model.addAttribute("LOMonthList", Lmapper.LOMonthList(year, companyCode, loansAccountCode));
       return Lmapper.LOMonthList(year, companyCode, loansAccountCode);
    }
    
    @RequestMapping("LOdailyYearList.json")
    @ResponseBody
    public List<HashMap<String, Object>> lodailyYearJson(HttpSession session, String loansAccountCode) {
       String companyCode = (String) session.getAttribute("companyCode");
       List<HashMap<String, Object>> array = Lmapper.LOdailyYearList(loansAccountCode, companyCode);
       List<HashMap<String, Object>> listArr = new ArrayList<>();
       
       for(int i = 0; i < array.size(); i++) {
       
          HashMap<String, Object> y = new HashMap<>();
          y.put("year", "20" + array.get(i).get("YEAR"));
          listArr.add(y);
       }
       return listArr;
    }
    
    @RequestMapping("LOdailyMonthList.json")
    @ResponseBody
    public List<HashMap<String, Object>> lodailyMonthJson(HttpSession session, String year, String loansAccountCode) {
       year = year.substring(2);
       String companyCode = (String) session.getAttribute("companyCode");
       List<HashMap<String, Object>> array = Lmapper.LOdailyMonthList(year, companyCode, loansAccountCode);
       List<HashMap<String, Object>> listArr = new ArrayList<>();
       for(int i = 0; i < array.size(); i++) {
          HashMap<String, Object> y = new HashMap<>();
          y.put("month", array.get(i).get("MONTH"));
          listArr.add(y);
       }
       return listArr;
    }
   
//total
    @RequestMapping("total.json")
    @ResponseBody
    public List<ArrayList<Object>> total(HttpSession session){
       String companyCode = (String) session.getAttribute("companyCode");
         
       List<HashMap<String, Object>> Darray = Dmapper.depositTotal(companyCode);
       List<HashMap<String, Object>> Larray = Lmapper.loansTotal(companyCode);
       
       List<ArrayList<Object>> listArr = new ArrayList<>();
       ArrayList<Object> arr = new ArrayList<>();
       
       arr.add("이름");
       arr.add("예금");
       arr.add("대출");
       
       listArr.add(arr);
       
       for(int i = 0; i<Darray.size(); i++){
          arr = new ArrayList<>();
          arr.add(Darray.get(i).get("총액"));
          arr.add(Darray.get(i).get("ENDBALANCE"));
          arr.add(Larray.get(i).get("ENDBALANCE"));
          listArr.add(arr);
          
       }
       
       return listArr;
    }
 
}