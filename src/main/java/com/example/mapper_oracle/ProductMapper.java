package com.example.mapper_oracle;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AdminVO;

public interface ProductMapper {
   public void insert(AdminVO vo);
   public List<String> getlogoImage(String companyCode);
   public void insertImage(String logoImage);
   public void update(AdminVO vo);
   public void updateImage(@Param("companyCode") String companyCode,@Param("logoImage") String logoImage);
   public HashMap<String, String> companyJson();
   public List<AdminVO> list();
   public void insertInfo(AdminVO vo);
      public AdminVO read(String adminId);
      public int idCheck(String adminId);
}