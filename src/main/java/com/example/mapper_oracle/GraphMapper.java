package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CostVO;
import com.example.domain.DayVO;

public interface GraphMapper {
   public List<DayVO> dailyYearList();

   public List<DayVO> dailyList(String date);

   public List<DayVO> dailyMonthList(String date);

   public List<CostVO> costList(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public HashMap<String, Object> salesTotalView(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public HashMap<String, Object> refundTotalView(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public HashMap<String, Object> costTotalView(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<HashMap<String, Object>> salesAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<HashMap<String, Object>> refundAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public List<HashMap<String, Object>> salesCategoryAmountList(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<HashMap<String, Object>> refundCategoryAmountList(@Param("date") String date, @Param("companyCode") String companyCode);
   public HashMap<String, Object> salesTotalAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   public HashMap<String, Object> refundTotalAmount(@Param("date") String date, @Param("companyCode") String companyCode);
   public HashMap<String, Object> costTotalAmount(@Param("date") String date, @Param("companyCode") String companyCode);
     public List<HashMap<String, Object>> dataList(@Param("date") String date, @Param("companyCode") String companyCode);
     public List<HashMap<String, Object>> dataLists(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<HashMap<String, Object>> categoryList(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public List<HashMap<String, Object>> mainDailyYearList(String companyCode);
   public List<HashMap<String, Object>> mainDailyMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
   public List<Integer> mainYearList(String companyCode);
   public List<Integer> mainMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
}