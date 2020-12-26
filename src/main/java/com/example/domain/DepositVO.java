package com.example.domain;

public class DepositVO extends DepositAccountVO{
   private String deposit_companyCode;
   private String deposit_day;
   private String deposit_depositAccountCode;
   private String depositType;
   private double depositAmount;
   private double depositBalance;
   
   public String getDeposit_companyCode() {
      return deposit_companyCode;
   }
   public void setDeposit_companyCode(String deposit_companyCode) {
      this.deposit_companyCode = deposit_companyCode;
   }
   public String getDeposit_day() {
      return deposit_day;
   }
   public void setDeposit_day(String deposit_day) {
      this.deposit_day = deposit_day;
   }
   public String getDeposit_depositAccountCode() {
      return deposit_depositAccountCode;
   }
   public void setDeposit_depositAccountCode(String deposit_depositAccountCode) {
      this.deposit_depositAccountCode = deposit_depositAccountCode;
   }
   public String getDepositType() {
      return depositType;
   }
   public void setDepositType(String depositType) {
      this.depositType = depositType;
   }
   public double getDepositAmount() {
      return depositAmount;
   }
   public void setDepositAmount(double depositAmount) {
      this.depositAmount = depositAmount;
   }
   public double getDepositBalance() {
      return depositBalance;
   }
   public void setDepositBalance(double depositBalance) {
      this.depositBalance = depositBalance;
   }
   @Override
   public String toString() {
      return "DepositVO [deposit_companyCode=" + deposit_companyCode + ", deposit_day=" + deposit_day
            + ", deposit_depositAccountCode=" + deposit_depositAccountCode + ", depositType=" + depositType
            + ", depositAmount=" + depositAmount + ", depositBalance=" + depositBalance + "]";
   }
   
}