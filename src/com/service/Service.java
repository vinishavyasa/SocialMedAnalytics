package com.service;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

import com.bean.BarChartBean;
import com.bean.HeatMapBean;
import com.bean.HistoryBean;
import com.bean.StackedBarChartBean;
import com.bean.UserBean;
import com.bean.WordCloudBean;
import com.dao.SocialMediaAnalyticsDAO;

public class Service {

	SocialMediaAnalyticsDAO smaObj = new SocialMediaAnalyticsDAO();
	public Service() {
		
		// TODO Auto-generated constructor stub
	}
	
	public double []  AnalyzeVendorFeeds(String vendorName, String socialNetwork, String fromDateString, String toDateString){
		
		/*double[] percentageArray = new double[4];		*/
		return smaObj.AnalyzeVendorFeeds(vendorName, socialNetwork, fromDateString, toDateString);
		
	}
	
	public HeatMapBean[]  generateHeatMap(int analysisId) throws FileNotFoundException{
		
		/*double[] percentageArray = new double[4];		*/
		ArrayList<HeatMapBean> beanArrayList = new ArrayList<HeatMapBean>();
		beanArrayList = smaObj.heatMapGeneration(analysisId);

		HeatMapBean[] heatMapArray = new HeatMapBean[beanArrayList.size()];

		for (int i = 0; i < beanArrayList.size(); i++) {
			heatMapArray[i] = beanArrayList.get(i);
			//System.out.println(beanArrayList.get(i));
		}
		System.out.println("In Service before return");
		return heatMapArray;
		
	}

	public WordCloudBean[]  getWordCloudPos(int analysisId, String status) {
		
		 ArrayList<WordCloudBean> wordCloudArrayList = new ArrayList<WordCloudBean>();		
		 wordCloudArrayList = smaObj.getWordCloudPos(analysisId, status);
		 WordCloudBean[] wordCloudArray = new WordCloudBean[wordCloudArrayList.size()];
		 
		 for (int i = 0; i < wordCloudArrayList.size(); i++) {
			 wordCloudArray[i] = wordCloudArrayList.get(i);
			}		 
		
		System.out.println("In Service before return");
		return wordCloudArray;
		
	}
	
	public BarChartBean[]  getBarChart(int analysisId, String status) {
		
		 ArrayList<BarChartBean> barChartArrayList = new ArrayList<BarChartBean>();		
		 barChartArrayList = smaObj.barChart(analysisId, status);
				 BarChartBean[] barChartArray = new BarChartBean[barChartArrayList.size()];
		 
		 for (int i = 0; i < barChartArrayList.size(); i++) {
			 barChartArray[i] = barChartArrayList.get(i);
			}		 
		
		System.out.println("In Service before return");
		return barChartArray;
		
	}
	
	
	public StackedBarChartBean[]  getStackedBarChart(int analysisId, String status, String gender) {
		
		 ArrayList<StackedBarChartBean> stackedBarChartArrayList = new ArrayList<StackedBarChartBean>();		
		 stackedBarChartArrayList = smaObj.getStackedBarChart(analysisId, status, gender);
				 StackedBarChartBean[] stackedBarChartArray = new StackedBarChartBean[stackedBarChartArrayList.size()];
		 
		 for (int i = 0; i < stackedBarChartArrayList.size(); i++) {
			 stackedBarChartArray[i] = stackedBarChartArrayList.get(i);
			}		 
		
		System.out.println("In Service before return");
		return stackedBarChartArray;
		
	}
	public void addUser(String firstName, String lastName, String userName, String email, String password, String vendorName, String[] competitor){
		smaObj.addUser(firstName, lastName, userName, email, password, vendorName, competitor);
	}
	
	public UserBean getUser(String email) {
		return smaObj.getUser(email);
	}

	public void addHistory(String userName, String vendorName, String socialNetwork, String fromDateString, String toDateString) {
		smaObj.addHistory(userName, vendorName, socialNetwork, fromDateString, toDateString);
	}
	
	public ArrayList<HistoryBean> getHistory (String userName) {
		return smaObj.getHistory(userName);
	}
	
	public ArrayList<String> getLocationData(int analysisId) {
		return smaObj.getYelpLocationData(analysisId);
	}
	

	public ArrayList<String> collectTweetText(int analysisId) {
		return smaObj.collectTweetText(analysisId);
	}
	
}