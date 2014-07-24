package com.bean;

import java.io.*;
import java.util.*;

public class UserBean {
	
	  private String firstName;
	  private String lastName;
	  private String email;
	  private String userName;
	  private String password1;
	  private String password2;
	  private String zip;
	  private String vendorName;
	  private String jobName;
	  private String[] competitor;
	  private String[] socMed;
	  private String result;
	  private Hashtable<String, String> errors;
	  
	  public boolean validate() {
	    boolean bool=true;
	    if (firstName.equals("")) {
	      errors.put("firstName","Please enter your first name");
	      firstName="";
	      bool=false;
	    }
	    
	    if (lastName.equals("")) {
	      errors.put("lastName","Please enter your last name");
	      lastName="";
	      bool=false;
	    }
	    
	    if (email.equals("") || (email.indexOf('@') == -1)) {
	      errors.put("email","Please enter a valid email address");
	      email="";
	      bool=false;
	    }
	    if (userName.equals("")) {
	      errors.put("userName","Please enter a username");
	      userName="";
	      bool=false;
	    }
	    if (password1.equals("") ) {
	      errors.put("password1","Please enter a valid password");
	      password1="";
	      bool=false;
	    }
	    if (!password1.equals("") && (password2.equals("") || 
	        !password1.equals(password2))) {
	      errors.put("password2","Please confirm your password");
	      password2="";
	      bool=false;
	    }
	    if (zip.equals("") || zip.length() !=5 ) {
	      errors.put("zip","Please enter a valid zip code");
	      zip="";
	      bool=false;
	    } else {
	      try {
	        int x = Integer.parseInt(zip);
	      } catch (NumberFormatException e) {
	        errors.put("zip","Please enter a valid zip code");
	        zip="";
	        bool=false;
	      }
	    }
	    
	    if (vendorName.equals("")) {
		      errors.put("vendorName","Please enter your Retailer name");
		      vendorName="";
		      bool=false;
		    }
	    
	    if (jobName.equals("")) {
		      errors.put("jobName","Please enter your Job name");
		      jobName="";
		      bool=false;
		    }
	    return bool;
	  }
	  public String getErrorMsg(String s) {
	    String errorMsg =(String)errors.get(s.trim());
	    return (errorMsg == null) ? "":errorMsg;
	  }
	  
	  
	  public UserBean() {
	    firstName="";
	    lastName="";
	    email="";
	    userName="";
	    password1="";
	    password2="";
	    zip="";
	    vendorName="";
	    jobName="";
	    competitor=new String[]{"1"};
	    socMed = new String[] { "1" };
	    result="";
	    errors = new Hashtable<String, String>();
	  }
	  public String getFirstName() {
	    return firstName;
	  }
	  public String getLastName() {
	    return lastName;
	  }
	  public String getEmail() {
	    return email;
	  }
	  public String getUserName() {
	    return userName;
	  }
	  public String getPassword1() {
	    return password1;
	  }
	  public String getPassword2() {
	    return password2;
	  }
	  public String getZip() {
	    return zip;
	  }
	  
	  public String getVendorName(){
		  return vendorName;
	  }
	  
	  public String getJobName(){
		  return jobName;
	  }
	  public String getResult() {
	    return result;
	  }
	  public String[] getCompetitor(){
		  return competitor;
	  }
	  
	  public String isCbSelectedcomp(String c){
		  boolean found=false;
		  if (!competitor[0].equals("1")){
			  for (int i=0;i < competitor.length; i++){
				  if(competitor[i].equals(c)){
					  found=true;
					  break;
				  }
			  }
			  if(found) return "checked";
		  }
		  return "";
		  
		  
	  }
	  public String[] getSocMed() {
	    return socMed;
	  }
	  public String isCbSelected(String s) {
	    boolean found=false;
	    if (!socMed[0].equals("1")) {
	      for (int i = 0; i < socMed.length; i++) {
	        if (socMed[i].equals(s)) {
	          found=true;  
	          break;
	        }
	      }
	      if (found) return "checked";
	    } 
	    return "";
	  }
	  public String isRbSelected(String s) {
	    return (result.equals(s))? "checked" : "";
	  }
	  public void setFirstName(String fname) {
	    firstName =fname;
	  }
	  public void setLastName(String lname) {
	    lastName =lname;
	  }
	  public void setEmail(String eml) {
	    email=eml;
	  }
	  public void setUserName(String u) {
	    userName=u;
	  }
	  public void  setPassword1(String p1) {
	    password1=p1;
	  }
	  public void  setPassword2(String p2) {
	    password2=p2;
	  }
	  public void setZip(String z) {
	    zip=z;
	  }
	  
	  public void setVendorName(String r){
		  vendorName= r;
	  }
	  
	  public void setJobName(String j){
		  jobName = j;
	  }
	  
	  public void setCompetitor(String[] comp){
		  competitor = comp;
	  }
	  public void setSocTech(String[] sol) {
	    socMed=sol;
	  }
	  public void setErrors(String key, String msg) {
	    errors.put(key,msg);
	  }
	  public void setNotify(String n) {
	    result=n;
	  }

}
