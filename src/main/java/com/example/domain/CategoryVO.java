package com.example.domain;

public class CategoryVO {

   private String categorycode;
   private String categoryname;
   
   
   public String getCategorycode() {
      return categorycode;
   }
   public void setCategorycode(String categorycode) {
      this.categorycode = categorycode;
   }
   public String getCategoryname() {
      return categoryname;
   }
   public void setCategoryname(String categoryname) {
      this.categoryname = categoryname;
   }
   
   
   @Override
   public String toString() {
      return "CategoryVO [categorycode=" + categorycode + ", categoryname=" + categoryname + "]";
   }
   
   
}