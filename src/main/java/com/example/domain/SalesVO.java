package com.example.domain;

public class SalesVO {
	private String companyCode;
	private String day;
	private String categoryName;
	private String payType;
	private int salesCount;
	private double SalesAmount;
	private String SalesType;
	public String getCompanyCode() {
		return companyCode;
	}
	public void setCompanyCode(String companyCode) {
		this.companyCode = companyCode;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getPayType() {
		return payType;
	}
	public void setPayType(String payType) {
		this.payType = payType;
	}
	public int getSalesCount() {
		return salesCount;
	}
	public void setSalesCount(int salesCount) {
		this.salesCount = salesCount;
	}
	public double getSalesAmount() {
		return SalesAmount;
	}
	public void setSalesAmount(double salesAmount) {
		SalesAmount = salesAmount;
	}
	public String getSalesType() {
		return SalesType;
	}
	public void setSalesType(String salesType) {
		SalesType = salesType;
	}
	
}
