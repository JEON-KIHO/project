package com.example.domain;

import java.util.ArrayList;
import java.util.Date;

public class AdminVO {
   private String companyCode;
   private String companyName;
   private String companyType;
   private String companyCorporate;
   private String companyAddress;
   private String companyCEO;
   private String adminId;
   private String adminPassword;
   private String openDate;
   private String logoImage;
   public String getCompanyCode() {
      return companyCode;
   }
   public void setCompanyCode(String companyCode) {
      this.companyCode = companyCode;
   }
   public String getCompanyName() {
      return companyName;
   }
   public void setCompanyName(String companyName) {
      this.companyName = companyName;
   }
   public String getCompanyType() {
      return companyType;
   }
   public void setCompanyType(String companyType) {
      this.companyType = companyType;
   }
   public String getCompanyCorporate() {
      return companyCorporate;
   }
   public void setCompanyCorporate(String companyCorporate) {
      this.companyCorporate = companyCorporate;
   }
   public String getCompanyAddress() {
      return companyAddress;
   }
   public void setCompanyAddress(String companyAddress) {
      this.companyAddress = companyAddress;
   }
   public String getCompanyCEO() {
      return companyCEO;
   }
   public void setCompanyCEO(String companyCEO) {
      this.companyCEO = companyCEO;
   }
   public String getAdminId() {
      return adminId;
   }
   public void setAdminId(String adminId) {
      this.adminId = adminId;
   }
   public String getAdminPassword() {
      return adminPassword;
   }
   public void setAdminPassword(String adminPassword) {
      this.adminPassword = adminPassword;
   }
   public String getOpenDate() {
      return openDate;
   }
   public void setOpenDate(String openDate) {
      this.openDate = openDate;
   }
   public String getLogoImage() {
      return logoImage;
   }
   public void setLogoImage(String logoImage) {
      this.logoImage = logoImage;
   }
   @Override
   public String toString() {
      return "ProductVO [companyCode=" + companyCode + ", companyName=" + companyName + ", companyType=" + companyType
            + ", companyCorporate=" + companyCorporate + ", companyAddress=" + companyAddress + ", companyCEO="
            + companyCEO + ", adminId=" + adminId + ", adminPassword=" + adminPassword + ", openDate=" + openDate
            + ", logoImage=" + logoImage + "]";
   }
   
   
   
}