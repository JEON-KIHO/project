package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.DayVO;
import com.example.domain.DepositVO;
import com.example.domain.LoansVO;

public interface ReadMapper {
	public List<DayVO> salesData(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<DayVO> refundData(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<DayVO> costData(@Param("date") String date, @Param("companyCode") String companyCode);
//	public DayVO invenData(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<DepositVO> depositData(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<LoansVO> loansData(@Param("date") String date, @Param("companyCode") String companyCode);
	
	public List<HashMap<String, Object>> readSales(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String ,Object>> readRefund(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> readCost(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> readDeposit(@Param("date") String date, @Param("companyCode") String companyCode);
	public List<HashMap<String, Object>> readLoans(@Param("date") String date, @Param("companyCode") String companyCode);
//	public List<HashMap<String, Object>> readInven(@Param("date") String date, @Param("companyCode") String companyCode);
}
