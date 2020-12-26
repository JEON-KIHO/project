package com.example.domain;

public class InvenVO {
	private String inven_companyCode;
	private String inven_day;
	private String inven_invenAccountCode;
	private int startInven;
	private int invenIn;
	private int invenOut;
	private int endInven;
	public String getInven_companyCode() {
		return inven_companyCode;
	}
	public void setInven_companyCode(String inven_companyCode) {
		this.inven_companyCode = inven_companyCode;
	}
	public String getInven_day() {
		return inven_day;
	}
	public void setInven_day(String inven_day) {
		this.inven_day = inven_day;
	}
	public String getInven_invenAccountCode() {
		return inven_invenAccountCode;
	}
	public void setInven_invenAccountCode(String inven_invenAccountCode) {
		this.inven_invenAccountCode = inven_invenAccountCode;
	}
	public int getStartInven() {
		return startInven;
	}
	public void setStartInven(int startInven) {
		this.startInven = startInven;
	}
	public int getInvenIn() {
		return invenIn;
	}
	public void setInvenIn(int invenIn) {
		this.invenIn = invenIn;
	}
	public int getInvenOut() {
		return invenOut;
	}
	public void setInvenOut(int invenOut) {
		this.invenOut = invenOut;
	}
	public int getEndInven() {
		return endInven;
	}
	public void setEndInven(int endInven) {
		this.endInven = endInven;
	}
	@Override
	public String toString() {
		return "InvenVO [inven_companyCode=" + inven_companyCode + ", inven_day=" + inven_day
				+ ", inven_invenAccountCode=" + inven_invenAccountCode + ", startInven=" + startInven + ", invenIn="
				+ invenIn + ", invenOut=" + invenOut + ", endInven=" + endInven + "]";
	}
}
