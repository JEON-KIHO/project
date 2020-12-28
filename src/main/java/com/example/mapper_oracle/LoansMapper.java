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
   
   public List<Integer> LOYearList(@Param("companyCode")String companyCode, @Param("loansAccountCode")String loansAccountCode);
     
   public List<Integer> LOMonthList(@Param("companyCode") String companyCode, @Param("year") String year,  @Param("loansAccountCode")String loansAccountCode);
   
   public List<HashMap<String, Object>> LOdailyYearList(@Param("companyCode")String companyCode, @Param("loansAccountCode")String loansAccountCode);
    
   public List<HashMap<String, Object>> LOdailyMonthList(@Param("year") String year, @Param("companyCode") String companyCode, @Param("loansAccountCode")String loansAccountCode);
}