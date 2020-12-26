package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.DayVO;

public interface InvenMapper {
	public List<HashMap<String, Object>> invenList(@Param("date") String date, @Param("companyCode") String companyCode);
	
	public List<DayVO> invenDailyYearList(String companyCode);
	
	public List<DayVO> invenDailyMonthList(@Param("date") String date, @Param("companyCode") String companyCode);
	
	public List<DayVO> invenDailyList(@Param("date") String date, @Param("companyCode") String companyCode);
	
	public List<HashMap<String, Object>> endInvenList(String companyCode);
}
