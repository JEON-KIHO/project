package com.example.domain;

public class DepositAccountVO {
   private String depositAccountCode;
   private String depositAccountBankName;
   private String depositAccountName;
   private double depositAccountRate;
   private String depositAccount_startday;
   private double depositAccountAmount;
   
   public String getDepositAccountCode() {
      return depositAccountCode;
   }
   public void setDepositAccountCode(String depositAccountCode) {
      this.depositAccountCode = depositAccountCode;
   }
   public String getDepositAccountBankName() {
      return depositAccountBankName;
   }
   public void setDepositAccountBankName(String depositAccountBankName) {
      this.depositAccountBankName = depositAccountBankName;
   }
   public String getDepositAccountName() {
      return depositAccountName;
   }
   public void setDepositAccountName(String depositAccountName) {
      this.depositAccountName = depositAccountName;
   }
   public double getDepositAccountRate() {
      return depositAccountRate;
   }
   public void setDepositAccountRate(double depositAccountRate) {
      this.depositAccountRate = depositAccountRate;
   }
   public String getDepositAccount_startday() {
      return depositAccount_startday;
   }
   public void setDepositAccount_startday(String depositAccount_startday) {
      this.depositAccount_startday = depositAccount_startday;
   }
   public double getDepositAccountAmount() {
      return depositAccountAmount;
   }
   public void setDepositAccountAmount(double depositAccountAmount) {
      this.depositAccountAmount = depositAccountAmount;
   }
   @Override
   public String toString() {
      return "DepositAccountVO [depositAccountCode=" + depositAccountCode + ", depositAccountBankName="
            + depositAccountBankName + ", depositAccountName=" + depositAccountName + ", depositAccountRate="
            + depositAccountRate + ", depositAccount_startday=" + depositAccount_startday
            + ", depositAccountAmount=" + depositAccountAmount + "]";
   }
   
}