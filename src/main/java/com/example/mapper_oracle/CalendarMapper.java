package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.CostVO;
import com.example.domain.DayVO;

public interface CalendarMapper {
//	public void insert(@Param("date") String date, @Param("wom") int wom);
//	
//	public List<HashMap<String, Object>> dataList(String date);
//	
//	public List<DayVO> dailyYearList();
//	
//	public List<DayVO> dailyMonthList(String date);
//	
//	public List<DayVO> dailyList(String date);
//	
//	public List<CostVO> costList(String date);
//	
//	public List<CostVO> costGraphList(String date);
//	
//	public List<HashMap<String, Object>> salesCategoryCount();
	
	public List<HashMap<String, Object>> salesCategoryPayType(@Param("date")String date, @Param("payType") String payType, @Param("lCategory") String lCategory);
	
	public List<HashMap<String, Object>> refundCategoryPayType(@Param("date")String date, @Param("payType") String payType, @Param("lCategory") String lCategory);
	
	public List<HashMap<String, Object>> lcategorylist(String companyCode);
	
	public HashMap<String, Object> salesThisMonthlyTotal(@Param("date") String date, @Param("companyCode") String companycode);
	
	public HashMap<String, Object> refundThisMonthlyTotal(@Param("date") String date, @Param("companyCode") String companycode);
	
	public HashMap<String, Object> costThisMonthlyTotal(@Param("date") String date, @Param("companyCode") String companycode);
}
