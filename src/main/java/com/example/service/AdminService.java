package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.mapper_oracle.ProductMapper;
@Service
public class AdminService {
   @Autowired
   ProductMapper mapper;

   public int idCheck(String adminId) {
      
      return 0;
   }
 

}