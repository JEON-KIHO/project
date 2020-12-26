package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.DayVO;

public interface TotalMapper {
	public List<DayVO> totalYearList(String companyCode);
	public List<DayVO> totalMonthList(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> salesMonthlyAmount(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> refundMonthlyAmount(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> costMonthlyAmount(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> salesYearlyAmount(String companyCode);
	public List<HashMap<String, Object>> refundYearlyAmount(String companyCode);
	public List<HashMap<String, Object>> costYearlyAmount(String companyCode);
	public List<HashMap<String, Object>> salesYearlyPayTypeList(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> refundYearlyPayTypeList(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> salesMonthlyPayTypeList(@Param("year") String year, @Param("month") String month, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> refundMonthlyPayTypeList(@Param("year") String year, @Param("month") String month, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> salesYearlyCategoryList(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> refundYearlyCategoryList(@Param("year") String year, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> salesMonthlyCategoryList(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> refundMonthlyCategoryList(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> depositMonthlyBalance(@Param("year") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> loansMonthlyBalance(@Param("year") String date, @Param("companyCode") String companyCode);
}
