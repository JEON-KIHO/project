package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CostVO;
import com.example.domain.DayVO;

public interface CostMapper {
   public void insert(@Param("date") String date, @Param("wom") int wom);
   
   public List<HashMap<String, Object>> dataList(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public List<HashMap<String, Object>> costDailyYearList(String companyCode);
   
   public List<HashMap<String, Object>> costDailyMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
   
   public List<DayVO> dailyList(String date);
   
   public List<CostVO> costList(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public HashMap<String, Object> monthlyCostList(@Param("date") String date, @Param("companyCode") String companyCode);
   public int monthlyCostListMain(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public List<CostVO> costGraphList(@Param("date") String date, @Param("companyCode") String companyCode);
   
   public List<HashMap<String, Object>> salesCategoryCount(String companyCode);
   
   public List<Integer> costYearList(String companyCode);
   public List<Integer> costMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
   
   public List<HashMap<String, Object>> readInven(@Param("date") String date, @Param("companyCode") String companyCode);
   public List<DayVO> invenData(@Param("date") String date, @Param("companyCode") String companyCode);
}