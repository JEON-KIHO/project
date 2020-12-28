package com.example.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.CategoryVO;
import com.example.domain.CostVO;
import com.example.domain.DepositAccountVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansVO;
import com.example.domain.LoansAccountVO;
import com.example.domain.SalesVO;
import com.example.mapper_oracle.CategoryMapper;
import com.example.mapper_oracle.CostAccountMapper;
import com.example.mapper_oracle.DepositAccountMapper;
import com.example.mapper_oracle.LoansAccountMapper;
import com.example.mapper_oracle.SalesMapper;
import com.example.service.DepositService;

import oracle.sql.DATE;

@Controller
public class CostAccountController {
   
   @Autowired
   CategoryMapper mapper;
   @Autowired
   CostAccountMapper cmapper;
   @Autowired
   DepositAccountMapper dmapper;
   @Autowired
   LoansAccountMapper lmapper;
   @Autowired
   SalesMapper smapper;
   @Autowired
   DepositService service;
   
    
   
      //대분류 카테고리 기초설정 insert
      @RequestMapping(value="categoryinsert", method=RequestMethod.POST)
      @ResponseBody
      public void categoryinsert(CategoryVO vo, HttpSession session) {
         String companyCode =(String)session.getAttribute("companyCode");
         String companyName =(String)session.getAttribute("companyName");
         String code=companyCode+"/"+vo.getCategorycode();
         String name=companyName+"/"+vo.getCategoryname();
         vo.setCategorycode(code);
         vo.setCategoryname(name);
         System.out.println(vo.getCategorycode());
         mapper.categoryinsert(vo);
      }
      
      //중분류 카테고리 기초설정 및 로그인 후 설정시 대분류 list 불러오기
      @RequestMapping("categorylist.json")
      @ResponseBody
      public List<HashMap<String, Object>> categorylist(HttpSession session) {
         
         String companyCode =(String)session.getAttribute("companyCode");
         List<HashMap<String, Object>> array = mapper.categorylist(companyCode);
         return array;
      }
      
      //예금 계정 기초설정 시 예금tab에 기초잔액 추가 transactional
      @RequestMapping(value="depositaccountinsert", method=RequestMethod.POST)
      @ResponseBody
      public void depositaccountinsert(DepositAccountVO vo){
         service.depositaccountinsert(vo);
      }
      
      //대출 계정 기초설정 시 대출tab에 기초잔액 추가 transactional
      @RequestMapping(value="loansaccountinsert", method=RequestMethod.POST)
      @ResponseBody
      public void loansaccountinsert(LoansAccountVO lvo){
         service.loansaccountinsert(lvo);
      }
      
      
   //비용 계정 insert시 리스트 출력   
   @RequestMapping("costaccount.json")
   @ResponseBody
   public List<HashMap<String, Object>> costaccount(){
      List<HashMap<String, Object>> array=cmapper.costaccountlist();
      return array;
   }
   
   
   //비용 입력 후 insert
   @RequestMapping(value="costinsert", method=RequestMethod.POST)
   @ResponseBody
   public void costinsert(CostVO vo) {
      if(vo.getDay() != null) {
         cmapper.costinsert(vo);
      }
   }
   
   //예금 계정 insert시 리스트 출력
   @RequestMapping("depositaccountlist.json")
   @ResponseBody
   public List<HashMap<String, Object>> depositlist(HttpSession session){
      
      String companyCode=(String)session.getAttribute("companyCode");
      List<HashMap<String, Object>> array=dmapper.depositaccountlist(companyCode);
      return array;
   }
   
   //예금 입력 후 insert
      @RequestMapping(value="depositinsert", method=RequestMethod.POST)
      public void depositinsert(DepositVO vo){
         service.depositinsert(vo);
      }
   
   //대출 계정 insert시 리스트 출력
   @RequestMapping("loansaccountlist.json")
   @ResponseBody
   public List<HashMap<String, Object>> loanslist(){
      List<HashMap<String, Object>> array=lmapper.loansaccountlist();
      return array;
   }
   
   //대출 입력 후 insert
   @RequestMapping(value="loansinsert", method=RequestMethod.POST)
   public void loansinsert(LoansVO vo){
      lmapper.loansinsert(vo);
   }
   
   //매출 환불 입력 및 로그인 후 설정 시 대분류 카테고리 리스트 출력
   @RequestMapping("lcategorylist.json")
   @ResponseBody
   public List<HashMap<String, Object>> lcategorylist(HttpSession session) {
   
      String companyCode=   (String)session.getAttribute("companyCode");
      List<HashMap<String, Object>> array = mapper.lcategorylist(companyCode);
      return array;
   }
   
   //매출 환불 입력 시 중분류 카테고리 리스트 출력
   @RequestMapping(value="categorylist", method=RequestMethod.POST)
   @ResponseBody
   public void categorylist(CategoryVO vo) {
      mapper.categoryinsert(vo);
   }
   
