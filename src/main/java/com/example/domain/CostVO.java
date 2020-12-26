package com.example.domain;

public class CostVO {
   private String day;
   private String companyCode;
   private double costAmount;
   private String costAccountName;
   public String getDay() {
      return day;
   }
   public void setDay(String day) {
      this.day = day;
   }
   public String getCompanyCode() {
      return companyCode;
   }
   public void setCompanyCode(String companyCode) {
      this.companyCode = companyCode;
   }
   public double getCostAmount() {
      return costAmount;
   }
   public void setCostAmount(double costAmount) {
      this.costAmount = costAmount;
   }
   public String getCostAccountName() {
      return costAccountName;
   }
   public void setCostAccountName(String costAccountName) {
      this.costAccountName = costAccountName;
   }
   
}