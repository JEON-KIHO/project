package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.DayVO;
import com.example.domain.SalesVO;

public interface SalesMapper {

   public List<HashMap<String, Object>> salesCategoryCount(String companyCode);
   
   
   
   public List<HashMap<String, Object>> salesPayTypeList(@Param("date") String date, @Param("companyCode") String companycode, @Param("payType") String payType, @Param("lCategory") String lCategory);
   public List<HashMap<String, Object>> salesMCategoryList(@Param("date") String date, @Param("companyCode") String companycode, @Param("mCategory") String mCategory, @Param("lCategory") String lCategory);
   public List<HashMap<String, Object>> salesSubTotalList(@Param("date") String date, @Param("companyCode") String companycode, @Param("lCategory") String lCategory);
   public List<HashMap<String, Object>> salesPayTypeTotalList(@Param("date") String date, @Param("companyCode") String companycode, @Param("payType") String payType);
   public List<HashMap<String, Object>> salesLCategoryTotalList(@Param("date") String date, @Param("companyCode") String companycode, @Param("lCategory") String lCategory);
   public int salesAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   public int refundAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<HashMap<String, Object>> SRdailyYearList(String companyCode);
   public List<HashMap<String, Object>> SRdailyMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
   public List<Integer> SRYearList(String companyCode);
   public List<Integer> SRMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
   
   public void salesinsert(SalesVO vo);
   public List<SalesVO> saleslist(String companyCode);
   public void salesdelete(@Param ("companyCode") String companyCode, @Param("sales_day") String sales_day, @Param("paytype") String paytype);
}

