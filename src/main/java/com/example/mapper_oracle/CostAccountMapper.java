package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import com.example.domain.CostVO;

public interface CostAccountMapper {

   public List<HashMap<String, Object>> costaccountlist();
   public void costinsert(CostVO vo);
}