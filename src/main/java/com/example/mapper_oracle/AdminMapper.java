package com.example.mapper_oracle;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.AdminVO;

public interface AdminMapper {
   public List<AdminVO> list();

   public AdminVO read(String adminId);

   public void insert(AdminVO vo);

//   public int idCheck(String adminId);
    public void pwUpdate(AdminVO vo);
   
    public int readTarget(@Param("date") String date, @Param("companyCode") String companyCode);
    public void pwUpdate(@Param("adminPassword") String adminPassword, @Param("companyCode") String companyCode,@Param("adminId") String adminId);
}