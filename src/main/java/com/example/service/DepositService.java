package com.example.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.example.domain.CategoryVO;
import com.example.domain.DepositAccountVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansAccountVO;
import com.example.domain.LoansVO;
import com.example.mapper_oracle.CategoryMapper;
import com.example.mapper_oracle.DepositAccountMapper;
import com.example.mapper_oracle.LoansAccountMapper;

@Service
public class DepositService {
   @Autowired
   DepositAccountMapper mapper;
   @Autowired
   LoansAccountMapper lmapper;
   @Autowired
   CategoryMapper cmapper;
   
   
   //예금 등록 후 예금 계정의 기초잔액 변경
   @Transactional
   public void depositinsert(DepositVO vo) {
      mapper.depositinsert(vo);
      mapper.depositaccountupdate(vo.getDepositBalance(),vo.getDeposit_depositAccountCode());
   }
   
   //예금 계정 등록 후 예금 tab에 insert
   @Transactional
   public void depositaccountinsert(DepositAccountVO vo) {
	   System.out.println(vo.toString());
      mapper.depositaccountinsert(vo);
      DepositVO dvo=new DepositVO();
      dvo.setDeposit_companyCode("153-60-00064");
      dvo.setDeposit_day(vo.getDepositAccount_startday());
      dvo.setDeposit_depositAccountCode(vo.getDepositAccountCode());
      dvo.setDepositAccountAmount(0);
      dvo.setDepositBalance(vo.getDepositAccountAmount());
      dvo.setDepositType("입금");
      mapper.depositinsert(dvo);
      System.out.println(dvo.toString());
   }
   
   
   //대출 계정 등록 후 대출 tab에 insert
   @Transactional
   public void loansaccountinsert(LoansAccountVO vo) {
      lmapper.loansaccountinsert(vo);
      LoansVO lvo=new LoansVO();
      lvo.setLoans_companyCode("153-60-00064");
      lvo.setLoans_loansAccountCode(vo.getLoansAccountCode());
      lvo.setLoans_repaymentDay(vo.getLoansAccount_startDay());
      lvo.setLoansAmount(0);
      lvo.setLoansBalance(vo.getLoansAccountAmount());
      lmapper.loansinsert(lvo);
   }
   
   //대분류 및 중분류 카테고리 변경 or 추가시 update/insert
//   @Transactional
//   public void categoryupdate(CategoryVO vo){
//      String companyCode="153-60-00064";
//      String companyName="골드스탁";
//      List<HashMap<String, Object>> oldarray=cmapper.categorylist(companyCode);//원래 있던 데이터
//   
//      //대분류 수정
//      cmapper.categoryupdate(vo);
//      
//      //대분류 추가
//      cmapper.categoryinsert(vo);
//      List<HashMap<String, Object>> newarray=cmapper.categorylist(companyCode);
//      
//      
//      
//      //중분류 추가
//      String mcode="001";
//      vo.setCategorycode(vo.getCategorycode().substring(0,17)+mcode);
//      vo.setCategoryname(vo.getCategoryname().split("/")[0]+"/"+vo.getCategoryname().split("/")[1]+"/"+"");
//      cmapper.categoryinsert(vo);
//      
//      
//      }
}