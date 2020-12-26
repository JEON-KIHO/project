package com.example.domain;

public class LoansAccountVO {
   private String loansAccountCode;
   private String loansAccountBankName;
   private String loansAccountName;
   private double loansAccountRate;
   private double loansAccountAmount;
   private String loansAccount_startDay;
   private String loansAccount_endDay;
   
   
   public String getLoansAccountCode() {
      return loansAccountCode;
   }
   public void setLoansAccountCode(String loansAccountCode) {
      this.loansAccountCode = loansAccountCode;
   }
   public String getLoansAccountBankName() {
      return loansAccountBankName;
   }
   public void setLoansAccountBankName(String loansAccountBankName) {
      this.loansAccountBankName = loansAccountBankName;
   }
   public String getLoansAccountName() {
      return loansAccountName;
   }
   public void setLoansAccountName(String loansAccountName) {
      this.loansAccountName = loansAccountName;
   }
   public double getLoansAccountRate() {
      return loansAccountRate;
   }
   public void setLoansAccountRate(double loansAccountRate) {
      this.loansAccountRate = loansAccountRate;
   }
   public double getLoansAccountAmount() {
      return loansAccountAmount;
   }
   public void setLoansAccountAmount(double loansAccountAmount) {
      this.loansAccountAmount = loansAccountAmount;
   }
   public String getLoansAccount_startDay() {
      return loansAccount_startDay;
   }
   public void setLoansAccount_startDay(String loansAccount_startDay) {
      this.loansAccount_startDay = loansAccount_startDay;
   }
   public String getLoansAccount_endDay() {
      return loansAccount_endDay;
   }
   public void setLoansAccount_endDay(String loansAccount_endDay) {
      this.loansAccount_endDay = loansAccount_endDay;
   }
   @Override
   public String toString() {
      return "LoansaccountVO [loansAccountCode=" + loansAccountCode + ", loansAccountBankName=" + loansAccountBankName
            + ", loansAccountName=" + loansAccountName + ", loansAccountRate=" + loansAccountRate
            + ", loansAccountAmount=" + loansAccountAmount + ", loansAccount_startDay=" + loansAccount_startDay
            + ", loansAccount_endDay=" + loansAccount_endDay + "]";
   }
   
   
   
}