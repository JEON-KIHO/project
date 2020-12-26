package com.example.domain;

public class DayVO {
   private String day;
   private int wom;
   private String year;
   private String month;
   public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public String getMonth() {
	return month;
}
public void setMonth(String month) {
	this.month = month;
}
public String getDay() {
      return day;
   }
   public void setDay(String day) {
      this.day = day;
   }
   public int getWom() {
      return wom;
   }
   public void setWom(int wom) {
      this.wom = wom;
   }
}