   //매출 환불 insert
   @RequestMapping(value="salesinsert", method=RequestMethod.POST)
   @ResponseBody
   public void salesinsert(SalesVO vo,HttpSession session){
      String companyCode=(String)session.getAttribute("companyCode");
      String sales_day="12-12-23";
      String paytype="매출";
      List<SalesVO> array=smapper.saleslist(companyCode);
      
      for(int i=0; array.size()>i; i++){
         ArrayList<String> date=new ArrayList<>();
         date.add(array.get(i).getDay().substring(2,11));
         System.out.println(array.get(i).getDay().substring(2,11));
         System.out.println(date.get(i).toString());
      }
         
         
//            if(vo.getSales_day().equals(map)|| vo.getSales_day()!=null) {
               smapper.salesdelete(companyCode, sales_day, paytype);
         
//      }
      smapper.salesinsert(vo);
   }
   
   
      //로그인 후 설정에서 대분류 read 후 update와 insert transactional
   @RequestMapping(value="categoryupdate", method=RequestMethod.POST)
      @ResponseBody
      public List<HashMap<String,Object>> categoryupdate(String categorycode, String categoryname,HttpSession session) {
//         (String)session.getAttribute("companyCode");
         String companyCode=(String)session.getAttribute("companyCode");
         String companyName=(String)session.getAttribute("companyName");
         categorycode=companyCode+"/"+categorycode+"/000";
         categoryname=companyName+"/"+categoryname+"/empty";
         
         CategoryVO vo=mapper.categoryread(categorycode, categoryname);
         CategoryVO newvo=new CategoryVO();
         newvo.setCategorycode(categorycode);
         newvo.setCategoryname(categoryname);
         if(vo!=null){
            if(vo.getCategorycode().equals(categorycode)&&!vo.getCategoryname().equals(categoryname)){
               mapper.categoryupdate(newvo);
            }
         }
         if(vo==null){
            mapper.categoryinsert(newvo);
            categorycode=categorycode.split("/")[1];
            categorycode=companyCode+"/"+categorycode+"/001";
            newvo.setCategorycode(categorycode);
            categoryname=categoryname.split("/")[1];
            categoryname=companyName+"/"+categoryname+"/";
            newvo.setCategoryname(categoryname);
            mapper.categoryinsert(newvo);
         }
         
         List<HashMap<String,Object>> newarray=mapper.lcategorylist(companyCode);//업댓 후 데이터
         
         return newarray;
      }
         
      //로그인 후 중분류 update 및 insert
            @RequestMapping(value="mcategoryupdate", method=RequestMethod.POST)
            @ResponseBody
            public List<HashMap<String,Object>> mcategoryupdate(String categorycode, String categoryname,HttpSession session) {
//               (String)session.getAttribute("companyCode");
               String companyCode=(String)session.getAttribute("companyCode");
               String companyName=(String)session.getAttribute("companyName");
               categoryname=companyName+"/"+categoryname;
               
               CategoryVO vo=mapper.categoryread(categorycode, categoryname);
               CategoryVO newvo=new CategoryVO();
               newvo.setCategorycode(categorycode);
               newvo.setCategoryname(categoryname);
               if(vo!=null){
                  if(vo.getCategorycode().equals(categorycode)&&!vo.getCategoryname().equals(categoryname)){
                     mapper.categoryupdate(newvo);
                  }
               }
               if(vo==null){
                  mapper.categoryinsert(newvo);
                  newvo.setCategorycode(categorycode);
               }
               
               List<HashMap<String,Object>> newarray=mapper.lcategorylist(companyCode);//업댓 후 데이터
               
               return newarray;
            }
      
      //로그인 후 설정에서 예금 리스트 read
      @RequestMapping("depositread.json")
      @ResponseBody
      public List<DepositAccountVO> depositread(HttpSession session) {
//         (String)session.getAttribute("companyCode");
         String companyCode="347-88-00867";
         List<DepositAccountVO> array=dmapper.depositread(companyCode);
         for(DepositAccountVO vo : array){
            String date=vo.getDepositAccount_startday().substring(0, 11);
            vo.setDepositAccount_startday(date);
         }
         return array;
      }
      
      //로그인 후 설정에서 대출 리스트 read
      @RequestMapping("loansread.json")
      @ResponseBody
      public List<LoansAccountVO> loansread(HttpSession session) {
//         (String)session.getAttribute("companyCode");
         String companyCode="153-60-00064";
         List<LoansAccountVO> larray=lmapper.loansread(companyCode);
         for(LoansAccountVO vo : larray){
            String start=vo.getLoansAccount_startDay().substring(0, 11);
            String end=vo.getLoansAccount_endDay().substring(0, 11);
            vo.setLoansAccount_endDay(end);
            vo.setLoansAccount_startDay(start);
         }
         return larray;
      }
   
   //계정기초등록
   @RequestMapping("category")
   public void category() {
      
   }
   //로그인 후 입력
   @RequestMapping("insert")
   public void insert(){
   }
   
   //로그인 후 설정
   @RequestMapping("categoryread")
   public void categoryread(){
      
   }
}