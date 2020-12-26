package com.example.domain;

public class LoansVO extends LoansAccountVO{
   private String loans_companyCode;
   private String loans_loansAccountCode;
   private String loans_repaymentDay;
   private double loansAmount;
   private double loansBalance;
   
   public String getLoans_companyCode() {
      return loans_companyCode;
   }
   public void setLoans_companyCode(String loans_companyCode) {
      this.loans_companyCode = loans_companyCode;
   }
   public String getLoans_loansAccountCode() {
      return loans_loansAccountCode;
   }
   public void setLoans_loansAccountCode(String loans_loansAccountCode) {
      this.loans_loansAccountCode = loans_loansAccountCode;
   }
   public String getLoans_repaymentDay() {
      return loans_repaymentDay;
   }
   public void setLoans_repaymentDay(String loans_repaymentDay) {
      this.loans_repaymentDay = loans_repaymentDay;
   }
   public double getLoansAmount() {
      return loansAmount;
   }
   public void setLoansAmount(double loansAmount) {
      this.loansAmount = loansAmount;
   }
   public double getLoansBalance() {
      return loansBalance;
   }
   public void setLoansBalance(double loansBalance) {
      this.loansBalance = loansBalance;
   }
   @Override
   public String toString() {
      return "LoansVO [loans_companyCode=" + loans_companyCode + ", loans_loansAccountCode=" + loans_loansAccountCode
            + ", loans_repaymentDay=" + loans_repaymentDay + ", loansAmount=" + loansAmount + ", loansBalance="
            + loansBalance + "]";
   }
   
   
}