package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.LoansVO;

public interface LoansMapper {

   public List<LoansVO> Llist(String companyCode);
   
   public List<HashMap<String, Object>> loanspercent(String companyCode);
   
   public List<HashMap<String, Object>> loansTotal(String companyCode);

   public LoansVO loansassets(String loansAccountCode);
   
   public List<LoansVO> loansassetsread(@Param("loansAccountCode")String loansAccountCode, @Param("date")String date);
   
   public List<Integer> LOYearList(@Param("loansAccountCode")String loansAccountCode, @Param("companyCode")String companyCode);
     
   public List<Integer> LOMonthList(@Param("year") String year, @Param("companyCode") String companyCode, @Param("loansAccountCode")String loansAccountCode);
   
   public List<HashMap<String, Object>> LOdailyYearList(@Param("loansAccountCode")String loansAccountCode, @Param("companyCode")String companyCode);
    
   public List<HashMap<String, Object>> LOdailyMonthList(@Param("year") String year, @Param("companyCode") String companyCode, @Param("loansAccountCode")String loansAccountCode);
}