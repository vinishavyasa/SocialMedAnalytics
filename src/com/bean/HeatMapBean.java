package com.bean;

public class HeatMapBean {
	private int count;
	private String location;	
	
	public HeatMapBean()
	{
		this.getLocation();
		this.getCount();
	}
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	
}
