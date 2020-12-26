package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface TMLMapper {
	public List<HashMap<String, Object>> targetList(@Param("date") String date, @Param("companyCode") String companyCode);
	
}
